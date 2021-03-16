#include <stdio.h>
#include <mpi.h>
#include <string.h>
#include <math.h>



int main(int argc, char* argv[])
{
	int rank, size;
	int i, n=1000;
	double sum, width, t, localpi, pi;
	double startTime=0, endTime, time;

	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &size);

	if (rank == 0) {
		scanf_s("%d", &n);
		startTime = MPI_Wtime();
	}

	//MPI_Bcast(&n, 1, MPI_INT, 0, MPI_COMM_WORLD);
	
	sum = 0.0;
	width = 1.0 / n;
	for (i = rank; i < n; i += size) {
		t = width * ((double)i + 0.5);
		sum += 4.0 / (1.0 + t * t);
	}
	localpi = width * sum;
	MPI_Reduce(&localpi, &pi, 1, MPI_DOUBLE, MPI_SUM, 0, MPI_COMM_WORLD);
	
	endTime = MPI_Wtime();
	time = endTime - startTime;

	if (rank == 0) {
		printf("cost time = %fs\npi = %.15lf\n", time, pi);
	}

	MPI_Finalize();
	return 0;
}
