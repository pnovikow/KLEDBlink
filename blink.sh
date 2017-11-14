#!/bin/bash

num=/sys/class/leds/input0\:\:numlock/brightness
caps=/sys/class/leds/input0\:\:capslock/brightness
scroll=/sys/class/leds/input0\:\:scrolllock/brightness
caps_lock_state=$(cat $caps)
scroll_lock_state=$(cat $scroll)
num_lock_state=$(cat $num)
state=0

leds=( "$num" "$caps" "$scroll" ) 
leds_back=( "$scroll" "$caps" "$num" ) 

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
    echo $num_lock_state > /sys/class/leds/input0\:\:numlock/brightness
    sleep $sleep_time
    echo  $caps_lock_state > /sys/class/leds/input0\:\:capslock/brightness
    sleep $sleep_time
    echo $scroll_lock_state > /sys/class/leds/input0\:\:scrolllock/brightness
    sleep $sleep_time
    exit 0
}

# Функция-обработчик SIGQUIT
switch ()
{
if [ $state -eq 0 ];then
    state=1
    elif [ $state -gt 0 -a $state -lt 4 ]; then 
        ((state++))
    else state=0
fi
}
# Отслеживаем нажатие CTRL+C
trap exit_func SIGINT

# Отслеживаем нажатие CTRL+\

trap switch SIGQUIT

while true; do 

case $state in

    0) 
        one
        ;;
    1)
        two
        ;;
    2) 
        three
        ;;
    3) 
        four
        ;;
    4) 
        five
        ;;
esac
    
done;

exit 0
