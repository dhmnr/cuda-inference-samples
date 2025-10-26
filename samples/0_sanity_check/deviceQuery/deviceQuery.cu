#include "helper_cuda.h"
#include <cuda_runtime.h>
#include <stdio.h>

int main(int argc, char **argv) {
  printf("=== CUDA Device Query ===\n\n");

  int runtimeVersion = 0;
  CUDA_CHECK(cudaRuntimeGetVersion(&runtimeVersion));
  printf("CUDA Runtime Version: %d.%d\n", runtimeVersion / 1000,
         (runtimeVersion % 100) / 10);

  int driverVersion = 0;
  CUDA_CHECK(cudaDriverGetVersion(&driverVersion));
  printf("CUDA Driver Version: %d.%d\n\n", driverVersion / 1000,
         (driverVersion % 100) / 10);

  int deviceCount = 0;
  CUDA_CHECK(cudaGetDeviceCount(&deviceCount));

  if (deviceCount == 0) {
    fprintf(stderr, "Error: No CUDA-capable devices found!\n");
    return EXIT_FAILURE;
  }

  printf("Detected %d CUDA-capable device(s)\n\n", deviceCount);

  for (int dev = 0; dev < deviceCount; dev++) {
    printf("========================================\n");
    printf("Device %d: ", dev);

    cudaDeviceProp prop;
    CUDA_CHECK(cudaGetDeviceProperties(&prop, dev));

    printf("%s\n", prop.name);
    printf("========================================\n\n");

    printf("Compute Capability:\n");
    printf("  Major: %d\n", prop.major);
    printf("  Minor: %d\n", prop.minor);
    printf("  Version: %d.%d\n\n", prop.major, prop.minor);

    printf("Memory:\n");
    printf("  Total global memory: %.2f GB\n",
           prop.totalGlobalMem / (1024.0 * 1024.0 * 1024.0));
    printf("  Total constant memory: %.2f KB\n", prop.totalConstMem / 1024.0);
    printf("  Shared memory per block: %.2f KB\n",
           prop.sharedMemPerBlock / 1024.0);
    printf("  L2 cache size: %.2f MB\n", prop.l2CacheSize / (1024.0 * 1024.0));
    printf("  Memory bus width: %d-bit\n\n", prop.memoryBusWidth);

    printf("Multiprocessors:\n");
    printf("  Number of SMs: %d\n", prop.multiProcessorCount);
    printf("  Max threads per SM: %d\n", prop.maxThreadsPerMultiProcessor);
    printf("  Total CUDA cores: ~%d\n\n", prop.multiProcessorCount *
                                              prop.maxThreadsPerMultiProcessor /
                                              32 * 32);

    printf("Thread/Block Configuration:\n");
    printf("  Max threads per block: %d\n", prop.maxThreadsPerBlock);
    printf("  Max block dimensions: [%d, %d, %d]\n", prop.maxThreadsDim[0],
           prop.maxThreadsDim[1], prop.maxThreadsDim[2]);
    printf("  Max grid dimensions: [%d, %d, %d]\n", prop.maxGridSize[0],
           prop.maxGridSize[1], prop.maxGridSize[2]);
    printf("  Warp size: %d\n", prop.warpSize);
    printf("  Registers per block: %d\n", prop.regsPerBlock);
    printf("  Registers per SM: %d\n\n", prop.regsPerMultiprocessor);

    printf("Features:\n");
    printf("  Concurrent kernels: %s\n", prop.concurrentKernels ? "Yes" : "No");
    printf("  ECC enabled: %s\n", prop.ECCEnabled ? "Yes" : "No");
    printf("  Unified addressing: %s\n", prop.unifiedAddressing ? "Yes" : "No");
    printf("  Managed memory: %s\n", prop.managedMemory ? "Yes" : "No");
    printf("  Multi-GPU board: %s\n", prop.isMultiGpuBoard ? "Yes" : "No");
    printf("  Cooperative launch: %s\n", prop.cooperativeLaunch ? "Yes" : "No");
    printf("  Async engine count: %d\n", prop.asyncEngineCount);
    printf("  PCI bus ID: %d\n", prop.pciBusID);
    printf("  PCI device ID: %d\n\n", prop.pciDeviceID);
  }

  printf("========================================\n");
  printf("Device query completed successfully.\n");
  printf("========================================\n");

  return EXIT_SUCCESS;
}
