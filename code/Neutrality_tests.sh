#!/bin/bash -l
#SBATCH --cpus-per-task=4
#SBATCH --mem=42gb
#SBATCH --time=16:00:00
#SBATCH --account=UniKoeln
#SBATCH --mail-user=jgoncal1@uni-koeln.de
#SBATCH --error /scratch/jgoncal1/logs/errors/%j
#SBATCH -D /scratch/jgoncal1/outputs/
#SBATCH -o /scratch/jgoncal1/logs/%j

source /home/jgoncal1/.bashrc
module load gnu/4.8.2

BAM_FILE="list_ARG" # file contianig list with BAM files
POPULATION="ARGENTINA" # Population being analysed
NIND=3 # minimum number of individuals with data to be included in the analysis (recomended at least 1/3 of the total number of samples)


#site allele frequency calculation

~/angsd/angsd -out $POPULATION \
-bam /projects/ag-stetter/jdias/data/acc_list/$BAM_FILE \
-doSaf 1 \
-GL 2 \
-P 24 \
-anc /projects/ag-stetter/jdias/data/genomes/Ahypochondriacus_459_v2.0.fa \
-remove_bads 1 \
-minMapQ 30 \
-minQ 20 \
-minInd $NIND

## calculte SFS, use fold in case of not knwoing the ancestral state

 ~/angsd/misc/realSFS  $POPULATION.saf.idx \
 -P 4 \
 -fold 1 > test_script$POPULATION.sfs

 ## calcualtion of theta per site

 ~/angsd/misc/realSFS \
 saf2theta $POPULATION.saf.idx \
 -sfs $POPULATION.sfs \
 -outname $POPULATION  \
 -fold 1 \
 -P 4

 ## calcualtion of statistics from theta estimations. (If folded site frequency spectrum was used, only tD, tP and Tajima are correctly estimated)

 ~/angsd/misc/thetaStat \
 do_stat $POPULATION.thetas.idx \
 -win 5000 \
 -step 5000 \
 -outnames $POPULATION.thetasWindow.gz
