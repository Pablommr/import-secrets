#!/bin/bash
set -euo pipefail

echo ""
echo "Checking ENVs..."
echo ""

if [ -z "${ALL_SECRETS:-}" ]; then
  echo 'Env ALL_SECRETS is empty! Please, fulfil it with "${{ toJson(secrets) }}" action env!'
  echo 'Env ALL_SECRETS is empty! Please, fulfil it with "${{ toJson(secrets) }}" action env!' >> "$GITHUB_STEP_SUMMARY"
  exit 1
fi

echo "Env ALL_SECRETS fulfilled!"
echo ""

while IFS= read -r key; do
  value="$(jq -r --arg k "$key" '.[$k]' <<< "$ALL_SECRETS")"

  echo "Exporting env: $key"

  delimiter="ghadelimiter_$(od -An -N16 -tx1 /dev/urandom | tr -d ' \n')"

  {
    printf '%s<<%s\n' "$key" "$delimiter"
    printf '%s\n' "$value"
    printf '%s\n' "$delimiter"
  } >> "$GITHUB_ENV"
done < <(jq -r 'keys[]' <<< "$ALL_SECRETS")

echo ""
echo "Done =D"