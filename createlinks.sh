#!/bin/sh
cd ~
ls -A1 ~/config | grep -v .git | grep -v create | awk '{print "ln -s ./config/"$1" ~/"$1}' | sh 

