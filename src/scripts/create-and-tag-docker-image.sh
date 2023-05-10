#!/bin/bash

# shellcheck disable=SC2086
if [ ${TAG_LATEST} ]; then
  echo "creating image $DOCKER_REGISTRY/$CIRCLE_PROJECT_REPONAME:$TAG with tag 'latest'"
  # shellcheck disable=SC2094
  docker build -t "$DOCKER_REGISTRY"/"$CIRCLE_PROJECT_REPONAME":"$TAG" -t latest .
else
  echo "creating image $DOCKER_REGISTRY/$CIRCLE_PROJECT_REPONAME:$TAG without tag 'latest'"
  docker build -t "$DOCKER_REGISTRY"/"$CIRCLE_PROJECT_REPONAME":"$TAG" .
fi