#!/bin/bash
#SBATCH --partition=bgmp
#SBATCH --job-name=countmapped
#SBATCH --cpus-per-task=4
#SBATCH --account=bgmp 

file1=/projects/bgmp/pgenge/bioinfo/Bi623/QAA/star_aligned_sam/undetermined_alignment.Mus_musculus.GRCm39.ens107Aligned.out.sam
file2=/projects/bgmp/pgenge/bioinfo/Bi623/QAA/star_aligned_sam/2_2B_control_alignment.Mus_musculus.GRCm39.ens107Aligned.out.sam

conda activate bgmp_QAA

/usr/bin/time -v \
./mapped_counts.py $file1 "undetermined_mapped_unmapped_counts.txt"

/usr/bin/time -v \
./mapped_counts.py $file2 "2_2B_control_mapped_unmapped_counts.txt"