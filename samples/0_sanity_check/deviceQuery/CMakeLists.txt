# Device query - simple CUDA device information
set(SAMPLE_NAME deviceQuery)

set(SOURCES
    deviceQuery.cu
)

add_executable(${SAMPLE_NAME} ${SOURCES})

set_target_properties(${SAMPLE_NAME} PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY_BASE}/0_sanity_check/deviceQuery
    RUNTIME_OUTPUT_DIRECTORY_DEBUG ${CMAKE_RUNTIME_OUTPUT_DIRECTORY_BASE}/0_sanity_check/deviceQuery
    RUNTIME_OUTPUT_DIRECTORY_RELEASE ${CMAKE_RUNTIME_OUTPUT_DIRECTORY_BASE}/0_sanity_check/deviceQuery
    CUDA_SEPARABLE_COMPILATION ON
    CUDA_RESOLVE_DEVICE_SYMBOLS ON
    CXX_STANDARD 14
    CXX_STANDARD_REQUIRED ON
)

target_link_libraries(${SAMPLE_NAME}
    CUDA::cudart
)
 
install(TARGETS ${SAMPLE_NAME}
    RUNTIME DESTINATION bin
)

message(STATUS "Configured sample: ${SAMPLE_NAME}")

