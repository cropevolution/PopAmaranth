#!/bin/bash -l
#SBATCH --cpus-per-task=24
#SBATCH --mem=252gb
#SBATCH --time=100:00:00
#SBATCH --account=UniKoeln
#SBATCH --mail-user=jgoncal1@uni-koeln.de
#SBATCH --error /scratch/jgoncal1/logs/errors/%j
#SBATCH -D /scratch/jgoncal1/outputs/
#SBATCH -o /scratch/jgoncal1/logs/%j

source /home/jgoncal1/.bashrc
module load gnu/4.8.2

~/angsd/angsd -GL 2 -out pca_116 -nThreads 24 -doGlf 2 -doMajorMinor 1 -doMaf 2 -SNP_pval 1e-6 -bam /projects/ag-stetter/jdias/data/acc_list/list_116.file.list
