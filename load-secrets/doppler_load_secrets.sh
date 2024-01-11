#!/bin/bash
set -eo pipefail


echo ""
echo "\e[1;32m$(basename $0) ...\e[0m"

# Useful diagnostic output
echo "Configuring Doppler secrets as env vars:"
echo "  project: $(doppler configure get project --plain --no-read-env)"
echo "  config:  $(doppler configure get config --plain --no-read-env)"

SECRETS=$(doppler secrets download --no-file --no-read-env --format env)

while IFS= read -r secret; do
  eval "export $secret"
done < <(printf '%s' "$SECRETS" | grep -v '^DOPPLER_PROJECT=\|^DOPPLER_CONFIG=\|^DOPPLER_ENVIRONMENT=')

echo ""
echo "\e[1;32mDone.\e[0m"

set +eo pipefail

