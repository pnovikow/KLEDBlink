#!/bin/bash
# --------------
# The bash functions called from the main script contain the basic LED blinking algorithm
#
# ---------
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

rand_2 ()
{
   echo $(( ( RANDOM % 4 ) )) > "${ctrl_led[$(( ( RANDOM % $number_of_leds ) ))]}"
   sleep $sleep_time
}
