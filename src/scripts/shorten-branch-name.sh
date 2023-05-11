#!/bin/bash

# Shorten to max length and removes any "-" if last:
# shellcheck disable=SC2001
SHORT_BRANCH_NAME=$(echo ${"$BRANCH_NAME":0:55} | sed s'/[-]$//')
# Converts to lowercase and removes Norwegian characters:
# shellcheck disable=SC2021
SHORT_BRANCH_NAME=$(echo "$SHORT_BRANCH_NAME" | tr '[:upper:]' '[:lower:]' | tr -d '[ÆØÅæøå]')
# Removes "/" slashes, e.g. feature/ETU... to feature-ETU... because illegal in labels in Helm / GCP:
SHORT_BRANCH_NAME=${SHORT_BRANCH_NAME//\//-}
echo "export SHORT_BRANCH_NAME=\"${SHORT_BRANCH_NAME}\"" >> "$BASH_ENV"