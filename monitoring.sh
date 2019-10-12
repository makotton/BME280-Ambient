#!/usr/bin/sh
sudo sendmail -t < reboot.mail &
while true
do
  isAlive=`ps -ef | grep "bme280ambient.py" | grep -v grep | wc -l`
  if [ $isAlive -gt 0 ]; then
    echo "bme280ambient.py is alive."
  else
    echo "bme280ambient.py is dead."
    sudo python bme280ambient.py &
    sudo sendmail -t < restart.mail &
  fi
  sleep 60
done