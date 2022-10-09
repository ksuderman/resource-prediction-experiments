#!/usr/bin/env bash

set -eu

for genome in hg38 chm13 ; do
	for size in 1x 10x 30x ; do
		filename="$genome-$size.yml"
		render_template.py -t benchmark.j2 genome=$genome size=$size > $filename
		echo "Wrote $filename"
	done
done
