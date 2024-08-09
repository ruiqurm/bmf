#!/bin/bash

# Default build type - Release
BUILD_TYPE="Release"

mkdir -p output
LOCAL_BUILD=1
if [ $LOCAL_BUILD -ne 0 ]
then
  git submodule update --init --recursive
fi

# (cd 3rd_party/dlpack && emcmake cmake . -DCMAKE_INSTALL_PREFIX=~/bmf/output && emmake make && make install)

# Generate BMF version
source ./version.sh

source ../emsdk/emsdk_env.sh
mkdir -p build && cd build
export FFMPEG_ROOT_PATH=/home/ruiqurm/ffmpeg/build/output
export LD_LIBRARY_PATH=/home/ruiqurm/ffmpeg/build/libdwarf/lib:$LD_LIBRARY_PATH
emcmake cmake .. -DCMAKE_BUILD_TYPE=$BUILD_TYPE \
    -DCOVERAGE=${COVERAGE_OPTION} \
    -DBMF_LOCAL_DEPENDENCIES=${LOCAL_BUILD} \
    -DBMF_BUILD_VERSION=${BMF_BUILD_VERSION} \
    -DBMF_BUILD_COMMIT=${BMF_BUILD_COMMIT} \
    -DBMF_ENABLE_PYTHON=OFF \
    -DBMF_ENABLE_TEST=OFF \
    -DBMF_ENABLE_CUDA=OFF \
    -DCMAKE_FIND_DEBUG_MODE=ON \
    -DBMF_ENABLE_FFMPEG=ON

emmake make -j4
# Transfer to output directory
# cd ..
# cp -a -r build/output/. output
# rm -rf output/bmf/files
# rm -rf output/example/files