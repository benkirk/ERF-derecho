#!/usr/bin/env bash

set -e

#------------------------------------------------------------------
# common config
topdir=$(git rev-parse --show-toplevel)
source ${topdir}/config_env.sh
#------------------------------------------------------------------

mkdir -p ${builddir} && cd ${builddir} && pwd

#------------------------------------------------------------------
# config, make, install
cmake \
    -DCMAKE_INSTALL_PREFIX:PATH=${instdir} \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -DERF_DIM:STRING=3 \
    -DERF_ENABLE_PARTICLES:BOOL=ON \
    -DERF_ENABLE_POISSON_SOVLE:BOOL=ON \
    -DERF_ENABLE_RADIATION:BOOL=ON \
    -DERF_ENABLE_HDF5:BOOL=ON \
    -DERF_ENABLE_MPI:BOOL=ON \
    -DCMAKE_CXX_COMPILER:STRING=mpicxx \
    -DCMAKE_C_COMPILER:STRING=mpicc \
    -DCMAKE_Fortran_COMPILER:STRING=mpifort \
    -DERF_ENABLE_CUDA:BOOL=ON \
    -DCMAKE_CUDA_ARCHITECTURES=80 \
    -DERF_ENABLE_TESTS:BOOL=ON \
    -DERF_TEST_NRANKS:STRING=4 \
    -DERF_ENABLE_FCOMPARE:BOOL=ON \
    -DERF_ENABLE_DOCUMENTATION:BOOL=OFF \
    -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=ON \
    ${ERF_HOME}

make -j 8 #VERBOSE=1
make install
