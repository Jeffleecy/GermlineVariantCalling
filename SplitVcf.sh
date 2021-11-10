#!/bin/bash

export PATH=/pkg/biology/BCFtools/BCFtools_v1.10.2/bin:$PATH

file="/work1/u1272905/DE_jointcalling/900DE_HG_jointcalling/wkdir/387DE_jointcalling_liftover/split/326DE_jointcalling.output-hc.vcf.gz"

for file in $file; do
  for sample in `/pkg/biology/BCFtools/BCFtools_v1.10.2/bin/bcftools view -h $file | grep "^#CHROM" | cut -f10-`; do
    bcftools view -l1 -Oz -s $sample -o ${file/.vcf*/.$sample.vcf.gz} $file
  done
done
