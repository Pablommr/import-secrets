#!/bin/bash

echo ""
echo "Checking ENVs..."
echo ""

#Check if ENVs is fulfiled
if [ -z "$ALL_SECRETS" ]; then
  echo 'Env ALL_SECRETS is empty! Please, fulfil it with "${{ toJson(secrets) }}" action env!'
  echo 'Env ALL_SECRETS is empty! Please, fulfil it with "${{ toJson(secrets) }}" action env!' >> $GITHUB_STEP_SUMMARY
  exit 1
fi

echo "Env ALL_SECRETS fulfilled!"
echo ""

ARRAY_KEYS="$(echo -n $ALL_SECRETS | jq -cr 'to_entries')"

#Percorre todos os elementos do JSON $ALL_SECRETS
for (( i=0; i < $(echo $ARRAY_KEYS | jq -cr 'length'); ++i )) do
  key="$(echo -n $ARRAY_KEYS | jq -cr ".[$i].key")"
  value="$(echo -n $ARRAY_KEYS | jq -cr ".[$i].value")"

  echo "Exporting env: $key"
  echo "$key=$value" >> $GITHUB_ENV
done

echo ""
echo "Done =D"