# Running minimap2 on samples

minimap2 -ax splice -uf -k14 ref.fa direct-rna.fq > aln.sam

ref=/home/u7442965/ash_nvme_direct_rna/genomes/myrtle_rust/GCA_023105745.1_APSI_hap1_v2_genomic.fa
file_3=/home/u7442965/ash_nvme_direct_rna/all_fastq/apsi_r3.fastq
out_3=/home/u7442965/ash_nvme_direct_rna/mapping/bk_mapping/apsi_r3.sam

minimap2 -ax splice -uf -k14 $ref $file_3 > $out_3

# converting sam to bam
samtools view -S -b apsi_r2.sam > apsi_r2.bam

# sorting a bam file
samtools sort apsi_r2.bam -o apsi_r2_sorted.bam

# indexing
samtools index apsi_r2_sorted.bam

# NanoStat on samples
NanoStat --bam apsi_r2_sorted.bam > apsi_r2_sorted.txt 

ref=/home/u7442965/ash_nvme_direct_rna/genomes/p_graminis/Puccinia_graminis_transcriptome.fa
file=/home/u7442965/ash_nvme_direct_rna/genomes/p_graminis/apsi_r1_induro_genes_1148159.fa
out=/home/u7442965/ash_nvme_direct_rna/mapping/bk_mapping/apsi_r1_induro_genes_1148159.sam

minimap2 -a $ref $file > $out
 
