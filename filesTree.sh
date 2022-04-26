#!/bin/bash

function ftree {
    SEDMAGIC='s;[^/]*/;|____;g;s;____|; |;g'

    if [ "$#" -gt 0 ] ; then
       dirlist="$@"
    else
       dirlist="."
    fi

    for x in $dirlist; do
         find "$x" -print | sed -e "$SEDMAGIC"
    done

}

ftree