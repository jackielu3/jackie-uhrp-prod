#!/bin/bash

if [[ "$NODE_ENV" == "production" || "$NODE_ENV" == "staging" ]]; then
  npm run build
  printf '%s' "$GCP_STORAGE_CREDS" > storage-creds.json
  export GOOGLE_APPLICATION_CREDENTIALS="$PWD/storage-creds.json"
  npm run start
else
  npm run dev
fi
