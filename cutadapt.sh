#!/bin/sh

for i in *R1.fastq.gz
         do 

         cutadapt -m 50 --nextseq-trim=20 -a AGATCGGAAGAGCACACGTCTGAACTCCAGTC \
         --match-read-wildcards \
         -o $(basename $i .fastq.gz)_trimAdQual20.fastq.gz $i > $(basename $i .fastq.gz)_trimAdQual20.out
          
done
