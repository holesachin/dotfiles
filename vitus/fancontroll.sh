#!/usr/bin/bash
#
#

# Get the current status of pwm1_enable
PWM1_ENABLE_STATUS=$(cat /sys/devices/platform/hp-wmi/hwmon/hwmon*/pwm1_enable)

function fanc {
  # Check the current status and toggle it
  if [[ $PWM1_ENABLE_STATUS -eq "2" ]]; then
    echo "Enabling fan boost..."
    echo "0" | sudo tee /sys/devices/platform/hp-wmi/hwmon/hwmon*/pwm1_enable > /dev/null
    echo "Fan boost has been enabled."
  else
    echo "Disabling fan boost..."
    echo "2" | sudo tee /sys/devices/platform/hp-wmi/hwmon/hwmon*/pwm1_enable > /dev/null
    echo "Fan boost has been disabled."
  fi
}

# ngfc linux
# HP Victus 15-fb0xxx
# https://github.com/nbfc-linux/nbfc-linux
# https://github.com/nbfc-linux/nbfc-gtk?tab=readme-ov-file

# install `nbfc-linux` from altest release
if [[ ! -f /usr/bin/nbfc ]]; then
  curl -s https://api.github.com/repos/nbfc-linux/nbfc-linux/releases/latest \
    | grep browser_download_url \
    | grep x86_64.pkg.tar.zst \
    | cut -d '"' -f 4 \
    | xargs -n 1 curl -Lso /tmp/nbfc-linux.pkg.tar.zst
  sudo pacman -U /tmp/nbfc-linux.pkg.tar.zst

  sudo nbfc update
  sudo nbfc config --set "HP Victus 15-fb0xxx"
  sudo nbfc sensors set -a Max -s @CPU -f 0
  sudo nbfc sensors set -a Max -s @CPU -f 1
  sudo nbfc set -a

  sudo systemctl enable --now nbfc_service.service
fi

THRESHHOLD=5

function auto_fan_controll {
  # while sleep ${THRESHHOLD}; do
    # Get temperature in millidegrees and convert to Celsius
    TEMP=$(($(< /sys/class/hwmon/hwmon6/temp1_input) / 1000))

    if [ "$TEMP" -gt 79 ]; then

      sudo nbfc set -s 99 ; echo " ${TEMP} 󰈐 99"
    elif [ "$TEMP" -gt 69 ]; then
      sudo nbfc set -s 80 ; echo " ${TEMP} 󰈐 80"
    elif [ "$TEMP" -gt 59 ]; then
      sudo nbfc set -s 70 ; echo " ${TEMP} 󰈐 70"
    elif [ "$TEMP" -gt 49 ]; then
      sudo nbfc set -s 60 ; echo " ${TEMP} 󰈐 60"
    else
      # sudo nbfc set -a ; echo " ${TEMP} 󰈐 auto"
      sudo nbfc set -s 30 ; echo " ${TEMP} 󰈐 30"
    fi

    FAN_SPEED=$()
  # done
}

while [[ ${#} -gt 0 ]]; do
  case ${1} in
    --fanc) auto_fan_controll ; shift ;;
  esac
done

