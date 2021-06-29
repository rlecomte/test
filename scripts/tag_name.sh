#!/usr/bin/env bash

RELEASE_TYPE=$1
VERSION=$2
NUM=$3

if [[ ! $VERSION =~ ^([0-9]+)\.([0-9]+)\.([0-9]+)$ ]]; then
  echo "Something is wrong with your version. (eg: 1.2.3)"
  exit 1
fi

if [[ ! NUM =~ ^([0-9]+)$ ]]; then
  echo "Something is wrong with release candidate number."
  exit 1
fi

if [[ "$RELEASE_TYPE" = "staging" ]]; then
  echo "$VERSION-rc.$NUM"
elif [[ "$RELEASE_TYPE" = "prod" ]]; then
  echo "$VERSION"
else
  echo "release type should be [staging|prod]"
  exit 1
fi

