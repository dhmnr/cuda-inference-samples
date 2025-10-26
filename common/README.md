# Common Utilities

This directory contains shared utilities and helper functions used across multiple CUDA samples.

## Files

### `helper_cuda.h`
Common CUDA error checking macros and device property utilities.

**Macros:**
- `CUDA_CHECK(call)` - Check CUDA API call errors
- `CUDA_CHECK_KERNEL()` - Check kernel launch and execution errors


The `common` directory is automatically added to the include path by the root CMakeLists.txt.

