#!/bin/bash

for i in ../rmUMI/*.gz
do
    b=`basename $i ".fastq.gz"`
    sim=../simulated/${b}.fq.gz
    cat $i $sim > $b.fastq.gz
done
