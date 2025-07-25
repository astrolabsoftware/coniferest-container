#!/usr/bin/env bash

# Push image to Docker Hub or load it inside kind

# @author  Fabrice Jammes, IN2P3

set -euxo pipefail

DIR=$(cd "$(dirname "$0")"; pwd -P)
PROJECT_DIR=$DIR

ciux ignite "$PROJECT_DIR"

. $PROJECT_DIR/.ciux.d/ciuxconfig.sh

echo "Using local image $IMAGE"
echo "oOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoO"
echo "   Welcome in k8s toolbox desk"
echo "oOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoO"
docker run -it \
    $MOUNTS --rm \
    --user=$(id -u):$(id -g $USER) \
    -w $HOME -- \
    "$IMAGE"