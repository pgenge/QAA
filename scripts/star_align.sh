#!/bin/bash
#SBATCH --partition=bgmp
#SBATCH --job-name=STARalign
#SBATCH --cpus-per-task=8
#SBATCH --account=bgmp 
#SBATCH --time=0-00:30:00
#SBATCH --nodelist=n278 

F1=/projects/bgmp/pgenge/bioinfo/Bi623/QAA/trimmomatic_out/undetermined_forward_paired.fq.gz
F2=/projects/bgmp/pgenge/bioinfo/Bi623/QAA/trimmomatic_out/undetermined_reverse_paired.fq.gz
F3=/projects/bgmp/pgenge/bioinfo/Bi623/QAA/trimmomatic_out/2_2B_control_forward_paired.fq.gz
F4=/projects/bgmp/pgenge/bioinfo/Bi623/QAA/trimmomatic_out/2_2B_control_reverse_paired.fq.gz

genome_dir=/projects/bgmp/pgenge/bioinfo/Bi623/QAA/Mus_musculus_GRCm39
out_filename_prefix=undetermined_alignment.Mus_musculus.GRCm39.ens107
out_filename_prefix_too=2_2B_control_alignment.Mus_musculus.GRCm39.ens107

conda activate bgmp_QAA

/usr/bin/time -v STAR --runThreadN 8 --runMode alignReads \
    --outFilterMultimapNmax 3 \
    --outSAMunmapped Within KeepPairs \
    --alignIntronMax 1000000 --alignMatesGapMax 1000000 \
    --readFilesCommand zcat \
    --readFilesIn $F1 $F2 \
    --genomeDir $genome_dir \
    --outFileNamePrefix $out_filename_prefix

/usr/bin/time -v STAR --runThreadN 8 --runMode alignReads \
    --outFilterMultimapNmax 3 \
    --outSAMunmapped Within KeepPairs \
    --alignIntronMax 1000000 --alignMatesGapMax 1000000 \
    --readFilesCommand zcat \
    --readFilesIn $F3 $F4 \
    --genomeDir $genome_dir \
    --outFileNamePrefix $out_filename_prefix_too