#!/bin/bash
set -e

psql --version
if [ $? != 0 ]; then
  echo continuing to installation

  sudo apt install -y postgresql postgresql-contrib
  if [ $? != 0 ]; then
    echo failed to install postgres for the reason listed above!

    exit 1
  fi
fi
