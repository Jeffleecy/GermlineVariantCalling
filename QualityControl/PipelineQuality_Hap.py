#!/bin/bash
#PBS -P MST109178
#PBS -W group_list=MST109178
#PBS -N Test_Jeff
#PBS -l select=1:ncpus=40
#PBS -l place=pack
#PBS -q ngs192G
#PBS -o /work1/u1272905/hap.py_wkdir/test_file/Test_Jeff.out
#PBS -e /work1/u1272905/hap.py_wkdir/test_file/Test_Jeff.err
#PBS -M jocosojeff@gmail.com
#PBS -m ae


wkdir=/work1/u1272905/hap.py_wkdir/test_file
INPUT=/work1/u1272905/hap.py_wkdir/HG001_hg19_hap.py/OUTPUT.b37.recaled.vcf.gz

cd ${wkdir}

# Small benchmark using hap.py / vcfeval
#
# Author: Peter Krusche <pkrusche@illumina.com>
#
# This script needs the following things:
#
# * a working hap.py build. This script can e.g. be run from a build folder
# * hap.py must have been built with VCFEval support. This means we need Java
# * There must be a version of Rscript available in the PATH.
# * The ggplot2 package must be installed in R
#
# This script will take a while to run, ca. 20-30 min on a 4-core laptop.
# Running with more CPUs will be faster.

para="Test_Jeff" #Output prefix name

# Tool directory
DIR="/pkg/biology/hap.py/build/hap.py/example/happy"
PYTHON="/pkg/biology/Python/Python2_default/bin/python"
HC="/pkg/biology/hap.py/hap.py_v0.3.12/bin/hap.py"
rtg="/pkg/biology/rtg-tools/rtg-tools_v3.10/rtg"
sdf_37="/work2/lynn88065/Dragen/Pipeline_compare/sdf/b37_decoy_sdf/"

# GRCh38 (TRUTH VCF & BED)
GIAB="/project/GP1/u3710062/AI_SHARE/reference/GIAB"
# HG001
TRUTH_VCF_b37="$GIAB/NA12878_HG001/NISTv3.3.2/GRCh37/HG001_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_PGandRTGphasetransfer.vcf.gz"
BED_conf_b37="$GIAB/NA12878_HG001/NISTv3.3.2/GRCh37/HG001_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_nosomaticdel.bed"

#REF_38="/project/GP1/u3710062/AI_SHARE/reference/From_illumina/reference_illumina/hg38.fa"
REF_37="/project/GP1/u3710062/AI_SHARE/reference/GATK_bundle/2.8/b37/human_g1k_v37.fasta"
export HGREF=${REF_37}

Query="${INPUT}"

#change environemnt variables
export PATH=/pkg/biology/Perl/Perl_v5.28.0/bin:$PATH
export PATH1=/project/GP1/u3710062/AI_SHARE/software/htslib-1.9/bin/:$PATH1
export PATH3=/pkg/biology/SAMtools/SAMtools_v1.9/bin:$PATH2
export PATH4=/cm/local/apps/gcc/6.3.0/bin:$PATH3


##################################################################################
############################## WGS benchmark######################################
##################################################################################
### For VCF without normalization and decomposition
$PYTHON $HC $TRUTH_VCF_b37 $Query -f $BED_conf_b37 -r $REF_37 -o ${para}-ve --engine-vcfeval-path $rtg --engine=vcfeval --engine-vcfeval-template $sdf_37
### For normalize and decompose VCF
#$PYTHON $HC $TRUTH_VCF_b37 $Query -f $BED_conf_b37 -r $REF_37 -o ${para}-ve --no-leftshift --no-decompose --engine-vcfeval-path $rtg --engine=vcfeval --engine-vcfeval-template $sdf_37
