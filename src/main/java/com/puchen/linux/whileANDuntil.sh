#!/usr/bin/env bash
#Author: puchen
#while循环是不定循环  条件循环  只是条件判断式成立,循环就会一直继续
#until循环  二号while循环相反  只是条件判断式不成立的时候,循环就会一直继续

i=1
s=0
while [ $i -le 100 ]
    do
        s=$(( $s+$i ))
        i=$(( $i+1 ))
    done
echo "this is $(i)"
