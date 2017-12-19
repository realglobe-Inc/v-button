#!/bin/sh

subject=$1   # サブジェクトID
verb=$2      # コールされたメソッド名
object1=$3   # 1番目の引数
object2=$4   # 2番目の引数

if [ "${verb}" = "uname" ]; then
  uname -a
  exit
elif [ "${verb}" = "uptime" ]; then
  uptime
  exit
elif [ "${verb}" = "cpu_temp" ]; then
  cat /sys/class/thermal/thermal_zone0/temp
  exit
elif [ "${verb}" = "led" ]; then
  echo "${object1}" > /var/run/led_state
  exit
#elif [ "${verb}" = "button_pressed_target_subject" ]; then
#  cat target_subject
#  exit
#elif [ "${verb}" = "set_button_pressed_target_subject" ]; then
#  printf '%s' "${object1}" > target_subject
#  exit
fi

echo "Unknown verb: ${verb}"
exit 1
