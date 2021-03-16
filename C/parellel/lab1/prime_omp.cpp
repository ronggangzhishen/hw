#include<stdio.h>
#include<omp.h>
#include<math.h>


int main(int argc, char* argv[])
{
    int thrnum, maxn;
    int m, k, i, count = 0;
    double startTime, endTime, time;
    sscanf_s(argv[1], "%d", &thrnum);
    sscanf_s(argv[2], "%d", &maxn);
    
    omp_set_num_threads(thrnum);

    startTime = omp_get_wtime();
    #pragma omp parallel for default(shared) reduction(+:count) private(i,k,m)
    for (m = 2; m <= maxn; m = m + 1)
    {
        k = sqrt(m);
        for (i = 2; i <= k; i++)
        {
            if (m % i == 0) break;
        }
        if (i > k)
        {
        //#pragma omp atomic              
            count++;
        }
    }
    endTime = omp_get_wtime();
    time = (endTime - startTime);
    printf("count = %d\ntime = %fs\n", count, time);

    return 0;
}