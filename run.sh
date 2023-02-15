#!/bin/bash
# ./run.sh -d 10S -r quick -a -q -o /tmp/report
#
NAME=perfinsights
IMAGE=quay.io/pbertera/ocp-perfinsights
sudo mkdir ${PWD}/report && chmod 777 ${PWD}/report

sudo podman run --hostname $NAME \
	--name $NAME \
	--rm \
	--privileged \
	--net=host \
	--pid=host \
	--ipc=host \
	--tty \
	--interactive \
	--security-opt label=disable \
	--volume /sys:/sys \
	--volume /proc:/proc \
	--volume /run:/run \
	--volume /var/log:/var/log \
	--volume /etc/machine-id:/etc/machine-id \
	--volume /etc/localtime:/etc/localtime \
	--volume /etc/redhat-release:/etc/redhat-release \
	--volume $PWD/report:/tmp/report \
	$IMAGE $@
