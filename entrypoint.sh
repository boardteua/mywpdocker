#!/bin/bash

echo "$(hostname -i)\t$(hostname) $(hostname).localhost" >> /etc/hosts
service sendmail restart
apache2-foreground