
#------------------------------------------------------------------
# modules & environment
module purge
module load cmake

#module load intel cray-mpich hdf5-mpi netcdf-mpi ncarcompilers cuda
module load gcc/12 cray-mpich hdf5-mpi netcdf-mpi ncarcompilers cuda
module list

#------------------------------------------------------------------
# paths
export ERF_HOME=$(pwd)/ERF
export AMREX_HOME=${ERF_HOME}/Submodules/AMReX

[ -d ${ERF_HOME} ] || git clone --recursive https://github.com/erf-model/ERF.git ${ERF_HOME}

instdir=${ERF_HOME}/${NCAR_BUILD_ENV}
builddir=${instdir}/BUILD
