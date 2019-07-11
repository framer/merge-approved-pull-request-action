#!/bin/sh

set -e

apt update && apt install --no-install-recommends -y jq > /dev/null 2>&1
