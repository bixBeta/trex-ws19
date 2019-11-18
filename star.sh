#!/bin/sh

for i in *_trimmed.fastq.gz

	    do
      
	        STAR \
	        --runThreadN 6 \
	        --genomeDir /workdir/genome/GRCh38.star \
	        --readFilesIn $i \
	        --readFilesCommand gunzip -c \
	        --outSAMstrandField intronMotif \
	        --outFilterIntronMotifs RemoveNoncanonical \
	        --outSAMtype BAM SortedByCoordinate \
	        --outFileNamePrefix $(basename $i trimmed.fastq.gz) \
	        --quantMode GeneCounts

	    done

