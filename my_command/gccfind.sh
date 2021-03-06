#!/bin/bash
var="-r"
dir=$1
#if [[ ! "$0" == "./gccfind.sh" ]]; 
#then
  #temp=$0
  #dir=${temp%"gccfind.sh"}"$dir"
#fi

if [ "$#" -lt "2" ]; then
  echo "Not enough parameters"
  exit 0
fi
if [[ "$3" == "$var" ]]; then
  for file in $(find "$dir" -name "*.out"); do
    rm "$file"
  done

  for file in $(find "$dir" -name "*.c"); do
    if grep -q -w -i "$2" "$file"; then
      string=${file%".c"}
      gcc -w $file -o $string.out
    fi
  done

fi

for file in $(find "$dir" -maxdepth 1 -name "*.out"); do
  rm "$file"
done

for file in $(find "$dir" -maxdepth 1 -name "*.c"); do
  if grep -q -w -i "$2" "$file"; then
    string=${file%".c"}
    gcc -w $file -o $string.out
  fi

done
