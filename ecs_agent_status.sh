#!/bin/bash

INSTANCEID=$(curl --silent http://169.254.169.254/latest/meta-data/instance-id/)
AZ=$(curl --silent http://169.254.169.254/latest/meta-data/placement/availability-zone)
REGION=${AZ::-1}
#URL = Host IP and the port on which ECS agent is listeneing
URL="172.17.0.1:51678"

putdata() {
    aws cloudwatch put-metric-data --metric-name ECSAgentStatus --namespace ECSAgent \
        --dimensions InstanceID="$INSTANCEID" --value "$1" --unit Count --region "$REGION"
    echo "$(date) Exit code of put metrics: $?"
    sleep 60
}

while true; do

    HTTP_RESPONSE=$(curl --write-out "%{http_code}" --silent --output /dev/null "$URL")

    if [ "$HTTP_RESPONSE" = "200" ]; then
        putdata 0
    else
        putdata 1
    fi
done
