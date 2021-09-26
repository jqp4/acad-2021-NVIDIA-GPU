#include <cuda.h>
#include <math.h>
#include <chrono>
#include <cstdlib>
#include <ctime>
#include <iostream>

//РИМЕР : СЛОЖЕНИЕ ВЕКТОРОВ, ДЕВАЙС-КОД
/*__global__ void sum_kernel(int* A, int* B, int* C) {
  int idx = blockIdx.x * blockDim.x + threadIdx.x;
  //определить свой индекс
  int a = A[idx];
  // считать нужный элемент A
  int b = B[idx];
  // считать нужный элемент B
  C[idx] = a + b;
  // записать результат суммирования
}*/

int main() {
  // Size of vectors
  int n = 100000;
  // Host vectors
  double *h_a, *h_b, *h_c;
  // Size, in bytes, of each vector
  size_t bytes = n * sizeof(double);
  // Allocate memory for each vector on host
  h_a = (double*)malloc(bytes);
  h_b = (double*)malloc(bytes);
  h_c = (double*)malloc(bytes);
  int i;
  // Initialize vectors on host
  for (i = 0; i < n; i++) {
    h_a[i] = sin(i) * sin(i);
    h_b[i] = cos(i) * cos(i);
  }
  // Device input vectors
  double *d_a, *d_b, *d_c;
  // Size, in bytes, of each vector
  size_t bytes = n * sizeof(double);
  // Allocate memory for each vector on GPU
  /*cudaMalloc(&d_a, bytes);
  cudaMalloc(&d_b, bytes);
  cudaMalloc(&d_c, bytes);
  // Copy host vectors to device
  cudaMemcpy(d_a, h_a, bytes, cudaMemcpyHostToDevice);
  cudaMemcpy(d_b, h_b, bytes, cudaMemcpyHostToDevice);
  int blockSize, gridSize;
  // Number of threads in each thread block
  blockSize = 1024;
  // Number of thread blocks in grid
  gridSize = (n - 1) / blockSize + 1;
  // Execute the kernel
  vecAdd<<<gridSize, blockSize>>>(d_a, d_b, d_c, n);
  // Copy array back to host
  cudaMemcpy(h_c, d_c, bytes, cudaMemcpyDeviceToHost);
  // Release device memory
  cudaFree(d_a);
  cudaFree(d_b);
  cudaFree(d_c);*/
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
