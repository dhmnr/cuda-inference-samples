# deviceQuery - Device Query

## Description

This sample enumerates the properties of all CUDA-capable devices present in the system and displays detailed information about their capabilities. It provides information about compute capability, memory hierarchy, multiprocessor configuration, and feature support.

## Key Concepts

Device Properties, CUDA Runtime API, GPU Architecture

## Supported SM Architectures

SM 5.0 SM 5.2 SM 5.3 SM 6.0 SM 6.1 SM 7.0 SM 7.2 SM 7.5 SM 8.0 SM 8.6 SM 8.7 SM 8.9 SM 9.0

## Supported OSes

Linux, Windows

## Supported CPU Architecture

x86_64, arm64, armv7l

## CUDA APIs involved

### CUDA Runtime API
`cudaGetDeviceCount`, `cudaGetDeviceProperties`, `cudaRuntimeGetVersion`, `cudaDriverGetVersion`

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
$ deviceQuery.exe
```

### Linux
```bash
$ cd <project_root>
$ mkdir build && cd build
$ cmake ..
$ make
$ ./bin/deviceQuery
```

## Sample Output

```
=== CUDA Device Query ===

CUDA Runtime Version: 13.0
CUDA Driver Version: 13.0

Detected 1 CUDA-capable device(s)

========================================
Device 0: NVIDIA GeForce RTX 4090
========================================

Compute Capability:
  Major: 8
  Minor: 9
  Version: 8.9

Memory:
  Total global memory: 24.00 GB
  Total constant memory: 64.00 KB
  Shared memory per block: 48.00 KB
  L2 cache size: 72.00 MB
  Memory clock rate: 10.50 GHz
  Memory bus width: 384-bit
  Peak memory bandwidth: 1008.00 GB/s

Multiprocessors:
  Number of SMs: 128
  Max threads per SM: 1536
  Total CUDA cores: ~6144

Thread/Block Configuration:
  Max threads per block: 1024
  Max block dimensions: [1024, 1024, 64]
  Max grid dimensions: [2147483647, 65535, 65535]
  Warp size: 32
  Registers per block: 65536
  Registers per SM: 65536

Clock Rates:
  GPU clock rate: 2.52 GHz
  Memory clock rate: 10.50 GHz

Features:
  Concurrent kernels: Yes
  ECC enabled: No
  Unified addressing: Yes
  Managed memory: Yes
  Multi-GPU board: No
  Cooperative launch: Yes
  Async engine count: 2
  PCI bus ID: 1
  PCI device ID: 0

========================================
Device query completed successfully.
========================================
```

## References

- [CUDA C Programming Guide](https://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html)
- [CUDA Runtime API](https://docs.nvidia.com/cuda/cuda-runtime-api/index.html)
