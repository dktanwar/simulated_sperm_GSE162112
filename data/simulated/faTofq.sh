#!/bin/bash

for i in *.fa
do
    n=`basename $i ".fa"`
    echo $n
    seqtk seq -F '#' $i | pigz -3 > ${n}.fq.gz
done
