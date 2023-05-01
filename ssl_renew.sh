#!/bin/bash

COMPOSE="/usr/bin/docker-compose --ansi never"
DOCKER="/usr/bin/docker"

cd /home/ubuntu/wordpress-on-docker/
$COMPOSE run certbot renew && $COMPOSE kill -s SIGHUP webserver
$DOCKER system prune -af

# chmod +x ssl_renew.sh
# sudo crontab -e
# 0 12 * * * /home/ubuntu/wordpress-on-docker/ssl_renew.sh >> /var/log/cron.log 2>&1
