#!/usr/bin/env bash
set -eu

cluster=$1

for history in $(abm $cluster history list | grep $cluster | awk '{ print $1 }') ; do
	echo "Deleting $history"
	abm $cluster history delete $history
done


