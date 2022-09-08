#!/bin/bash
#SBATCH --partition=bgmp
#SBATCH --job-name=cutadapt
#SBATCH --cpus-per-task=4
#SBATCH --account=bgmp 
#SBATCH --time=0-08:00:00

#Files
F1=/projects/bgmp/shared/2017_sequencing/demultiplexed/Undetermined_S0_L008_R1_001.fastq.gz
F2=/projects/bgmp/shared/2017_sequencing/demultiplexed/Undetermined_S0_L008_R2_001.fastq.gz
F3=/projects/bgmp/shared/2017_sequencing/demultiplexed/2_2B_control_S2_L008_R1_001.fastq.gz
F4=/projects/bgmp/shared/2017_sequencing/demultiplexed/2_2B_control_S2_L008_R2_001.fastq.gz

conda activate bgmp_QAA

/usr/bin/time cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -o cutadapt_out/Undetermined_R1.fastq -p cutadapt_out/Undetermined_R2.fastq $F1 $F2

/usr/bin/time cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -o cutadapt_out/2_2B_control_R1.fastq -p cutadapt_out/2_2B_control_R2.fastq $F3 $F4 

