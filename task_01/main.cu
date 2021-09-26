#include <cuda.h>
#include <math.h>
#include <chrono>
#include <cstdlib>
#include <ctime>
#include <iostream>

__global__ void sum_vectors(double* a, double* b, double* c, int n) {
  size_t idx = blockIdx.x * blockDim.x + threadIdx.x;
  if (idx < n) {
    c[idx] = a[idx] + b[idx];
  }
}

bool check(double* a, double* b, double* c, int n) {
  for (int i = 0; i < n; i++) {
    if (c[i] != a[i] + b[i]) {
      return false;
    }
  }
  return true;
}

int main(int argc, char** argv) {
  // Size of vectors
  int n = atoi(argv[1]);
  // Host vectors
  double *h_a, *h_b, *h_c;
  // Size, in bytes, of each vector
  size_t bytes = n * sizeof(double);
  // Allocate memory for each vector on host
  h_a = (double*)malloc(bytes);
  h_b = (double*)malloc(bytes);
  h_c = (double*)malloc(bytes);
  // Initialize vectors on host
  for (int i = 0; i < n; i++) {
    h_a[i] = sin(i) * sin(i);
    h_b[i] = cos(i) * cos(i);
  }
  // Device input vectors
  double *d_a, *d_b, *d_c;
  // Size, in bytes, of each vector
  // size_t bytes = n * sizeof(double);
  // Allocate memory for each vector on GPU
  cudaMalloc(&d_a, bytes);
  cudaMalloc(&d_b, bytes);
  cudaMalloc(&d_c, bytes);
  // Copy host vectors to device
  cudaMemcpy(d_a, h_a, bytes, cudaMemcpyHostToDevice);
  cudaMemcpy(d_b, h_b, bytes, cudaMemcpyHostToDevice);

  // -------------------------------------

  // Number of threads in each thread block
  int blockSize = 1024;
  // Number of thread blocks in grid
  int gridSize = (n - 1) / blockSize + 1;
  // create gpu timer
  cudaEvent_t start_gpu, stop_gpu;
  cudaEventCreate(&start_gpu);
  cudaEventCreate(&stop_gpu);
  cudaEventRecord(start_gpu);
  // Execute the kernel
  sum_vectors<<<gridSize, blockSize>>>(d_a, d_b, d_c, n);
  // get gpu time
  cudaDeviceSynchronize();
  cudaEventRecord(stop_gpu);
  float time_gpu = 0;
  cudaEventElapsedTime(&time_gpu, start_gpu, stop_gpu);
  // Copy array back to host
  cudaMemcpy(h_c, d_c, bytes, cudaMemcpyDeviceToHost);

  /*// create cpu timer
  auto start_cpu = high_resolution_clock::now();
  // check result
  bool res = check(h_a, h_b, h_c, n);
  // get cpu time
  auto stop_cpu = high_resolution_clock::now();
  auto time_cpu = stop_cpu - start_cpu;
  time_cpu = time_cpu.count() / 1000;*/

  // create cpu timer
  cudaEvent_t start_cpu, stop_cpu;
  cudaEventCreate(&start_cpu);
  cudaEventCreate(&stop_cpu);
  cudaEventRecord(start_cpu);
  // check result
  bool res = check(h_a, h_b, h_c, n);
  // get cpu time
  cudaDeviceSynchronize();
  cudaEventRecord(stop_cpu);
  float time_cpu = 0;
  cudaEventElapsedTime(&time_cpu, start_cpu, stop_cpu);


  if (res) {
    printf("correct\n");
  } else {
    printf("incorrect\n");
  }

  printf("CPU time: %10f ms\n", time_cpu);
  printf("GPU time: %10f ms\n", time_gpu);

  // Release device memory
  cudaFree(d_a);
  cudaFree(d_b);
  cudaFree(d_c);
  // Release host memory
  free(h_a);
  free(h_b);
  free(h_c);
  return 0;
}

/*cudaEvent_t start, stop;
cudaEventCreate(&start);
cudaEventCreate(&stop);
cudaMemcpy(d_x, x, N * sizeof(float), cudaMemcpyHostToDevice);
cudaMemcpy(d_y, y, N * sizeof(float), cudaMemcpyHostToDevice);
cudaEventRecord(start);
saxpy<<<(N + 255) / 256, 256>>>(N, 2.0f, d_x, d_y);
cudaDeviceSynchronize();
cudaEventRecord(stop);
cudaMemcpy(y, d_y, N * sizeof(float), cudaMemcpyDeviceToHost);
cudaEventSynchronize(stop);
float milliseconds = 0;
cudaEventElapsedTime(&milliseconds, start, stop);*/
