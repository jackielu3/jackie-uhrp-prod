#!/bin/bash
GCP_BUCKET_NAME=$1
gcloud functions deploy stagingNotifier \
    --gen2 \
    --runtime=nodejs22 \
    --env-vars-file=staging.functions.env.yaml \
    --entry-point=notifier \
    --timeout=540 \
    --region=us-central1 \
    --trigger-event=google.storage.object.finalize \
    --trigger-resource=$GCP_BUCKET_NAME \
    --memory=4096 \
    --source .