#!/bin/bash

for d in "${ctrl_led[@]}"; do 
    start_state+=( $(cat $d) )
done

number_of_leds=$(cd /sys/class/leds; ls -d */ | wc -l)

dirled=$(cd /sys/class/leds/; ls -d */)
delrid=$(echo $dirled | tac --regex --separator="\s")
ctrl_led=($(echo $dirled | sed 's/\(input\)/\/sys\/class\/leds\/\1/g'  | sed 's/\s/\n/g' | sed 's/\($\)/brightness\1/g'))
ctrl_led_back=($(echo $delrid | sed 's/\(input\)/\/sys\/class\/leds\/\1/g'  | sed 's/\s/\n/g' | sed 's/\($\)/brightness\1/g'))
#for d in $dirled; do ls $(echo $pref$d); done
 #echo $dirled | sed 's/\(input\)/\/sys\/class\/leds\/\1/g' | xargs -n1 ls


state=0

leds=( "$num" "$caps" "$scroll" ) 
leds_back=( "$scroll" "$caps" "$num" ) 
animations=( "one" "two" "three" "rand" )
number_animation=${#animations[@]}

source "sh/animations.sh"

if [ "$1" = "--help" ]; then
    echo -e "\nAs an argument, indicate the time of flashing of the LEDs\n"
    echo -e "example:\n"
    echo -e "./blink.sh 0.5\n"
    echo -e "Use Ctrl+\ for switch animation\n"
    
    exit 0
fi

if [ $# != 0 ]; then
    sleep_time=$1
        else sleep_time=0.1
fi
    

# Функция-обработчик SIGINT 
exit_func () 
{
    echo -e $FONT_COLOR_RED"\nПерехвачен CTRL+C. Скрипт остановлен\n"$FONT_NORMAL
    exit 0
    for d in ${!ctrl_led[*]}; do
        echo "${start_state[$d]}" > "${ctrl_led[$d]}"
    done
    exit 0
}

# Функция-обработчик SIGQUIT
switch ()
{
if [ $state -eq 0 ];then
    state=1
    elif [ $state -gt 0 -a $state -lt $number_animation ]; then 
        ((state++))
    else state=0
fi
}
# Отслеживаем нажатие CTRL+C
trap exit_func SIGINT

# Отслеживаем нажатие CTRL+\

trap switch SIGQUIT

while true; do 

${animations[$state]}

done;

exit 0
