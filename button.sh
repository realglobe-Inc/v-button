#!/bin/sh

gpio_number=203
button_id="button-01"
#issue_id=1

if [ ! -d "/sys/class/gpio/gpio${gpio_number}" ]; then      # GPIOがexportされていなければexportする
  echo ${gpio_number} > /sys/class/gpio/export
fi
echo 1 > /sys/class/gpio/gpio${gpio_number}/active_low      # GPIOをActiveLowに設定する
echo rising > /sys/class/gpio/gpio${gpio_number}/edge       # パルスの立ち上がりで割り込みを発生させる

./select /sys/class/gpio/gpio${gpio_number}/value |         # ボタンが押されるごとに1行値がくる
while read i; do
  echo "Button pressed: ${i}"
  #v-call -H "v.realglobe.work" -P "https" "jp.realglobe.daisan.idou-hanbai" notify ${button_id} ${issue_id} &
  v-call -H "v.realglobe.work" -P "https" "jp.realglobe.daisan.idou-hanbai" notify ${button_id} &
done
