#!/usr/bin/bash

service counter stop
rm /usr/local/bin/counterService.py
rm /lib/systemd/system/counter.service
rm /tmp/currentCount.out