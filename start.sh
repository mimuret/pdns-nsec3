#!/bin/bash -ex

set -e

docker-compose up -d
docker-compose exec pdns /zone/load.sh
