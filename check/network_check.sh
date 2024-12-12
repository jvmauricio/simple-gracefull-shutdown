#!/bin/bash
# cron script for checking wlan connectivity
# change 192.168.1.1 to whatever IP you want to check. preferably your router or web hostname (i.e google.com)
IP_FOR_TEST="192.168.1.1"
PING_COUNT=1

PING="/bin/ping"
IFUP="/sbin/ifup"
IFDOWN="/sbin/ifdown --force"

#change your interface
INTERFACE="eth0"

FFLAG="~/check/stuck.fflg" #flag for delay. edit to where you will put your network_check.sh script

# ping test
$PING -c $PING_COUNT $IP_FOR_TEST > /dev/null 2> /dev/null
if [ $? -ge 1 ]
then
    logger "$INTERFACE seems to be down, trying to bring it up..."
        if [ -e $FFLAG ]
        then
                logger "$INTERFACE is still down, REBOOT to recover ..."
               # echo "Target IP not detected, house might not have power. shutting down $(hostname)" | mail -s "ALERT NO POWER" <YOUR EMAIL HERE>@gmail.com
                rm -f $FFLAG 2>/dev/null
                sudo shutdown now
        else
                touch $FFLAG
                logger $(sudo $IFDOWN $INTERFACE)
                sleep 10
                logger $(sudo $IFUP $INTERFACE)
        fi
#else
#    logger "$INTERFACE is up"
fi
