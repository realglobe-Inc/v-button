#!/bin/sh

echo 199 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio199/direction
echo 0 > /sys/class/gpio/gpio199/value

while :; do
  if ping -c 4 -W 2 8.8.8.8 > /dev/null; then
  #if ping -c 4 -W 2 8.8.8.8; then
    echo 1 > /sys/class/gpio/gpio199/value
  else
    echo 0 > /sys/class/gpio/gpio199/value
  fi
  sleep 3
done
