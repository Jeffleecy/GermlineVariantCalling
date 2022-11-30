# Germline variant calling

## Description 
 This repository includes the codes used in:
1. an

This directory lists scripts for performing germline variant calling from NGS data (targeted panel/whole-exome/whole-genome).
The following describes these tools' functions and characteristics. 

## Dependencies
These codes are based on Python 3.10 and shell scripts and are executed in the Linux environment.
 
 
## Scripts
#### ANNOVAR_hg19.sh
   - Input: a VCF file of interest
   - Function: annotate the VCF file using ANNOVAR based on the hg19 reference genome
   - Output: a tab-delimited file recording information on the variants investigated
   
