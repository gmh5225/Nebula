# Detect Root Directories
if(NOT NEBULA_LLVM_ROOT_DIR)
  if(LLVM_SOURCE_DIR)
    set(NEBULA_LLVM_ROOT_DIR
        "${LLVM_SOURCE_DIR}"
        CACHE STRING "" FORCE)
  endif()
endif()

if(NOT NEBULA_LLVM_ROOT_DIR)
  unset(NEBULA_LLVM_ROOT_DIR CACHE)
  message(
    FATAL_ERROR
      "[Luminescent] Failed to detect NEBULA_LLVM_ROOT_DIR, pass in as option please"
  )
endif()

if(NOT NEBULA_MLIR_ROOT_DIR)
  if(MLIR_SOURCE_DIR)
    get_filename_component(TMP_MLIR_ROOT_DIR "${MLIR_SOURCE_DIR}" ABSOLUTE)
    set(NEBULA_MLIR_ROOT_DIR
        "${TMP_MLIR_ROOT_DIR}"
        CACHE STRING "" FORCE)
  elseif(LLVM_EXTERNAL_MLIR_SOURCE_DIR)
    get_filename_component(TMP_MLIR_ROOT_DIR
                           "${LLVM_EXTERNAL_MLIR_SOURCE_DIR}" ABSOLUTE)
    set(NEBULA_MLIR_ROOT_DIR
        "${TMP_MLIR_ROOT_DIR}"
        CACHE STRING "" FORCE)
  else()
    get_filename_component(MONOREPO_ROOT "${NEBULA_LLVM_ROOT_DIR}" DIRECTORY)
    get_filename_component(MLIR_PATH ${MONOREPO_ROOT}/mlir ABSOLUTE)
    set(NEBULA_MLIR_ROOT_DIR
        "${MLIR_PATH}"
        CACHE STRING "" FORCE)
  endif()
endif()

if(NOT NEBULA_MLIR_ROOT_DIR)
  unset(NEBULA_MLIR_ROOT_DIR CACHE)
  message(
    FATAL_ERROR
      "[Nebula] Failed to detect NEBULA_MLIR_ROOT_DIR, pass in as option please"
  )
endif()
message(STATUS "[Nebula] MLIR Root: ${NEBULA_MLIR_ROOT_DIR}")
message(STATUS "[Nebula] LLVM Root: ${NEBULA_LLVM_ROOT_DIR}")
