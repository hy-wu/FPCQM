#PBS -N 3007BSxFM
#PBS -l nodes=1:ppn=24
#PBS -l walltime=96:00:00
#PBS -q dftcourse


cd $PBS_O_WORKDIR
cp $PBS_NODEFILE node
NCORE=`cat node | wc -l`

# Change version here according to the library used during compilation!!!
module load intel/19u5

vasp='/home/liyang1/Software/CalcProg/VASP/platform/wiz/vasp-544-patched_intel19u5/bin/vasp_ncl'

date > output.$PBS_JOBID
mpirun -machinefile node -np $NCORE $vasp >> output.$PBS_JOBID
date >> output.$PBS_JOBID
