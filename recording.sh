#!/bin/bash

. /usr/local/pisound/scripts/common/common.sh

if [[ ! $(/usr/bin/systemctl is-active recording.service) = "active" ]]; then 
	periodic_led_blink 3 1
	/usr/bin/systemctl start recording
else
	/usr/bin/systemctl stop recording
	periodic_led_blink 0 0 
fi
