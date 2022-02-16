install:
	apt install -y alsa-utils ffmpeg
	cp -v recording.sh /usr/local/pisound/scripts/pisound-btn/recording.sh
	cp -v recording.service /etc/systemd/system/recording.service

remove:
	rm /usr/local/pisound/scripts/pisound-btn/recording.sh
	rm /etc/systemd/system/recording.service
