#include <stdio.h>
#include <mpi.h>
#include <string.h>
#include <math.h>

int isPrime(int n)
{
	int isprime = 1;
	for (int i = 2; i <= sqrt(n * 1.0); i++)
	{
		if (n % i == 0)
		{
			isprime = 0;
			break;
		}
	}
	return isprime;
}

int main(int argc, char* argv[])
{
	int tid, size;
	int n, sum = 0, local = 0;
	double startTime, endTime, time;

	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &tid);
	MPI_Comm_size(MPI_COMM_WORLD, &size);

	if (tid == 0) {
		scanf_s("%d", &n);
	}

	//MPI_Bcast(&n, 1, MPI_INT, 0, MPI_COMM_WORLD);
	startTime = MPI_Wtime();
	//>2偶数不会是质数
	for (int i = tid * 2 + 1; i <= n; i += size * 2) {
		local += isPrime(i);
	}
	
	MPI_Reduce(&local, &sum, 1, MPI_INT, MPI_SUM, 0, MPI_COMM_WORLD);
	endTime = MPI_Wtime();
	time = endTime - startTime;

	if (tid == 0) {
		printf("time = %fs\n", time);
		printf("count = %d\n", sum);
	}

	MPI_Finalize();
	return 0;
}
