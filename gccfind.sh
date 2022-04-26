#!/bin/bash
#Ben Eli 319086435
var="-r"
if [ "$#" -lt "2" ]; then
    echo "Not enough parameters"
    exit 0
fi


for file in $(find . -name "*.out")
do
rm "$file"
done


for file in $(find . -name "*.c")
do
if grep -q "$2" "$file"; then
  string=${file%".c"};
gcc -w $file -o $string.out
fi
done

if [[ "$3" == "$var" ]];
then
for f in $1; do
    if [ -d "$f" ]; 
    then
    $($0 $f $2)
    fi
done
fi
