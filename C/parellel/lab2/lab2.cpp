#include <stdio.h>
#include <mpi.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>
#include <time.h>

#define v_max 20    //车辆最高速度
#define car_num 1000000  //车辆数
#define cycle 300      //周期数
#define p 0.5       //随机减速的概率

int main(int argc, char* argv[]) {
    int size, rank;
    //int car_num =  100, cycle = 10;
    int *v, *position;
    int td;
    double randNum;
    double startTime = 0, endTime, costTime;

    srand((unsigned int)(time(NULL)));

    //scanf_s("%d %d", &car_num, &cycle);
    position = (int*)malloc(car_num * sizeof(int));
    v = (int*)malloc(car_num * sizeof(int));

    //MPI_Status status;
    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);

    startTime = MPI_Wtime();

    //位置从0开始,0号车在0号位置,其他车从-1陆续往后排,类似高速路口
    for (int j = rank * car_num / size; j < (rank + 1) * car_num / size; j++) {
        position[j] = -j;
        v[j] = 0;
    }

    if (size > 1) {
        for (int j = 0; j < size; j++) {
            MPI_Bcast(&position[(j + 1) * (car_num / size) - 1], 1, MPI_INT, j, MPI_COMM_WORLD);
        }
    }
    MPI_Barrier(MPI_COMM_WORLD);

    //    将车流从前向后分为相同的size个部分,每部分交给一个线程处理
    for (int i = 0; i < cycle; i++) {
        //先并行地把速度更新
        //for (int j = rank; j < car_num; j += size) {
        for (int j = rank * car_num / size; j < (rank+1) * car_num / size; j++) {
            //对可以变速的车更新速度
            if (j == 0) {
                if (v[j] < v_max)
                    v[j]++;
            }
            else {
                td = position[j - 1] - position[j];
                if (v[j] >= td - 1) {          //刚好或快了就减速
                    v[j] = td - 1;
                }
                else if (v[j] < v_max && td > v[j]) {//没堵就加速
                    v[j]++;
                }
            }
            //按照概率p减速
            randNum = rand() / (double)RAND_MAX;
            if (randNum < p) {
                if (v[j] > 0) {
                    v[j]--;
                }
            }
        }
        MPI_Barrier(MPI_COMM_WORLD);

        /******等v全部更新完才能更新position******/
        //再并行地把位置更新
        //for (int j = rank; j < car_num; j += size) {
        for (int j = rank * car_num / size; j < (rank + 1) * car_num / size; j++) {
            position[j] += v[j];
        }
        MPI_Barrier(MPI_COMM_WORLD);

        //不同块之间只需要单向通信一个在边界处的position信息
        //例0号车流将最后一辆车的position信息传给1号车流,1给2...
        if (size > 1) {
            for (int j = 0; j < size; j++) {
                MPI_Bcast(&position[(j+1) * (car_num / size) - 1], 1, MPI_INT, j, MPI_COMM_WORLD);
            }
        }
        MPI_Barrier(MPI_COMM_WORLD);
    }

    endTime = MPI_Wtime();
    costTime = endTime - startTime;

    if (size > 1) {
        for (int j = 1; j < size; j++) {
            MPI_Bcast(&position[j * (car_num / size)], (car_num / size), MPI_INT, j, MPI_COMM_WORLD);
            MPI_Bcast(&v[j * (car_num / size)], (car_num / size), MPI_INT, j, MPI_COMM_WORLD);
        }
    }
    MPI_Barrier(MPI_COMM_WORLD);

    if (rank == 0) {
        printf("cost time = %lfs\n", costTime);
        for (int i = 0; i < car_num; i++) {
            printf("%d\t%d\t%d\n", i, position[i], v[i]);
            //printf("car_num: %10d\tposition: %10d\tv: %3d\n", i, position[i], v[i]);
        }
    }


    MPI_Finalize();
    free(position); free(v);
    return 0;
}