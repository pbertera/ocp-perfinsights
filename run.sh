#!/bin/bash

NAME=perfinsights
IMAGE=quay.io/pbertera/ocp-perfinsights

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
	--volume /run:/run \
	--volume /var/log:/var/log \
	--volume /etc/machine-id:/etc/machine-id \
	--volume /etc/localtime:/etc/localtime \
	--volume /etc/redhat-release:/etc/redhat-release \
	$IMAGE $@
