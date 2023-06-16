if(${CMAKE_VERSION} VERSION_LESS "3.19.0")
    message(FATAL_ERROR "[Nebula] CMake 3.19.0 or above is required")
endif()
option(NEBULA_CLANG_ROOT_DIR "[Nebula] Path to Clang SourceCode" "")
option(NEBULA_LLVM_ROOT_DIR "[Nebula] Path to LLVM SourceCode" "")
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake/")
include(DetectRootDirectories)

set(NEBULA_ROOT_DIR "${CMAKE_CURRENT_LIST_DIR}")
set(MLIR_INCLUDE_DIRECTORIES "${NEBULA_MLIR_ROOT_DIR}/include/")
include_directories(
        "${CMAKE_CURRENT_LIST_DIR}/include/" "${CMAKE_CURRENT_BINARY_DIR}/include/")
include_directories("${MLIR_INCLUDE_DIRECTORIES}")
add_subdirectory(include)