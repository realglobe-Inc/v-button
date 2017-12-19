#!/bin/sh

# gpio198 の初期化処理
echo 198 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio198/direction
echo 0 > /sys/class/gpio/gpio198/value

while :; do
  if [ "`cat /var/run/led_state`" = "on" ]; then
    echo 1 > /sys/class/gpio/gpio198/value
  elif [ "`cat /var/run/led_state`" = "off" ]; then
    echo 0 > /sys/class/gpio/gpio198/value
  elif [ "`cat /var/run/led_state`" = "blink" ]; then
    echo 1 > /sys/class/gpio/gpio198/value
    sleep 0.5
    echo 0 > /sys/class/gpio/gpio198/value
  else
    : "do nothing"
  fi
  sleep 0.5
done
