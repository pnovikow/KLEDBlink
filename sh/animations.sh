#!/bin/bash


one ()
{
    for d in "${ctrl_led[@]}"; do 
        echo 1 > $d
        sleep $sleep_time
        echo 0 > $d
    done
}

two ()
{
    for d in "${ctrl_led[@]}"; do
        echo 1 > $d
        sleep $sleep_time
    done

    for d in "${ctrl_led[@]}"; do
        echo 0 > $d
        sleep $sleep_time
    done
}

three ()
{
    for d in "${ctrl_led[@]}"; do
        echo 1 > $d
        sleep $sleep_time
    done

    for d in "${ctrl_led[@]}"; do
        echo 0 > $d
        sleep $sleep_time
    done
}

rand ()
{
        echo $(( ( RANDOM % 2 ) )) > "${ctrl_led[$(( ( RANDOM % $number_of_leds ) ))]}"
        sleep $sleep_time
}
