#!/bin/bash

# shellcheck disable=SC2021
TAG=$(echo "$BRANCH_NAME"."$(date '+%Y%m%d')"-"${CIRCLE_SHA1:0:7}"-"${CIRCLE_WORKFLOW_ID:0:4}" | tr '[:upper:]/_' '[:lower:]--' | tr -d '[ÆØÅæøå]')
echo "export $TAG" >> "$BASH_ENV"
echo "TAG created: $TAG"