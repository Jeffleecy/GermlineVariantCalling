#!/bin/bash

# * There must be a version of Rscript available in the PATH.
# * The ggplot2 package must be installed in R

OUTPUT_PATH="/Users/jefflee/Desktop/LAB_324DE_HG001_PRcurve"
cd $OUTPUT_PATH

#Template="/work2/lynn88065/Dragen/Pipeline_compare/2020013"
Template="/Users/jefflee/Desktop/LAB_324DE_HG001_PRcurve/rocplot_test.Rscript"
export PATH="/Library/Frameworks/R.framework/Resources:$PATH"

# HG001
# hg38
# Output prefix name
f1="/Users/jefflee/Desktop/LAB_324DE_HG001_PRcurve/Test_noleftshit"

echo
echo "----------------------------------------------------------------------------------"
echo
echo "Making plots (this replaces plots in the doc folder of this checkout!)"

# Compare with different caller performance
${Template} ${OUTPUT_PATH}/20210701 ${f1}-ve:Sentieon -pr
