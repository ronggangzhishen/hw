#include <stdio.h>
#include <mpi.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>
#include <time.h>

#include <iostream>
#include <algorithm>

using namespace std;

#define N 5000000		//数据总数
#define ceiling 100000	//数值上限

//传给qsort的比较函数
int cmp(const void* a, const void* b)
{
    if (*(int*)a < *(int*)b)
        return -1;
    if (*(int*)a > * (int*)b)
        return 1;
    else
        return 0;
}
//在PSRS最后一步使用的函数
void SortSub(int* partitions, int* partitionCount, int size, int rank, int* data)
{
    int* subSorted;
    int* rdispls, * idx, * partitionEnds, * subCount, total;
    idx = (int*)malloc(size * sizeof(int));
    partitionEnds = (int*)malloc(size * sizeof(int));
    idx[0] = 0;
    total = partitionCount[0];
    for (int i = 1; i < size; i++)
    {
        total += partitionCount[i];
        idx[i] = idx[i - 1] + partitionCount[i - 1];
        partitionEnds[i - 1] = idx[i];
    }
    partitionEnds[size - 1] = total;

    subSorted = (int*)malloc(total * sizeof(int));
    subCount = (int*)malloc(size * sizeof(int));
    rdispls = (int*)malloc(size * sizeof(int));

    // 归并排序
    for (int i = 0; i < total; i++)
    {
        int lowest = ceiling;
        int ind = -1;
        for (int j = 0; j < size; j++)
        {
            if ((idx[j] < partitionEnds[j]) && (partitions[idx[j]] < lowest))
            {
                lowest = partitions[idx[j]];
                ind = j;
            }
        }
        subSorted[i] = lowest;
        idx[ind] += 1;
    }
    // 发送各子列表的大小回根进程中
    MPI_Gather(&total, 1, MPI_INT, subCount, 1, MPI_INT, 0, MPI_COMM_WORLD);

    // 计算根进程上的相对于recvbuf的偏移量
    if (rank == 0)
    {
        rdispls[0] = 0;
        for (int i = 1; i < size; i++)
            rdispls[i] = subCount[i - 1] + rdispls[i - 1];
    }

    //发送各排好序的子列表回根进程中
    MPI_Gatherv(subSorted, total, MPI_INT, data, subCount, rdispls, MPI_INT, 0, MPI_COMM_WORLD);

    free(partitionEnds);
    free(subSorted);
    free(idx);
    free(subCount);
    free(rdispls);
    return;
}

void PSRS(int* data)
{
    int size, rank;
    int size2, * partitionCount, * rPartitionCount;
    int subArraySize, startIdx, endIdx, * sample, * rPartitions;
    double startTime = MPI_Wtime();

    MPI_Comm_size(MPI_COMM_WORLD, &size);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    size2 = size * size;
    sample = (int*)malloc(size2 * sizeof(int));
    partitionCount = (int*)malloc(size * sizeof(int));
    rPartitionCount = (int*)malloc(size * sizeof(int));

    for (int i = 0; i < size; i++)
        partitionCount[i] = 0;

    //a 将所有元素均匀划分为size段
    startIdx = rank * N / size;
    if (rank + 1 == size)   //防止没有对齐
        endIdx = N;
    else
        endIdx = (rank + 1) * N / size;
    subArraySize = endIdx - startIdx;
    MPI_Barrier(MPI_COMM_WORLD);

    //b 对子数组进行局部排序
    qsort(data + startIdx, subArraySize, sizeof(data[0]), cmp);

    //c 对每个子数组正则采样
    int localN = N / size;
    for (int i = 0; i < size; i++)
    {
        int idx = rank * localN + i * (localN / size);
        sample[rank * size + i] = *(data + idx);
    }
    MPI_Barrier(MPI_COMM_WORLD);

    //d,e 样本排序并选择主元
    int* pivot = (int*)malloc((size - 1) * sizeof(sample[0])); //主元
    if (rank == 0)
    {
        qsort(sample, size, sizeof(sample[0]), cmp); //对正则采样的样本进行排序

        // 采样排序后进行主元的选择
        for (int i = 0; i < (size - 1); i++)
            pivot[i] = sample[(((i + 1) * size) + (size / 2)) - 1];
    }
    MPI_Bcast(pivot, size - 1, MPI_INT, 0, MPI_COMM_WORLD);
    MPI_Barrier(MPI_COMM_WORLD);

    //f 各处理器按主元划分子数组
    int index = 0;
    for (int i = 0; i < subArraySize; i++)
    {
        if (data[startIdx + i] > pivot[index])
        {
            index += 1;
        }
        if (index == size)
        {
            partitionCount[size - 1] = subArraySize - i + 1;
            break;
        }
        partitionCount[index]++; //划分大小自增
    }
    free(pivot);
    MPI_Barrier(MPI_COMM_WORLD);

    //g 各处理器将划分交换到对应的处理器
    int count = 0;
    int* sdispls = (int*)malloc(size * sizeof(int));
    int* rdispls = (int*)malloc(size * sizeof(int));

    // 全局到全局的发送
    MPI_Alltoall(partitionCount, 1, MPI_INT, rPartitionCount, 1, MPI_INT, MPI_COMM_WORLD);

    // 计算划分的总大小，并给新划分分配空间
    for (int i = 0; i < size; i++)
    {
        count += rPartitionCount[i];
    }
    rPartitions = (int*)malloc(count * sizeof(int));

    sdispls[0] = 0;
    rdispls[0] = 0;
    for (int i = 1; i < size; i++)
    {
        sdispls[i] = partitionCount[i - 1] + sdispls[i - 1];
        rdispls[i] = rPartitionCount[i - 1] + rdispls[i - 1];
    }

    //发送数据，实现n次点对点通信
    MPI_Alltoallv(&(data[startIdx]), partitionCount, sdispls, MPI_INT, rPartitions, rPartitionCount, rdispls, MPI_INT, MPI_COMM_WORLD);

    free(sdispls);
    free(rdispls);

    //h 归并排序
    SortSub(rPartitions, rPartitionCount, size, rank, data);

    //end
    double EndTime = MPI_Wtime();

    if (rank == 0)
    {
        //在数据太大时不显示
        /*printf("Sorted:\n");
        for (int i = 0; i < N; i++)
            printf("%d\t",data[i]);
        printf("\n");*/
        printf("cost time = %lfs\n", EndTime - startTime);
    }

    if (size > 1)
    {
        free(rPartitions);
    }
    free(partitionCount);
    free(rPartitionCount);
    free(sample);
    free(data);

    MPI_Finalize();
}

int main(int argc, char* argv[])
{
    int size, rank;
    srand((unsigned int)(time(NULL)));

    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);

    int start = 0;
    start = N + size - N % size;

    int* data = new int[start];
    for (int i = 0; i < N; i++)
        data[i] = rand() % ceiling;
    
    for (int i = N; i < start; i++)
        data[i] = 0;

    //在数据太大时不显示
    /*if (rank == 0)
    {
        printf("Original:\n");
        for (int i = 0; i < N; i++)
            printf("%d\t", data[i]);
        printf("\n");
    }*/

    PSRS(data);

    return 0;
}
