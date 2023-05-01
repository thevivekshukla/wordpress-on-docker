#!/bin/bash

COMPOSE="/usr/bin/docker-compose -f docker-compose-production.yml --ansi never"
DOCKER="/usr/bin/docker"

cd /home/ubuntu/wordpress-on-docker/
$COMPOSE run certbot renew && $COMPOSE kill -s SIGHUP webserver
$DOCKER system prune -af

# # copy this file in your home directory because after chmod +x, it will be shown 
# # as changed in git
# cp ssl_renew.sh ~/ssl_renew.sh
# chmod +x ~/ssl_renew.sh
# sudo crontab -e
# 0 12 * * * /home/ubuntu/ssl_renew.sh >> /var/log/cron.log 2>&1
