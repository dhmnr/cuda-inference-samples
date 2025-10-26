# CUDA Inference Samples

A collection of CUDA kernel samples for LLM inference from scratch, following the structure and patterns of NVIDIA's cuda-samples repository.

## Overview

This repository contains educational CUDA samples demonstrating fundamental GPU computing concepts and inference-related operations. Each sample includes detailed documentation, build instructions, and example output.

## Samples List

### 0. Sanity Check / Device Query

| Sample | Description | Key Concepts |
|--------|-------------|--------------|
| [deviceQuery](samples/0_sanity_check/deviceQuery/) | Enumerates CUDA device properties and capabilities | Device Properties, CUDA Runtime API |


<!-- ### 1. Attention Mechanisms

| Sample | Description | Key Concepts |
|--------|-------------|--------------|
| [attentionKernel](samples/1_attention/) | Scaled dot-product attention implementation | Attention Mechanism, Neural Networks, Softmax | -->

## Prerequisites

- **CUDA Toolkit** 11.0 or later ([Download](https://developer.nvidia.com/cuda-downloads))
- **CMake** 3.18 or later
- **C++14** compatible compiler
  - Windows: Visual Studio 2019 or later with C++ workload
  - Linux: GCC 7.0+ or Clang 6.0+
- **NVIDIA GPU** with compute capability 5.0 or higher

## Quick Start

### Windows (PowerShell)

```powershell
# Clone
git clone <repository-url>
cd cuda-inference-samples

# Build
mkdir build
cd build
cmake ..
cmake --build . --config Release

# Run
cd bin
./0_sanity_check/deviceQuery/deviceQuery.exe  # Check your GPU
./1_attention/attention_kernel.exe            # Run attention example
```

### Linux / macOS

```bash
# Clone
git clone <repository-url>
cd cuda-inference-samples

# Build
mkdir build && cd build
cmake ..
make -j$(nproc)

# Run 
./bin/0_sanity_check/deviceQuery/deviceQuery  # Check your GPU
./bin/1_attention/attention_kernel            # Run attention example
```


## Customizing CUDA Architectures

By default, the project builds for compute capabilities 75, 80, 86, 89, and 90. To customize for your specific GPU:

```bash
cmake -DCMAKE_CUDA_ARCHITECTURES="86" ..
```

### Common GPU Architectures

| GPU Series | Compute Capability | Architecture |
|------------|-------------------|--------------|
| RTX 40xx (Ada) | 89 | sm_89 |
| RTX 30xx (Ampere) | 86 | sm_86 |
| A100 | 80 | sm_80 |
| RTX 20xx / T4 (Turing) | 75 | sm_75 |
| V100 (Volta) | 70 | sm_70 |
| H100 (Hopper) | 90 | sm_90 |

## Adding New Samples

1. Create a new directory under `samples/` with category prefix (e.g., `1_attention/`)
2. Add your CUDA source files (`.cu`, `.cuh`)
3. Create a `CMakeLists.txt` (use existing samples as template)
4. Create a `README.md` following the cuda-samples format
5. Add `add_subdirectory(your_sample)` to `samples/CMakeLists.txt`
6. Update this root README with your sample information

<!-- 
## Troubleshooting

### CUDA Toolkit not found
```
CMake Error: Could not find CUDAToolkit
```
**Solution**: Ensure CUDA is installed and `nvcc` is in your PATH.

### Wrong compute capability
```
nvcc fatal: Unsupported gpu architecture 'compute_XX'
```
**Solution**: Adjust `CMAKE_CUDA_ARCHITECTURES` to match your GPU. -->

## Resources

- [CUDA Programming Guide](https://docs.nvidia.com/cuda/cuda-c-programming-guide/)
- [CUDA Best Practices Guide](https://docs.nvidia.com/cuda/cuda-c-best-practices-guide/)
- [NVIDIA CUDA Samples](https://github.com/NVIDIA/cuda-samples)
- [CUDA Toolkit Documentation](https://docs.nvidia.com/cuda/)

## License

See [LICENSE](LICENSE) file for details.
