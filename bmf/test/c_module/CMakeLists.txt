file(GLOB SRCS *.cc *.h)

# add_library(copy_module SHARED ${SRCS})
set_property(TARGET PROPERTY CXX_STANDARD 17)

# target_link_libraries(copy_module
#     PRIVATE
#     bmf_module_sdk
# )

# if(WIN32)
#     set_target_properties(copy_module PROPERTIES
#         RUNTIME_OUTPUT_DIRECTORY ${BMF_ASSEMBLE_ROOT}/bmf/lib
#         RUNTIME_OUTPUT_DIRECTORY_DEBUG ${BMF_ASSEMBLE_ROOT}/bmf/lib
#         RUNTIME_OUTPUT_DIRECTORY_RELEASE ${BMF_ASSEMBLE_ROOT}/bmf/lib
#     )
# endif()
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -sERROR_ON_UNDEFINED_SYMBOLS=0")
# set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -sERROR_ON_UNDEFINED_SYMBOLS=0")
# set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -sERROR_ON_UNDEFINED_SYMBOLS=0")
set(ENV{EMCC_FORCE_STDLIBS} 1)
add_executable(run_copy_module run_copy_module.cc)
set(CMAKE_EXECUTABLE_SUFFIX ".html")
set_target_properties(run_copy_module PROPERTIES LINK_FLAGS "-sMAIN_MODULE=1 --preload-file ${CMAKE_SOURCE_DIR}/big_bunny_10s_30fps.mp4@big_bunny_10s_30fps.mp4 --preload-file ${CMAKE_SOURCE_DIR}/BUILTIN_CONFIG.json@BUILTIN_CONFIG.json --preload-file ${CMAKE_BINARY_DIR}/output/bmf/lib/libbuiltin_modules.so@/lib/libbuiltin_modules.so -sALLOW_MEMORY_GROWTH")
# set_target_properties(run_copy_module PROPERTIES LINK_FLAGS "-sMAIN_MODULE=1 --preload-file /home/sam/bmf/big_bunny_10s_30fps.mp4@big_bunny_10s_30fps.mp4 --preload-file /home/sam/bmf/BUILTIN_CONFIG.json@BUILTIN_CONFIG.json  -sALLOW_MEMORY_GROWTH")
target_link_libraries(run_copy_module
PRIVATE 
engine bmf_module_sdk nlohmann
)
# target_link_options(run_copy_module PRIVATE "-sERROR_ON_UNDEFINED_SYMBOLS=0")

#set(CMAKE_INSTALL_PREFIX ${PROJECT_SOURCE_DIR})
#install(TARGETS copy_module)
