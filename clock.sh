#!/bin/bash
F=(`zcat ./drdos8x8.psfu.gz| hexdump -v -e'1/1 "%x\n"'`)
e=echo\ -e;$e "\033[?25l"; A=''  T=`date +%H:%M`
$e "\033[0;0H" ; for c in `eval $e {0..$[${#T}-1]}`; do a=`$e -n ${T:$c:1}|\
hexdump -v -e'1/1 "%u\n"' `; A=$A" "$[32+8*a]; done;for j in {0..7};do for \
i in $A; do d=0x${F[$[i+j]]} m=$((0x80)); while [ $m -gt 0 ] ; do bit=$[d&m]
$e -n $[bit/m]|sed -e 'y/01/ ▀/';: $[m>>=1];done;done;echo;done
