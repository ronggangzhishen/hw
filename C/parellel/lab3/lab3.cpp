#include <stdio.h>
#include <mpi.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>
#include <time.h>

#define G 6.67e-11	//引力常数
#define M 10000		//质量
#define N 64		//小球个数
#define steps 1000	//移动次数

long double delta_t = 1;

void force(long double* x, long double* y, long double* fx, long double* fy, int bid) {
    int i, x0 = x[bid], y0 = y[bid];
    long double r, sumx = 0, sumy = 0, tcos, tsin;
    for (i = 0; i < N; i++) {
        if (i == bid) {
            continue;
        }
        r = sqrtl((x[i] - x0) * (x[i] - x0) + (y[i] - y0) * (y[i] - y0));
        tcos = (x[i] - x0) / r;
        tsin = (y[i] - y0) / r;
        if (r < 2) {    //防止小球之间的力过大
            r = 2;
        }
        //距离的单位为cm
        sumx += 10000 * G * M * M * tcos / (r * r);
        sumy += 10000 * G * M * M * tsin / (r * r);
    }
    fx[bid] = sumx;
    fy[bid] = sumy;
}

void velocities(long double* vx, long double* vy, long double* fx, long double* fy, int bid) {
    vx[bid] += fx[bid] * delta_t / M;
    vy[bid] += fy[bid] * delta_t / M;
}

void positions(long double* x, long double* y, long double* vx, long double* vy, int bid) {
    //距离的单位为cm
    x[bid] += vx[bid] * delta_t / 100;
    y[bid] += vy[bid] * delta_t / 100;
}

int main(int argc, char* argv[]) {
    int size, rank;
    int edge = sqrt(N);
    long double* x, * y, * fx, * fy, * vx, * vy;
    double startTime, endTime;
	
    x = (long double*)malloc(N * sizeof(long double));
    y = (long double*)malloc(N * sizeof(long double));
    fx = (long double*)malloc(N * sizeof(long double));
    fy = (long double*)malloc(N * sizeof(long double));
    vx = (long double*)malloc(N * sizeof(long double));
    vy = (long double*)malloc(N * sizeof(long double));
	
	//速度清零, 位置摆好
    for (int i = 0; i < N; i++) {
        vx[i] = 0;
        vy[i] = 0;
        x[i] = i % edge;
        y[i] = i / edge;
    }
	
    //MPI_Status status;
    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);
	
    if (rank == 0) {
        startTime = MPI_Wtime();
    }
	
	//移动steps步
    for (int i = 0; i < steps; i++) {
		//先计算受力,改变速度,再移动
        for (int j = N / size * rank; j < N / size * rank + N / size; j++) {
            force(x, y, fx, fy, j);
            velocities(vx, vy, fx, fy, j);
            positions(x, y, vx, vy, j);
        }
		MPI_Barrier(MPI_COMM_WORLD);
		//将本进程计算的力,速度,位置同步到所有进程
        if (size > 1) {
            for (int j = 0; j < size; j++) {
                MPI_Bcast(&x[N / size * j], N / size, MPI_LONG_DOUBLE, j, MPI_COMM_WORLD);
                MPI_Bcast(&y[N / size * j], N / size, MPI_LONG_DOUBLE, j, MPI_COMM_WORLD);
                MPI_Bcast(&vx[N / size * j], N / size, MPI_LONG_DOUBLE, j, MPI_COMM_WORLD);
                MPI_Bcast(&vy[N / size * j], N / size, MPI_LONG_DOUBLE, j, MPI_COMM_WORLD);
                MPI_Bcast(&fx[N / size * j], N / size, MPI_LONG_DOUBLE, j, MPI_COMM_WORLD);
                MPI_Bcast(&fy[N / size * j], N / size, MPI_LONG_DOUBLE, j, MPI_COMM_WORLD);
            }
        }
		MPI_Barrier(MPI_COMM_WORLD);
    }
	
    if (rank == 0) {
        endTime = MPI_Wtime();
        printf("cost time = %lf\n", endTime - startTime);
    }
	
    MPI_Finalize();
	free(x);free(y);free(fx);free(fy);free(vx);free(vy);
    return 0;
}
