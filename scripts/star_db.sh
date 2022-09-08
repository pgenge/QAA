#!/bin/bash

#SBATCH --partition=bgmp
#SBATCH --job-name=STARdbQAA
#SBATCH --cpus-per-task=8
#SBATCH --account=bgmp


genome_dir=/projects/bgmp/pgenge/bioinfo/Bi623/QAA/Mus_musculus_GRCm39
fasta=/projects/bgmp/pgenge/bioinfo/Bi623/QAA/Mus_musculus.GRCm39.dna.primary_assembly.fa
gtf=/projects/bgmp/pgenge/bioinfo/Bi623/QAA/Mus_musculus.GRCm39.107.gtf

conda activate bgmp_QAA

/usr/bin/time -v STAR \
    --runMode genomeGenerate \
    --runThreadN 8 \
    --genomeDir $genome_dir \
    --genomeFastaFiles $fasta \
    --sjdbGTFfile $gtf