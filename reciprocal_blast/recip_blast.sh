#!/bin/bash

mus_musculus_proteome="/Users/work/Desktop/mus_musculus/proteome/proteome_shorthand/mus_musculus.transcriptome.fasta"
suberites_domuncula_transcriptome="suberites_domuncula.longest_isoform.fasta"  # Path to your transcriptome fasta file

database_file=$suberites_domuncula_transcriptome

#QUERY
query_file=$1
outfile=$2
makeblastdb -in $database_file -dbtype nucl

tblastn -query $query_file -db $database_file -max_target_seqs 1 -outfmt "10 qseqid sseqid evalue" > $outfile
