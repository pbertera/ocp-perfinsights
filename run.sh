#!/bin/bash

NAME=perfinsights
IMAGE=quay.io/pbertera/ocp-perfinsights

sudo podman run --hostname $NAME \
	--name $NAME \
	--privileged \
	--net=host \
	--pid=host \
	--ipc=host \
	--tty \
	--interactive \
	--security-opt label=disable \
	--volume /run:/run \
	--volume /var/log:/var/log \
	--volume /etc/machine-id:/etc/machine-id \
	--volume /etc/localtime:/etc/localtime \
	$IMAGE $@
