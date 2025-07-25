#!/bin/bash

# Install pre-requisite for fink ci

# @author  Fabrice Jammes

set -euxo pipefail

DIR=$(cd "$(dirname "$0")"; pwd -P)
PROJECT_DIR=$DIR

ciux_version="v0.0.6-rc2"
go install github.com/k8s-school/ciux@"$ciux_version"

echo "Ignite the project using ciux"
ciux ignite --selector build $PROJECT_DIR
