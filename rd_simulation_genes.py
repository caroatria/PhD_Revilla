import random as rd
import numpy as np
import csv
import pandas as pd
from Bio import SeqIO
import statistics

#This code essentially runs a permutation test to determine whether the overlap between module_genes and comparison_dataset
# is statistically significant compared to random chance.
#The statistical significance is assessed by comparing the observed overlap to the distribution of overlaps in random samples.
#The printed statistics provide insights into the significance of the observed overlap.

comparison_dataset = list(set(model_organism_targets)) #list of unique target genes in mouse
module_genes = #list of 171 genes you identified from turquoise module

fasta_file = #suberites genome fasta file
bed_file = #suberites genome bed file
genome = SeqIO.to_dict(SeqIO.parse(fasta_file, "fasta"))

# Read the BED file
tss_data = []
gene_list = []
with open(bed_file, "r") as file:
    for line in file:
        chromosome, start, end, gene_name = line.strip().split("\t")
        tss_data.append((chromosome, int(start), int(end),gene_name))
        gene_list.append(gene_name)

tss_data = []
gene_list = []
with open(bed_file, "r") as file:
    for line in file:
        chromosome, start, end, gene_name = line.strip().split("\t")
        tss_data.append((chromosome, int(start), int(end), gene_name))
        gene_list.append(gene_name)

experiment_outcomes = []

#now you run 100000 random simulations
for _ in range(100000): #Number of random samples (e.g., 10k or 1 mil)
    random_sel = rd.sample(gene_list, len(module_genes))
    experiment_outcomes.append(len(set(random_sel) & set(comparison_dataset)))

background_probability_list = []
background_probability = {}

for i in np.arange(0,50): #now we check if how often the 
    p_value = sum(1 for experiment_match in experiment_outcomes if experiment_match > i) / len(experiment_outcomes)
    background_probability[i] = p_value
    background_probability_list.append(p_value)

#get mean, stdev, pvalue (for our result), number of runs, average, stdev,

print(len(set(module_genes) & set(comparison_dataset)))
print(max(experiment_outcomes))
print("mean:\t",statistics.mean(experiment_outcomes))
print("stdev:\t",statistics.stdev(experiment_outcomes))
