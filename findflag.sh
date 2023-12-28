#!/bin/bash

find / -name flag.txt 2>/dev/null > allflags.txt
find / -name user.txt 2>/dev/null >> allflags.txt
find / -name .flag 2>/dev/null >> allflags.txt
find / -name flag 2>/dev/null >> allflags.txt
find / -name root.txt 2>/dev/null >> allflags.txt


echo "Here is your flags."

cat allflags.txt

#code is written by kidnapshadow 
