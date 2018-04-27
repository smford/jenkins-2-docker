#!/bin/sh

trap catchtrap HUP INT QUIT TERM

catchtrap() {
	echo "Trap has been caught, shutting down"
  exit 1
}

service nginx start
su -m jenkins -c /usr/local/bin/jenkins.sh

echo "[hit enter key to exit] or run 'docker stop <container>'"
read

service nginx stop

echo "exited $0"
