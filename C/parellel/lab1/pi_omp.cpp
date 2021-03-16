#include<stdio.h>
#include<omp.h>
#include<math.h>


int main(int argc, char* argv[])
{
    int thrnum, maxn;
    int i;
    double local, tmp, pi, w;
    double startTime, endTime, time;
    sscanf_s(argv[1], "%d", &thrnum);
    sscanf_s(argv[2], "%d", &maxn);
    
    omp_set_num_threads(thrnum);

    w = 1.0 / maxn;
    pi = 0;

    startTime = omp_get_wtime();
    #pragma omp parallel for default(shared) private(i, local, tmp) reduction(+ : pi)
    for (i = 0; i < maxn; i++)
    {
        local = (i + 0.5) * w;
        tmp = 4.0 / (1.0 + local * local);
        pi += tmp;
    }
    endTime = omp_get_wtime();

    pi = pi * w;
    time = (endTime - startTime);
    printf("pi = %.15lf\ntime = %fs\n", pi, time);

    return 0;
}