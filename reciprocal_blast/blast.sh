#!/bin/bash

database_file="/Users/work/Desktop/mus_musculus/proteome/proteome_shorthand/mus_musculus.transcriptome.fasta"
#suberites_domuncula_transcriptome="/Users/work/Desktop/data/Transcriptome/SUB2.transcripts.fa"  # Path to your transcriptome fasta file
#database_file=$mus_musculus_proteome

#QUERY
query_file=$1
outfile=$2

makeblastdb -in $database_file -dbtype prot

blastx -query $query_file -db $database_file -max_target_seqs 1 -outfmt "10 qseqid sseqid evalue" -evalue 0.001 > $outfile
