#!/bin/bash
# Change XCLIENT and/or display to your destination xserver (XSDL platform). 
# Example: export DISPLAY=192.168.1.101:0

# Note: You will likely want to reserve a DHCP address or set a static IP of the 
# Xserver clientso that your IP does not change and require reconfiguration. 

export XCLIENT=change_me
export DISPLAY=change_me

if [ $XCLIENT == "change_me" ]; then
	echo "launch_mixwarescreen.sh for XSDL/XServer Clients has not been cofigured properly. Please edit this file to point to your XServer Client"
	exit 
fi


# Send script to daemon process so that it does not fail when tty closes.
#    

export PYMIXWARESCREEN=~/.MixwareScreen-env/bin/python
export PYMIXWARESCREENPARAM=~/MixwareScreen/main.py


if [ -f $PYMIXWARESCREEN ]; then
	echo "Testing $PYMIXWARESCREEN"
	test -x $PYMIXWARESCREEN || echo "$PYMIXWARESCREEN is Not Executable"
fi

if [ -f $PYMIXWARESCREENPARAM ]; then
	echo "Testing $PYMIXWARESCREENPARAM"
	test -f $PYMIXWARESCREENPARAM || echo "$PYMIXWARESCREENPARAM is not a file"
fi


case "$1" in
      start)
	      echo -n "Starting Mixware Screen Xclient Deamon .... "
	      setsid "$PYMIXWARESCREEN" "$PYMIXWAREPARAM" #>/dev/null 2>&1 < /dev/null &
	      echo "running"
		;;
	stop)
		echo -n "Stopping Mixware Screen Xclient Deamon .... "
		PID=`ps -ef|grep MixwareScreen-env/bin/python|awk '{print $2}'`
		kill -9 $PID 
		echo "stopping"
	    	;;
	*)
           	echo "Usage: $0 start"
            	exit 1
             	;;
esac


