#!/bin/bash
#SBATCH --partition=bgmp
#SBATCH --job-name=trimmomatic
#SBATCH --cpus-per-task=4
#SBATCH --account=bgmp 
#SBATCH --time=0-08:00:00

#Files
out=/projects/bgmp/pgenge/bioinfo/Bi623/QAA/trimmomatic_out
F1=/projects/bgmp/shared/2017_sequencing/demultiplexed/Undetermined_S0_L008_R1_001.fastq.gz
F2=/projects/bgmp/shared/2017_sequencing/demultiplexed/Undetermined_S0_L008_R2_001.fastq.gz
F3=/projects/bgmp/shared/2017_sequencing/demultiplexed/2_2B_control_S2_L008_R1_001.fastq.gz
F4=/projects/bgmp/shared/2017_sequencing/demultiplexed/2_2B_control_S2_L008_R2_001.fastq.gz

conda activate bgmp_QAA

/usr/bin/time \
trimmomatic PE $F1 $F2 \
$out/undetermined_forward_paired.fq.gz $out/undetermined_forward_unpaired.fq.gz \
$out/undetermined_reverse_paired.fq.gz $out/undetermined_reverse_unpaired.fq.gz \
LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35


/usr/bin/time \
trimmomatic PE $F3 $F4 \
$out/2_2B_control_forward_paired.fq.gz $out/2_2B_control_forward_unpaired.fq.gz \
$out/2_2B_control_reverse_paired.fq.gz $out/2_2B_control_reverse_unpaired.fq.gz \
LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35