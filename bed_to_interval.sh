#!/usr/bin/sh
#SBATCH -A MST109178        # Account name/project number
#SBATCH -J SAMPLE_NAME         # Job name
#SBATCH -p ngs48G           # Partition Name 
#SBATCH -c 14               # Core numbers
#SBATCH --mem=46g           # Memory size
#SBATCH -o out.log          # Path to the standard output file 
#SBATCH -e err.log          # Path to the standard error ouput file
#SBATCH --mail-user=@gmail.com    # email
#SBATCH --mail-type=FAIL              # When to send an email = NONE, BEGIN, END, FAIL, REQUEUE, or ALL

FOLDER=
Sample_ID=DF_v2_213genes_Interval
DATE=20210506
### Bed file is from
#BED=/project/GP1/u3710062/AI_SHARE/shared_scripts/A1_Panel/DF_IDT_v2.bed
BED=/work1/u1272905/sentieon_GIAB_jointcalling_script/DF_v2_213genes.bed
GATK=/project/GP1/u3710062/AI_SHARE/software/GATK/GenomeAnalysisTK-3.6/GenomeAnalysisTK.jar
PICARD=/pkg/biology/Picard/Picard_v2.18.11/picard.jar
#CHAIN=/project/GP1/u3710062/AI_SHARE/reference/Liftover/hg19ToHg38.over.chain.gz
CHAIN=/project/GP1/u3710062/AI_SHARE/reference/Liftover/b37ToHg38.over.chain
########################################################################################################
B37=/project/GP1/u3710062/AI_SHARE/reference/GATK_bundle/2.8/b37/human_g1k_v37_decoy.fasta
B37_SD=/project/GP1/u3710062/AI_SHARE/reference/GATK_bundle/2.8/b37/human_g1k_v37_decoy.dict
HG19=/project/GP1/u3710062/AI_SHARE/reference/GATK_bundle/2.8/hg19/ucsc.hg19.fasta
HG19_SD=/project/GP1/u3710062/AI_SHARE/reference/GATK_bundle/2.8/hg19/ucsc.hg19.dict
HG38=/project/GP1/u3710062/AI_SHARE/reference/GATK_bundle/2.8/hg38/Homo_sapiens_assembly38.fasta
HG38_SD=/project/GP1/u3710062/AI_SHARE/reference/GATK_bundle/2.8/hg38/Homo_sapiens_assembly38.dict
A1_HG19=/project/GP1/u3710062/AI_SHARE/reference/hg19.NC_012920/ucsc.hg19.NC_012920.fasta
A1_HG19_SD=/project/GP1/u3710062/AI_SHARE/reference/hg19.NC_012920/ucsc.hg19.NC_012920.dict

###
cd ${FOLDER}
### To transform bed file to interval_list
### interval list for b37, g1k_v37_decoy
java -jar ${PICARD} BedToIntervalList I=${BED} O=${FOLDER}/${DATE}.b37.interval_list SD=${HG19_SD}
#SD=${B37_SD}

### interval list for A1 previous ucsc.hg19.NC_012920.fasta reference
#java -jar ${PICARD} BedToIntervalList I=${BED} O=${FOLDER}/Deafness_bed/${DATE}.A1_hg19.interval_list SD=${A1_HG19_SD}

### To liftover interval_list from hg19 to hg38
#java -jar ${PICARD} LiftOverIntervalList I=${FOLDER}/Deafness_bed/${DATE}.b37.interval_list O=${FOLDER}/Deafness_bed/${DATE}.hg38.interval_list SD=${HG38_SD} CHAIN=${CHAIN}
