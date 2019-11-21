#!/bin/sh

for i in *.fastq.gz
         do 

         cutadapt -m 50 --nextseq-trim=20 \
         -a AGATCGGAAGAGCACACGTCTGAACTCCAGTC \
         --match-read-wildcards \
         -o $(basename $i .fastq.gz)_trimmed.fastq.gz \
         $i > $(basename $i .fastq.gz)_trimmed.outStats
          
done


mv *_trimmed.fastq.gz *_trimmed.out ../trimmed_fastqs

