#!/usr/bin/env bash

err(){
    echo "E: $*" >>/dev/stderr
}

RELEASE_TYPE=$1
VERSION=$2
NUM=$3

if [[ ! $VERSION =~ ^([0-9]+)\.([0-9]+)\.([0-9]+)$ ]]; then
  err "Something is wrong with your version. (eg: 1.2.3)"
  exit 1
fi

if [[ "$RELEASE_TYPE" = "staging" ]]; then

  if [[ ! $NUM =~ ^([0-9]+)$ ]]; then
    err "Something is wrong with release candidate number."
    exit 1
  fi

  echo "$VERSION-rc.$NUM"
  exit 0

elif [[ "$RELEASE_TYPE" = "prod" ]]; then
  echo "$VERSION"
  exit 0
else
  err "release type should be [staging|prod]"
  exit 1
fi

