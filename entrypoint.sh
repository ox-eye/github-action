#!/bin/sh -l
set -x
hostname=$1
client_id=$2
secret=$3
command=$4
observer=$5
application=$6
release_tag=$7

AUTH=$(/oxctl authentication AuthExposedController_getAccessToken \
    --hostname $hostname \
    --authExposedControllerGetAccessTokenBody.clientId $client_id \
    --authExposedControllerGetAccessTokenBody.secret $secret \
    )

if [ "$AUTH" != "" ]
then
    RESULT=$(/oxctl release $command \ 
        --hostname $hostname \
        --observerName $observer \
        --applicationName application \
        --releaseTag $release_tag \
        )
    exit 0
else
    exit 1
fi
