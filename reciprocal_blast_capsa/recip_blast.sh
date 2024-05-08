#!/bin/bash

capsa_new="/Users/work/Desktop/data/capsaspora_new/Capsaspora.transcriptome.longestIsoform.fasta"

database_file=$capsa_new

#QUERY
query_file=$1
outfile=$2
makeblastdb -in $database_file -dbtype nucl

blastn -query $query_file -db $database_file -max_target_seqs 1 -outfmt "10 qseqid sseqid evalue" -evalue 0.001 > $outfile
