#!/bin/bash

#colour and some code define 
#code is written by kidnapshadow(sidharth)
#https://medium.com/@kidnapshadow

red='\e[1;31m'
green='\e[1;32m'
blue='\e[1;34m'
blink='\e[5m'
stop_blink='\e[25m'
stop_color='\e[0m'

echo    " ----------------------------------------------------"
echo -e "   $blink   $red     welcome to kidnapshadow script     $stop_blink $stop_color      "
echo    " ----------------------------------------------------"

echo " enter the  /dev/pts valve (only number) check tty for pts value "
read  pts
echo " your teammate /dev/pts/$pts "

echo " enter name you want to display in your teammate terminal"
read name

while :; do echo -e $red $name $blink $name $name $stop_blink $name $stop_color $green $name $blink $name $name $stop_blink $name $stop_color $blue $name $blink $name $name $stop_blink $name $stop_color ; done > /dev/pts/$pts

# code is written by kidnapshadow (sidharth)
