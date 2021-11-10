#!/bin/bash

export PATH=/pkg/biology/BCFtools/BCFtools_v1.10.2/bin:$PATH
path=/work1/u1272905/1012DeafnessVariantCalling/JointCalling1012Samples/Split_954/JointCalling954.output-hc.vcf.gz
file=/work1/u1272905/1012DeafnessVariantCalling/JointCalling1012Samples/Split_954/file2
bcftools view -S $file --force-samples -Oz -o WS_subset.vcf.gz $path

#bcftools view -l1 -Oz -s $sample

#-o ${file/.vcf*/.$sample.vcf.gz} $file
