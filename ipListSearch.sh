#!/bin/sh
# This tool is designed to search  a text file for an IP
# The file should be coma sepearted with the fields in 
# this order: IP, Name, Type.

#Set Variables
OP=$1 #Holds the operation to be executed
FILE=$2 #Holds the file

#When -s is the first perameter  this runs a search
if [ "$OP" = "-s" ]; then
	SEARCH=$3 #Holds the search terms

	#Prints the column header
	head -n 1 $FILE | awk -F',' '{print $1 "\t\t" $2 "\t\t" $3}'
	echo "-----------\t--------\t-------"

	#Searches for the search term and prints
	grep $SEARCH $FILE | awk -F',' '{print $1 "\t" $2 "\t\t" $3}'

#When -a is the first perameter this runs an add function
elif [ "$OP" = "-a" ]; then
	echo "$3,$4,$5" >> $FILE

fi

