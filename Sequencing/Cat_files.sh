#!/bin/bash
filelist=/project/GP1/j116831/DF_Panel_Cohort_temp/Cohort/MDDSampleList2

while read -r sample
        do
        cd /project/GP1/j116831/DF_Panel_Cohort_temp/Cohort/${sample}/WGS/
        cat NTUH_Deafness_${sample}_WGS.r1.fastq.gz NTUH_Deafness_${sample}_WGS.r3.fastq.gz NTUH_Deafness_${sample}_WGS.r5.fastq.gz NTUH_Deafness_${sample}_WGS.r7.fastq.gz > ${sample}_DF.r1.fastq.gz

        cat NTUH_Deafness_${sample}_WGS.r2.fastq.gz NTUH_Deafness_${sample}_WGS.r4.fastq.gz NTUH_Deafness_${sample}_WGS.r6.fastq.gz NTUH_Deafness_${sample}_WGS.r8.fastq.gz > ${sample}_DF.r2.fastq.gz
        done<$filelist
