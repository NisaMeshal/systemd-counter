#!/usr/bin/bash

id -u counter &>/dev/null || useradd --system --no-create-home counter

chmod +x /usr/local/bin/counterService.py

chown counter /usr/local/bin/counterService.py

systemctl daemon-reload

service counter start 

service counter status