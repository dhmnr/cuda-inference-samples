#ifndef HELPER_CUDA_H
#define HELPER_CUDA_H

#include <cuda_runtime.h>
#include <stdio.h>
#include <stdlib.h>

// CUDA error checking macro
#define CUDA_CHECK(call)                                                       \
  do {                                                                         \
    cudaError_t error = call;                                                  \
    if (error != cudaSuccess) {                                                \
      fprintf(stderr, "CUDA error at %s:%d: %s\n", __FILE__, __LINE__,         \
              cudaGetErrorString(error));                                      \
      exit(EXIT_FAILURE);                                                      \
    }                                                                          \
  } while (0)

// CUDA kernel launch error checking
#define CUDA_CHECK_KERNEL()                                                    \
  do {                                                                         \
    cudaError_t error = cudaGetLastError();                                    \
    if (error != cudaSuccess) {                                                \
      fprintf(stderr, "CUDA kernel launch error at %s:%d: %s\n", __FILE__,     \
              __LINE__, cudaGetErrorString(error));                            \
      exit(EXIT_FAILURE);                                                      \
    }                                                                          \
    error = cudaDeviceSynchronize();                                           \
    if (error != cudaSuccess) {                                                \
      fprintf(stderr, "CUDA kernel execution error at %s:%d: %s\n", __FILE__,  \
              __LINE__, cudaGetErrorString(error));                            \
      exit(EXIT_FAILURE);                                                      \
    }                                                                          \
  } while (0)

#endif // HELPER_CUDA_H
