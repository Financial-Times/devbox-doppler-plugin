#!/bin/bash
set -eo pipefail

echo ""
echo "\e[1;32m$(basename $0) ...\e[0m"

# Check if user is authenticated with Doppler
doppler whoami --no-read-env >/dev/null 2>&1
if [ $? -ne 0 ]; then
  echo "Authenticate with Doppler:"
  doppler login
fi

set +eo pipefail

