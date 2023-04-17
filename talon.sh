# Running TALON

# Reads have to be mapped with ref genome
ref_genome=/home/u7442965/ash_nvme_direct_rna/genomes/myrtle_rust/GCA_023105745.1_APSI_hap1_v2_genomic.fa
file=/home/u7442965/ash_nvme_direct_rna/all_fastq_rev/apsi_r1_induro_rev.fastq
out=/home/u7442965/ash_nvme_direct_rna/talon_out/apsi_r1_induro.sam
 
minimap2 -ax splice -uf -k14 --MD $ref_genome $file > $out  

# Database initialisation - Initialising SQLite database from the GTF annotation 
anno=/home/u7442965/ash_nvme_direct_rna/software/talon/TALON-master/example/SIRV_annotation.gtf

talon_initialize_database \
	--f $anno \
	--a apsi_r1_induro_annot \
	--g apsi_r1_induro \
	--o apsi_r1_induro

# Internal priming check
out=/home/u7442965/ash_nvme_direct_rna/talon_out/apsi_r1_induro.sam
ref_genome=/home/u7442965/ash_nvme_direct_rna/talon_out/ref.fa
apsi_r1_induro=/home/u7442965/ash_nvme_direct_rna/talon_out/labeled/apsi_r1_induro

mkdir -p labeled
talon_label_reads --f $out \
	--g $ref_genome \
	--t 1 \
	--ar 20 \
	--deleteTmp \
	--o $apsi_r1_induro 

# Running TALON
config_file=/home/u7442965/ash_nvme_direct_rna/talon_out/config.csv
out_talon=/home/u7442965/ash_nvme_direct_rna/talon_out/apsi_r1_induro_talon
db_file=/home/u7442965/ash_nvme_direct_rna/talon_out/apsi_r1_induro.db

talon \
	--f $config_file \
	--db $db_file \
	--build apsi_r1_induro \
	--o $out_talon


##############
# Tutorial example run
# Database initialisation
anno=/home/u7442965/ash_nvme_direct_rna/software/talon/TALON-master/example/SIRV_annotation.gtf

talon_initialize_database \
        --f $anno \
        --a SIRV_annot \
        --g SIRV \
        --o example_talon

# Internal priming check
rep_1=/home/u7442965/ash_nvme_direct_rna/software/talon/TALON-master/example/aligned_reads/SIRV_rep1.sam
fasta=/home/u7442965/ash_nvme_direct_rna/software/talon/TALON-master/example/SIRV.fa
SIRV_rep1=/home/u7442965/ash_nvme_direct_rna/talon_out/labeled/SIRV_rep1

mkdir -p labeled
talon_label_reads --f $rep_1 \
    --g $fasta  \
    --t 1 \
    --ar 20 \
    --deleteTmp \
    --o $SIRV_rep1

# Creates a same file and a tsv file 

rep_2=/home/u7442965/ash_nvme_direct_rna/software/talon/TALON-master/example/aligned_reads/SIRV_rep2.sam
SIRV_rep2=/home/u7442965/ash_nvme_direct_rna/talon_out/labeled/SIRV_rep2

talon_label_reads --f $rep_2 \
    --g $fasta  \
    --t 1 \
    --ar 20 \
    --deleteTmp \
    --o $SIRV_rep2

# Running Talon annotator
config_file=/home/u7442965/ash_nvme_direct_rna/software/talon/TALON-master/example/config.csv
example_db=/home/u7442965/ash_nvme_direct_rna/talon_out/example_talon.db
talon \
       --f $config_file \
       --db $example_db \
       --build SIRV \
       --o example

# Exploring and understanding the data
# Abundance and filtering
example_db=/home/u7442965/ash_nvme_direct_rna/talon_out/example_talon.db

talon_summarize \
       --db $example_db \
       --v \
       --o example

# Creating abundance matrix
talon_abundance \
       --db $example_db \
       -a SIRV_annot \
       --build SIRV \
       --o example


talon_filter_transcripts \
       --db $example_db \
       --datasets SIRV_Rep1,SIRV_Rep2 \
       -a SIRV_annot \
       --maxFracA 0.5 \
       --minCount 5 \
       --minDatasets 2 \
       --o filtered_transcripts.csv
filtered_transcripts=/home/u7442965/ash_nvme_direct_rna/talon_out/filtered_transcripts.csv

talon_abundance \
       --db $example_db \
       --whitelist $filtered_transcripts \
       -a SIRV_annot \
       --build SIRV \
       --o example

talon_create_GTF \
       --db $example_db \
       --whitelist $filtered_transcripts \
       -a SIRV_annot \
       --build SIRV \
       --o example
