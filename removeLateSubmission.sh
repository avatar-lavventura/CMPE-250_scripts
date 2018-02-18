#!/bin/bash

#http://www.timestampgenerator.com/1518847200/#result
FOLDER="deneme2"
python gh_classroom_collect.py "CMPE483-Blockchain-Spring-2018-Bogazici" "$FOLDER" $FOLDER --user avatar-lavventura --token password.txt --due-date 1518847200

cd $FOLDER/
for d in $FOLDER*/ ; do
    echo "$d"
    cd $d
    branchName=$(git rev-parse --abbrev-ref HEAD) #Branch name only

    if [ "$branchName" == "master" ]; then
	mv ../$d ../LATE
    fi
    cd ..
    echo '-----------------------------'
done
