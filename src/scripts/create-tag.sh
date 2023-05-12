#!/bin/bash

# shellcheck disable=SC2021
echo "export TAG=$(echo "$BRANCH_NAME"."$(date '+%Y%m%d')"-"${CIRCLE_SHA1:0:7}"-"${CIRCLE_WORKFLOW_ID:0:4}" | tr '[:upper:]/_' '[:lower:]--' | tr -d '[ÆØÅæøå]')" >> "$BASH_ENV"
echo "TAG created: $TAG"