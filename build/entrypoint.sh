#!/bin/bash -ex
git submodule update --init --recursive
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX:PATH=../install -DCMAKE_BUILD_TYPE=Release -DUSE_COTIRE=OFF .. || (cat CMakeFiles/CMakeOutput.log && cat CMakeFiles/CMakeError.log && exit 1)
make
make install

