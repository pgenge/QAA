#!/bin/bash
#SBATCH --partition=bgmp
#SBATCH --job-name=htseqcount
#SBATCH --cpus-per-task=8
#SBATCH --account=bgmp 

#files
file1=/projects/bgmp/pgenge/bioinfo/Bi623/QAA/star_aligned_sam/undetermined_alignment.Mus_musculus.GRCm39.ens107Aligned.out.sam
file2=/projects/bgmp/pgenge/bioinfo/Bi623/QAA/star_aligned_sam/2_2B_control_alignment.Mus_musculus.GRCm39.ens107Aligned.out.sam
outfile1=/projects/bgmp/pgenge/bioinfo/Bi623/QAA/htseq_out/undetermined_stranded_features.tsv
outfile2=/projects/bgmp/pgenge/bioinfo/Bi623/QAA/htseq_out/undetermined_rev_features.tsv
outfile3=/projects/bgmp/pgenge/bioinfo/Bi623/QAA/htseq_out/2_2B_control_stranded_features.tsv
outfile4=/projects/bgmp/pgenge/bioinfo/Bi623/QAA/htseq_out/2_2B_control_rev_features.tsv
gtf=/projects/bgmp/pgenge/bioinfo/Bi623/QAA/Mus_musculus_GRCm39_files/Mus_musculus.GRCm39.107.gtf

conda activate bgmp_QAA

/usr/bin/time -v \
htseq-count -f sam -s yes -c $outfile1 $file1 $gtf

/usr/bin/time -v \
htseq-count -f sam -s reverse -c $outfile2 $file1 $gtf

/usr/bin/time -v \
htseq-count -f sam -s yes -c $outfile3 $file2 $gtf

/usr/bin/time -v \
htseq-count -f sam -s reverse -c $outfile4 $file2 $gtf