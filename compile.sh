#!/bin/bash
cd "$(dirname "$0")"
# CMAKE_INSTALL_PREFIX="$(pwd)/env/dist"
mkdir -pv build
cd build
cmake ../ \
  -DCMAKE_INSTALL_PREFIX="$(pwd)/env/dist"  \
  -DAPPS_BUILD="all"                      \
  -DTOOLS_BUILD="none"                    \
  -DSCRIPTS="static"                      \
  -DMODULES="static"                      \
  -DWITH_WARNINGS="1"                     \
  -DCMAKE_CXX_COMPILER="/usr/bin/clang++" \
  -DCMAKE_C_COMPILER="/usr/bin/clang"     \
  -DCMAKE_CXX_COMPILER_LAUNCHER="ccache"  \
  -DCMAKE_C_COMPILER_LAUNCHER="ccache"    \
  # -DNOPCH=1

make -j 32
make install