#!/bin/bash
#SBATCH --partition=bgmp
#SBATCH --job-name=qaareads
#SBATCH --cpus-per-task=4
#SBATCH --account=bgmp 
#SBATCH --time=0-08:00:00

#Files
F1=/projects/bgmp/shared/2017_sequencing/demultiplexed/Undetermined_S0_L008_R1_001.fastq.gz
F2=/projects/bgmp/shared/2017_sequencing/demultiplexed/Undetermined_S0_L008_R2_001.fastq.gz
F3=/projects/bgmp/shared/2017_sequencing/demultiplexed/2_2B_control_S2_L008_R1_001.fastq.gz
F4=/projects/bgmp/shared/2017_sequencing/demultiplexed/2_2B_control_S2_L008_R2_001.fastq.gz

conda activate bgmp_py310

/usr/bin/time \
  ./part1.py -f $F1 -o undetermined_read1_quality.png -l 101 -t "Undetermined Read 1"

  /usr/bin/time \
  ./part1.py -f $F2 -o undetermined_read2_quality.png -l 101 -t "Undetermined Read 2"

  /usr/bin/time \
  ./part1.py -f $F3 -o 2_2B_control_read1_quality.png -l 101 -t "2_2B_control Read 2"
  
  /usr/bin/time \
  ./part1.py -f $F4 -o 2_2B_control_read2_quality.png -l 101 -t "2_2B_control Read 2"

