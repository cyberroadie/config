#!/bin/bash
cd ~
ls -A1 ~/config | grep -v .git | awk '{print "ln -s ./config/"$1" "$1}' | sh 

