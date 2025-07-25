#!/usr/bin/env bash

# Push image to Docker Hub or load it inside kind

# @author  Fabrice Jammes, IN2P3

set -euxo pipefail

DIR=$(cd "$(dirname "$0")"; pwd -P)
PROJECT_DIR=$DIR

SELECTOR="run"
ciux ignite -l "$SELECTOR" "$PROJECT_DIR"

. $PROJECT_DIR/.ciux.d/ciuxconfig.sh

mounts="--volume $DIR/homefs:/home/coniferest"
mounts="$mounts --volume /etc/group:/etc/group:ro -v /etc/passwd:/etc/passwd:ro"

echo "Using image $CIUX_IMAGE_URL"
docker run -d \
    --name coniferest \
    $mounts --rm \
    --user=$(id -u):$(id -g $USER) \
    -w /home/coniferest -- \
    "$CIUX_IMAGE_URL"

ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' coniferest)

echo "oOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoO"
echo "  Welcome in coniferest"
echo "  Connect through your web browser to: http://$ip:8888"
echo "oOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoO"



