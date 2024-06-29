#!/bin/sh
#PBS -l select=1
#PBS -l walltime=01:00:00
#PBS -l filesystems=eagle
#PBS -A QuantMatManufact
#PBS -q debug

module use /soft/modulefiles
module load spack-pe-base cmake
module load cudatoolkit-standalone/11.8.0
module load conda
module load gcc/13.2.0

conda activate

cd $PBS_O_WORKDIR

if [[ $# -eq 0 ]]; then
  source_folder=`pwd`
else
  source_folder=$1
fi

mkdir build
cd build
cmake -DCMAKE_PREFIX_PATH=/soft/applications/conda/2024-04-29/mconda3/lib/python3.11/site-packages/torch/share/cmake $source_folder
make -j8
./aoti_example

echo All done
