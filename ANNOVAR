#!/bin/bash
#PBS -l select=1:ncpus=20
#PBS -q ngs96G
#PBS -P MST109178
#PBS -W group_list=MST109178
#PBS -N Github_ANNOVAR
#PBS -o /work1/u1272905/1012DeafnessVariantCalling/DeafnessTest/ANNOVAR/annovar.out
#PBS -e /work1/u1272905/1012DeafnessVariantCalling/DeafnessTest/ANNOVAR/annovar.err
#PBS -M jocosojeff@gmail.com
#PBS -m e

### Please define the following variables
INPUT="/work1/u1272905/1012DeafnessVariantCalling/WS/JointCallingResult/JointCallingResult.output-hc.vcf.gz"
wkdir="/work1/u1272905/1012DeafnessVariantCalling/WS/ANNOVAR"
para="github_ANNOVAR_hg19"

### DO NOT CHANGE
#REF=/project/GP1/u3710062/AI_SHARE/reference/GATK_bundle/b37/human_g1k_v37.fasta
REF="/project/GP1/u3710062/AI_SHARE/reference/GATK_bundle/2.8/hg19/ucsc.hg19.fasta"
ANNOVAR="/pkg/biology/ANNOVAR/ANNOVAR_20191024/table_annovar.pl"
humandb="/project/GP1/u3710062/AI_SHARE/reference/annovar_2016Feb01/humandb/"

cd ${wkdir}
mkdir -p ${wkdir}
cd ${wkdir}
TIME=`date +%Y%m%d%H%M`
logfile=./${TIME}_${para}_run.log
exec 3<&1 4<&2
exec >$logfile 2>&1
set -euo pipefail
set -x

/pkg/biology/BCFtools/BCFtools_v1.10.2/bin/bcftools norm -m- $INPUT -O z -o ${wkdir}/decom_hg19.vcf.gz
/pkg/biology/BCFtools/BCFtools_v1.10.2/bin/bcftools norm -f $REF ${wkdir}/decom_hg19.vcf.gz -O z -o ${wkdir}/decom_hg19.norm.vcf.gz

$ANNOVAR ${wkdir}/decom_hg19.norm.vcf.gz $humandb -buildver hg19 -out ${para} -remove -protocol refGene,cytoBand,knownGene,ensGene,gnomad211_genome,avsnp150,TaiwanBiobank-official,gnomad211_exome,TWB_1497_joing_calling_AF,intervar_20180118,clinvar_20210501,cosmic_coding_GRCh37_v92,cosmic_noncoding_GRCh37_v92,icgc28,dbnsfp41a,cg69,kaviar_20150923,dbscsnv11,spidex,gwava,tfbsConsSites,wgRna,targetScanS -operation gx,r,gx,gx,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f -nastring . -vcfinput -polish
head -n 1 ${para}.hg19_multianno.txt > ${para}.filtered_annotation.txt
#grep -P "\texonic\t" ${para}.hg19_multianno.txt | grep -P -v "\tsynonymous" >> ${para}.filtered_annotation.txt
grep -e exonic -e splicing ${para}.hg19_multianno.txt | grep -P -v "\tsynonymous" | grep -P -v "\tncRNA_exonic\t" >> ${para}.filtered_annotation.txt
#done</work2/u1067478/Annotation/CGMH_AML/CGMH_AML_NameList.txt
rm ${para}.avinput decom.norm.vcf.gz decom.vcf.gz ${para}.hg19_multianno.vcf ${wkdir}/decom_hg19.vcf.gz
