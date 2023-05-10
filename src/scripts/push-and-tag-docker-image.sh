#!/bin/bash

docker login -u $DOCKER_LOGIN --password-stdin https://eu.gcr.io < ${HOME}/account-auth.json

# shellcheck disable=SC2086
if [ ${TAG_LATEST} ]; then
  docker image tag "$DOCKER_REGISTRY"/"$CIRCLE_PROJECT_REPONAME":"$TAG"  $DOCKER_REGISTRY/$CIRCLE_PROJECT_REPONAME:latest
  echo "pushing image $DOCKER_REGISTRY/$CIRCLE_PROJECT_REPONAME:$TAG with tag 'latest'"
else
  docker image tag "$DOCKER_REGISTRY"/"$CIRCLE_PROJECT_REPONAME":"$TAG"
  echo "pushing image $DOCKER_REGISTRY/$CIRCLE_PROJECT_REPONAME:$TAG without tag 'latest'"
fi

docker push --all-tags "$DOCKER_REGISTRY"/"$CIRCLE_PROJECT_REPONAME"