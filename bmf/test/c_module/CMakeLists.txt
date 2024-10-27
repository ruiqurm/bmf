file(GLOB SRCS *.cc *.h)

add_library(dumb_module SHARED 
    dumb_module.cc
    dumb_module.h
)
target_link_libraries(dumb_module
    PRIVATE
    bmf_module_sdk
)
set_property(TARGET dumb_module PROPERTY TARGET_SUPPORTS_SHARED_LIBS TRUE)
target_link_options(dumb_module PRIVATE "-sSIDE_MODULE=2")
target_compile_options(dumb_module PRIVATE "-sSIDE_MODULE=2")


add_library(copy_module SHARED 
    copy_module.cc
    copy_module.h
)
target_link_libraries(copy_module
    PRIVATE
    bmf_module_sdk
)
set_property(TARGET copy_module PROPERTY TARGET_SUPPORTS_SHARED_LIBS TRUE)
target_link_options(copy_module PRIVATE "-sSIDE_MODULE=2")
target_compile_options(copy_module PRIVATE "-sSIDE_MODULE=2")

set(ENV{EMCC_FORCE_STDLIBS} 1)
add_executable(run_copy_module run_copy_module.cc)
set(CMAKE_EXECUTABLE_SUFFIX ".html")
set_target_properties(run_copy_module PROPERTIES LINK_FLAGS "-fexceptions -s ASYNCIFY -s 'ASYNCIFY_IMPORTS=[\"loadLibrary\"]' -s ASYNCIFY_STACK_SIZE=5120000 -sMAIN_MODULE=1 --preload-file ${CMAKE_SOURCE_DIR}/overlay.jpg@overlay.jpg  --preload-file ${CMAKE_SOURCE_DIR}/big_bunny_10s_30fps.mp4@big_bunny_10s_30fps.mp4  --preload-file ${CMAKE_SOURCE_DIR}/BUILTIN_CONFIG.json@BUILTIN_CONFIG.json -s USE_PTHREADS=1 -s SHARED_MEMORY=1 -s INITIAL_MEMORY=64MB -sALLOW_MEMORY_GROWTH")
# set_target_properties(run_copy_module PROPERTIES LINK_FLAGS "-sMAIN_MODULE=1 --preload-file /home/sam/bmf/big_bunny_10s_30fps.mp4@big_bunny_10s_30fps.mp4 --preload-file /home/sam/bmf/BUILTIN_CONFIG.json@BUILTIN_CONFIG.json  -sALLOW_MEMORY_GROWTH")
target_link_libraries(run_copy_module
PRIVATE 
engine bmf_module_sdk hmp nlohmann
)


#set(CMAKE_INSTALL_PREFIX ${PROJECT_SOURCE_DIR})
#install(TARGETS copy_module)
