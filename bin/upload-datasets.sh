#!/usr/bin/env bash
set -eu

while [[ $# > 0 ]] ; do
	cloud=$1
	shift
	# Import the workflows
	for workflow in hg38 chm13 ; do
	    id=$(abm $cloud workflow import $workflow | jq -r .id)
	    abm $cloud workflow rename $id "DNA Mapper $workflow"
	done
	
	history=$(abm $cloud history create "Human DNA" | jq -r .id)
	echo "Created history $history"
	for size in 1x 10x 30x ; do
		for direction in r f ; do
			key="human-dna-$size-$direction"
			name="human-$size-$direction"						
			echo "Importing $key to $cloud"
			abm $cloud dataset import $key --history $history --name $name
		done
	done
done
