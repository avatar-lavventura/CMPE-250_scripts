#!/bin/bash

for d in deneme2*/ ; do
    #echo "$d"
    cd $d
    branchName=$(git rev-parse --abbrev-ref HEAD) #Branch name only

    if [ "$branchName" == "master" ]; then
	mv ../$d ../LATE
    fi
    cd ..
    #echo '-----------------------------'
done