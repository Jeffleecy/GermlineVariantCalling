# Germline variant calling

## Description 
 This repository includes the codes used in:
1. performing germline variant calling from next-generation seuqencing (NGS) data (targeted panel/whole-exome/whole-genome)
2. performing joint calling for variants detected

## Dependencies
These codes are based on shell scripts and are executed in the Linux environment.
 
## Scripts
#### DRAGEN_VariantCaling.sh
   - Input: fastq files from NGS data (targeted panel/whole-exome/whole-genome)
   - Function: reads alignmemnt, position sorting, duplicate marking, and variant calling
   - Output: g.VCF or VCF files

#### DRAGEN_JointCalling.sh
   - Input: g.VCF files
   - Function: jointly genotype variant information in multiple g.VCF files
   - Output: VCF files

#### GATK_VariantCalling.sh
   - Input: fastq files from NGS data (targeted panel/whole-exome/whole-genome)
   - Function: reads alignmemnt, generate metrics for assessing target coverage, and variant calling
   - Output: g.VCF or VCF files

#### Sentieon_VariantCalling.sh
   - Input: fastq files from NGS data (targeted panel/whole-exome/whole-genome)
   - Function: reads alignmemnt, remove duplicates, base recalibration, generate metrics for assessing target coverage, and variant calling
   - Output: g.VCF or VCF files

#### Sentieon_JointCalling.sh
   - Input: g.VCF files
   - Function: jointly genotype variant information in multiple g.VCF files
   - Output: VCF files


