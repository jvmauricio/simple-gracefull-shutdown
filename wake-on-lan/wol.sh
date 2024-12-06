#!/bin/bash

echo "Going to wake up server..."
sudo etherwake -i wlan0 00:00:00:00:00:00 #change to the MAC address of your target server to wake
