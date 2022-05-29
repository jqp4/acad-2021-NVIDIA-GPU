#include <mpi.h>
#include <unistd.h>
#include <fstream>

#define SIZE 250000
#define WORK_TIME 0.1
#define SLEEP_TIME 0.9
#define BREAK_TIME 600.

int main(int argc, char ** argv){
    MPI_Init(&argc, &argv);
    long long * a = new long long[SIZE];
    for(long long i = 0; i < SIZE; ++i)
        a[i] = i;
    long long sum = 0;
    long long iter_count = 0;
    double t, w, start_t = MPI_Wtime();
    while(true){
        t = MPI_Wtime();
        while(true){
            for(int i = 0; i < SIZE; ++i){
                sum += a[i];
            }
            w = MPI_Wtime();
            if((w - t) > WORK_TIME) break;
        }
        sleep(SLEEP_TIME);
        w = MPI_Wtime();
        if((w - start_t) > BREAK_TIME) break;
        iter_count++;
        sum %= SIZE;
    }
    int rank;
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    FILE * f = fopen(argv[1], "a");
    if(! rank){
        fprintf(f, "cycle worked %d times, sum is %lld\n", iter_count, sum);
    }
    fclose(f);
    MPI_Finalize();
    delete []a;
    return 0;
}
