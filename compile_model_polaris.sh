#!/bin/sh
#PBS -l select=1
#PBS -l walltime=01:00:00
#PBS -l filesystems=eagle
#PBS -A QuantMatManufact
#PBS -q debug

module use /soft/modulefiles
module load spack-pe-base
module load cudatoolkit-standalone/11.8.0
module load conda
module load gcc/13.2.0

conda activate

cd $PBS_O_WORKDIR
python3 model.py

echo All done
