#!/bin/bash

read -r -d '' VAR_REPLACE <<'EOF'
PRODUCT_NAME
CVS_BRANCH
EOF

PATHS_FILE=~/.gopaths

if [[ "$1" == "save" ]]; then
	NAME=$2
	DIR=`pwd`

	#replace variables in path with their symbolic values
	for V in `echo $VAR_REPLACE`; do
		DIR=`echo $DIR | sed 's/'${!V}'/\$'$V'/g'`
	done

	echo "Saved $NAME=$DIR"
	echo "$NAME=$DIR" >> $PATHS_FILE
else
	NAME=$1
	GOPATH=
	for line in `cat $PATHS_FILE`; do
		MATCH_NAME=`echo $line | awk -F'=' '{print $1}'`
		if [[ "$MATCH_NAME" == "$NAME" ]]; then
			GOPATH=`echo $line | awk -F'=' '{print $2}'`
		fi
	done

	if [[ -z "$GOPATH" ]]; then
		echo "Invalid location name: $NAME"
	else
		cd `eval echo "$GOPATH"`
	fi
fi

