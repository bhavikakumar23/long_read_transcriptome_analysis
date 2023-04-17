 
#QC for samples

#seq_summary=/home/u7442965/ash_nvme_direct_rna/sjam_3dai_r2_inf_SQK-RNA002_FLO-MIN106_fastq/sequencing_summary.txt
#out=/home/u7442965/ash_nvme_direct_rna/fastqc/sjam_3dai_r2_inf_all_reads_nanoplot

#seq_summary_1=/home/u7442965/ash_nvme_direct_rna/raw_fastq/sjam_3dai_r2_con_SQK-RNA002_FLO-MIN106_fastq/sequencing_summary.txt
#out_1=/home/u7442965/ash_nvme_direct_rna/nanoplots/sjam_3dai_r2_con_all_reads_nanoplot

#seq_summary_2=/home/u7442965/ash_nvme_direct_rna/raw_fastq/apsi_r1_ssiii_SQK-RNA002_FLO-MIN106D_fastq/sequencing_summary.txt
#out_2=/home/u7442965/ash_nvme_direct_rna/nanoplots/apsi_r1_ssiii_all_reads_nanoplot

#seq_summary_3=/home/u7442965/ash_nvme_direct_rna/raw_fastq/apsi_r2_SQK-RNA002_FLO-MIN106D_fastq/sequencing_summary.txt
#out_3=/home/u7442965/ash_nvme_direct_rna/nanoplots/apsi_r2_all_reads_nanoplot

seq_summary_4=/home/u7442965/ash_nvme_direct_rna/raw_fastq/apsi_r3_SQK-RNA002_FLO-MIN106D_fastq/sequencing_summary.txt
out_4=/home/u7442965/ash_nvme_direct_rna/nanoplots/apsi_r3_all_reads_nanoplot

NanoPlot --summary $seq_summary_4 -o $out_4

