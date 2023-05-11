#!/bin/bash

echo "$DOCKER_PASSWORD" > "${HOME}"/account-auth.json
gcloud auth activate-service-account --key-file "${HOME}"/account-auth.json
