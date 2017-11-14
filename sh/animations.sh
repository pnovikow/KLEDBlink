#!/bin/bash


one ()
{
    for d in "${leds[@]}"; do
        echo 1 > $d
        sleep $sleep_time
        echo 0 > $d
    done
}

two ()
{
    for d in "${leds[@]}"; do
        echo 1 > $d
        sleep $sleep_time
    done

    for d in "${leds[@]}"; do
        echo 0 > $d
        sleep $sleep_time
    done
}

three ()
{

    for d in "${leds_back[@]}"; do
        echo 1 > $d
        sleep $sleep_time
    done

    for d in "${leds_back[@]}"; do
        echo 0 > $d
        sleep $sleep_time
    done
}

four ()
{
    for d in "${leds[@]}"; do
        echo 1 > $d
        sleep $sleep_time
    done

    for d in "${leds[@]}"; do
        echo 0 > $d
        sleep $sleep_time
    done
    
        for d in "${leds_back[@]}"; do
        echo 1 > $d
        sleep $sleep_time
    done

    for d in "${leds_back[@]}"; do
        echo 0 > $d
        sleep $sleep_time
    done
}

five ()
{
    echo $(( ( RANDOM % 2 ) )) > "${leds[$(( ( RANDOM % 3 ) ))]}"
    sleep $sleep_time

}
