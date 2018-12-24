#!/bin/bash
if [ ! -f $RENOVATE_CONFIG_FILE ]
then
  echo "$RENOVATE_CONFIG" > "$RENOVATE_CONFIG_FILE"
fi
node /usr/src/app/lib/renovate.js