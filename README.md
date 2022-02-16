# About

One-button recording, without any devices besides Raspberry with Pisound needed.

## Core
- recording.sh: Wrapper for Pisound Button
	- Handles starting and stopping of recording
	- Blinks the led during recording
- recording.service: SystemD unit for recording
	- Dependency for external shares, needs to be adapted
	- Entire recording logic
	- Current date in filename, formatted as 2022-02-06_19-58-55.mp3

## Optional
- /etc/fstab:
	- Definition of mount point used in recording.service, via webdav (davfs) in my case
	- `https://<webdav-url> /srv/share davfs user,rw,auto,_netdev,nofail 0 0`
- /etc/davfs/secrets:
	- davfs credentials for non-interactive mount
  - `https://<webdav-url> <username> <password>`
- /etc/pisound.conf:
	- Button click configuration, for example
  - `CLICK_1 /usr/local/pisound/scripts/pisound-btn/recording.sh`

# Usage
- Create share directory with mkdir /srv/share
- Test mount with mount /srv/share
- Install (see below)
- Press button to start recording, led starts blinking
- Press button to stop recording, blinking intensivies during convert and upload and stops when done

- On the console the commands systemctl start recording.service and systemctl stop recording.service can be used respectively instead of pressing the button.

# Debugging
- `watch systemctl status recording.service`
- `journalctl -f -u recording.service`

# Requirements
- Raspberry Pi (Tested with Model 3 B)
- Pisound, optionally with case
- Raspbian OS installed (Tested with Raspbian 11)
- Packages: alsa-utils, ffmpeg 
	- Optionally davfs2 for share mount

# Install

`sudo make install`

# Remove

`sudo make remove`
