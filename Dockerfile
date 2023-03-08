FROM alpine:3:17

COPY oxctl /oxctl
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
