#!/bin/sh

name=qmk

echo "Checking if container is running"
running=`docker ps --quiet --filter name=$name --filter status=running`
if [ "$running" != "" ]; then
    echo "Container running, starting a new shell"
    docker exec -it $running /bin/bash
    exit
fi

echo "Checking if container exists"
exists=`docker ps -a --quiet --filter name=$name --filter status=exited`
if [ "$exists" != "" ]; then
    echo "Container exists, restarting"
    docker start $exists
    docker attach $exists
    echo "To delete the container, run: docker rm $exists"
    exit
fi

echo "Container not found, starting a new one"
docker run \
    --name $name \
    -v $(pwd):/code \
    -v $HOME/.cache:/home/ubuntu/.cache \
    -v $HOME/dotfiles:/home/ubuntu/dotfiles:ro \
    -v /dev:/dev \
    --privileged \
    --user ubuntu \
    -it \
    $name \
    /bin/bash
id=`docker ps -a --quiet --filter name=$name`
echo "The container will remain available. To delete it, run: docker rm $id"

