#!/usr/bin/env bash

RELEASE_TYPE=$1

if [ "$RELEASE_TYPE" = "staging" ]; then
  "$VERSION-RC"
if [ "$RELEASE_TYPE" = "prod" ]; then
  "$VERSION"
else
  exit 1
fi
