
guppy=/home/u7442965/ash_nvme_direct_rna/ont-guppy/bin/guppy_basecaller

in=/home/u7442965/ash_nvme_direct_rna/raw_fast5/apsi_r3_SQK-RNA002_FLO-MIN106D
out=/home/u7442965/ash_nvme_direct_rna/raw_fastq/apsi_r3_SQK-RNA002_FLO-MIN106D_fastq

nohup $guppy -i $in -s $out -c rna_r9.4.1_70bps_hac.cfg --disable_qscore_filtering --device auto --records_per_fastq 0 --recursive &


#guppy_basecaller -i <input path> -s <save path> -c <config file> [options]
#rna_r9.4.1_70bps_hac
#added device auto because we are using GPU
#nuhup- runs the script in the background
#nohup guppy_basecaller -i $in -s $out -c rna_r9.4.1_70bps_hac.cfg --disable_qscore_filtering --device auto --records_per_fastq 0 --recur>


