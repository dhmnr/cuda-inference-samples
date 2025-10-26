# sanityCheck - CUDA Environment Verification

## Description

This sample performs a comprehensive verification of the CUDA environment by testing device detection, memory allocation, data transfers, kernel execution, and result validation. It exercises the fundamental CUDA operations required for any GPU application and reports success or failure of each component. This is the recommended first test to run after installing CUDA.

## Key Concepts

CUDA Runtime API, Device Memory Management, Kernel Execution, Error Handling

## Supported SM Architectures

SM 5.0 SM 5.2 SM 5.3 SM 6.0 SM 6.1 SM 7.0 SM 7.2 SM 7.5 SM 8.0 SM 8.6 SM 8.7 SM 8.9 SM 9.0

## Supported OSes

Linux, Windows

## Supported CPU Architecture

x86_64, arm64, armv7l

## CUDA APIs involved

### CUDA Runtime API
`cudaGetDeviceCount`, `cudaGetDeviceProperties`, `cudaSetDevice`, `cudaMalloc`, `cudaFree`, `cudaMemcpy`, `cudaGetLastError`, `cudaDeviceSynchronize`

## Prerequisites

Download and install the CUDA Toolkit 11.0+ for your corresponding platform.
Make sure the dependencies mentioned in the top-level README are installed.

## Build and Run

### Windows
```bash
$ cd <project_root>
$ mkdir build && cd build
$ cmake ..
$ cmake --build . --config Release
$ cd bin/Release
$ sanity_check.exe
```

### Linux
```bash
$ cd <project_root>
$ mkdir build && cd build
$ cmake ..
$ make
$ ./bin/sanity_check
```

## What This Sample Tests

1. **Device Detection** - Enumerates all CUDA devices in the system
2. **Device Properties** - Retrieves and displays GPU specifications
3. **Memory Allocation** - Allocates device memory (12 MB test)
4. **Host-to-Device Transfer** - Copies data from CPU to GPU
5. **Kernel Execution** - Launches a simple vector addition kernel
6. **Device-to-Host Transfer** - Copies results back to CPU
7. **Result Verification** - Validates computational correctness

## Sample Output

```
=== Simple CUDA Sanity Check ===

Found 1 CUDA device(s)

=== Device 0 ===
Device 0: NVIDIA GeForce RTX 4090
  Compute capability: 8.9
  Total global memory: 24.00 GB
  Multiprocessors: 128
  Max threads per block: 1024
  Max threads per multiprocessor: 1536
  Warp size: 32

Using device 0 for tests

Testing memory allocation...
  ✓ Allocated 12.00 MB on device
  ✓ Copied data to device

Testing kernel launch...
  Grid: 4096 blocks, 256 threads/block
  ✓ Kernel executed successfully
  ✓ Copied results back to host

Verifying results...
  ✓ All 1048576 elements computed correctly

========================================
✓✓✓ ALL SANITY CHECKS PASSED! ✓✓✓
========================================

Your CUDA environment is working correctly.
You can now run other samples in this repository.
```

## Troubleshooting

If the sanity check fails:
- Verify CUDA Toolkit is properly installed
- Update NVIDIA drivers to the latest version
- Ensure `nvcc` is in your system PATH
- Check that your GPU supports the CUDA architectures specified in CMakeLists.txt
- Try running `device_query` first to verify device detection

## References

- [CUDA C Programming Guide](https://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html)
- [CUDA Runtime API](https://docs.nvidia.com/cuda/cuda-runtime-api/index.html)
- [CUDA Installation Guide](https://docs.nvidia.com/cuda/cuda-installation-guide-microsoft-windows/index.html)
