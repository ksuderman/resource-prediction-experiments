#!/usr/bin/env bash

#if [[ $# != 2 ]] ; then
#	echo "USAGE: $0 N_CPU MEM_SIZE"
#	echo "EG   : $0 8 64"
#	exit 1
#fi

#render_template.py -t rules.j2 cores=$1 mem=$2

for cores in 4 8 16 32 ; do
	for mem_scalar in 2 4 8 ; do
		mem="$((cores * mem_scalar))"
		filename="$cores"x"$mem.yml"
		render_template.py -t rules.j2 cores=$cores mem=$mem > $filename
		echo "Wrote $filename"
	done
done