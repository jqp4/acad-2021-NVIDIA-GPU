#include <mpi.h>
#include <time.h>
#include <cstdlib>
#include <iostream>

/*
1 - job info outputfile. format: [number_of_nodes, ntasks_per_node, proc_names, operation_type, number_of_iterations, message_size, exec_time, date, start_time, end_time]
2 - number of iterations
3 - output csv file to store times of every batch
4 - batch size
*/

void fprint_job_info(int argc, char **argv, double max_all_time, double *max_time_stamps, time_t start_time, int N_MEASURES) {
	int rank;
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	FILE *f;

	time_t start_all_time;
    
    MPI_Reduce(&start_time, &start_all_time, 1, MPI_LONG, MPI_MIN, 0, MPI_COMM_WORLD);
    struct tm *ptm;

	if ( ! rank) {
		/*write general job info*/
		f = fopen(argv[1], "a");
		fprintf(f, "barrier,");
		fprintf(f, "%s,", argv[2]);
		fprintf(f, "%e,", max_all_time);

        ptm = gmtime(&start_all_time);
		fprintf(f, "%4d-%02d-%02d,", ptm->tm_year + 1900, ptm->tm_mon + 1, ptm->tm_mday);
		fprintf(f, "%02d:%02d:%02d,", (ptm->tm_hour + 3)%24, ptm->tm_min, ptm->tm_sec);

        time_t finish_time;
        finish_time = time(NULL);
        ptm = gmtime(&finish_time);
		fprintf(f, "%02d:%02d:%02d\n", (ptm->tm_hour + 3)%24, ptm->tm_min, ptm->tm_sec);

		fclose(f);

		/*write info on every 1m iterations to a separate file*/
		f = fopen(argv[3], "a");
        fprintf(f, "%02d:%02d:%02d,", (ptm->tm_hour + 3)%24, ptm->tm_min, ptm->tm_sec);
		fprintf(f, "%e", max_time_stamps[0]);
		for (long int i = 1; i < N_MEASURES; ++i)
        	fprintf(f, ",%e", max_time_stamps[i]);
        fprintf(f, "\n");
        fclose(f);
	}
}

int main(int argc, char **argv) {
    // const int MESSAGE_SIZE = atoi(argv[2]);
    const int ITER_COUNT = atoi(argv[2]);
    const int SEGM_ITER = atoi(argv[4]);
    int rank, size;
    double start, finish, result, max_result_time;
    double all_start, all_finish, all_time, max_all_time;
    FILE *f;

    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);

    time_t start_time;
    start_time = time(NULL);

    long int N_MEASURES = ITER_COUNT / SEGM_ITER;
    double *time_stamps = new double [N_MEASURES];
    double *max_time_stamps = new double [N_MEASURES];

    /*start MPI Collective operation*/

    for(int i = 0; i < 10; ++i)
        MPI_Barrier(MPI_COMM_WORLD);
    MPI_Barrier(MPI_COMM_WORLD);
    all_start = MPI_Wtime();
    for(long int j = 0; j < N_MEASURES; ++j) {
    	start = MPI_Wtime();
    	for(int i = 0; i < SEGM_ITER; ++i) {
            MPI_Barrier(MPI_COMM_WORLD);
    	}
        finish = MPI_Wtime();
        time_stamps[j] = finish - start;
    }
    all_finish = MPI_Wtime();
    /*-------------------------------*/

    /*fprint time of mpi collectives execution*/
    all_time = all_finish - all_start;
    MPI_Reduce(time_stamps, max_time_stamps, N_MEASURES, MPI_DOUBLE, MPI_MAX, 0, MPI_COMM_WORLD);
    MPI_Reduce(&all_time, &max_all_time, 1, MPI_DOUBLE, MPI_MAX, 0, MPI_COMM_WORLD);
    
    fprint_job_info(argc, argv, max_all_time, max_time_stamps, start_time, N_MEASURES);

    delete [] time_stamps;
    delete [] max_time_stamps;
    /*-------------------------------*/

    MPI_Finalize();
    return 0;
}
