#!/bin/bash

echo "Branch to create tag for: $BRANCH_NAME, shortened version: $SHORT_BRANCH_NAME"
if [ "$SHORT_BRANCH_NAME" == null ]; then
  SHORT_BRANCH_NAME=$BRANCH_NAME
fi
# shellcheck disable=SC2021
TAG=$(echo "$SHORT_BRANCH_NAME"."$(date '+%Y%m%d')"-"${CIRCLE_SHA1:0:7}"-"${CIRCLE_WORKFLOW_ID:0:4}" | tr '[:upper:]/_' '[:lower:]--' | tr -d '[ÆØÅæøå]')
echo "export $TAG" >> "$BASH_ENV"
echo "TAG created: $TAG"