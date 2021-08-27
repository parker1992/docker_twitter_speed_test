#!/bin/bash

CONFIG=twitter_api.config

update_config()
{
    VAR_NAME=$1
    VAR_VALUE=$2

    sed -i "s/$VAR_NAME=.*$/$VAR_NAME=$VAR_VALUE/" $CONFIG
}

vars=("api_key" "api_secret" "access_key" "access_secret" "pay_down" "pay_up" "min_down" "isp_handle" "location" "additional_message")

for var in "${vars[@]}"
do
    update_config $var ${!var}
done

echo "$schedule cd /app && python speed_test.py > /proc/1/fd/1 2>/proc/1/fd/2" > twitter_speed_test_cron
chmod 755 twitter_speed_test_cron

crontab twitter_speed_test_cron

crond -f -l 2

