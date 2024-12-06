## Simple Gracefull Shutdown for Linux

A simple cron bash script to shutdown a linux based machine when an IP or hostname is out of reach. perfect for selfhosting and small homelab.

The script will ping an IP or hostname and if the target does not reply within a specified sleep limit, it will gracefully shutdown the machine.

### Use-case

This is usefull if your server is using UPS. When the electricity or internet is cut off, it will shutdown your machine safely.

### How to use


Git clone the repo and create a cron schedule (preferably every 5 mins) to execute the network_check.sh script.


### Optional wake-on-lan

You can have another slave machine and use the wake-on-lan script to power-up your server remotely.
