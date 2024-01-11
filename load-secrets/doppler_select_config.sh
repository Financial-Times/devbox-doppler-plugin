#!/bin/bash
set -eo pipefail

echo ""
echo "\e[1;32m$(basename $0) ...\e[0m"

# Check if config is set up, allow use of DOPPLER_PROJECT env var as safe to checkin
if [ -z $(doppler configure get project --plain) ]; then
  echo "Configure Doppler config:"
  doppler setup --no-read-env
fi

# Check if config is set up, don't allow use of DOPPLER_CONFIG env var as not safe to checkin
if [ -z $(doppler configure get config --plain --no-read-env) ]; then
  echo "Configure Doppler config:"
  doppler setup --no-read-env
fi

set +eo pipefail

