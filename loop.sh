#!/bin/bash

COUNT=1
while [ $COUNT -le 5 ]; do
	echo "the current count is $COUNT"
	sleep 1
	let COUNT=COUNT+1
done
