#!/bin/bash
gcloud compute instances create burst-node-1 \
    --zone=asia-southeast2-a \
    --machine-type=e2-micro \
    --image-family=ubuntu-2204-lts \
    --image-project=ubuntu-os-cloud \
    --provisioning-model=SPOT \
    --metadata-from-file=startup-script=/home/manish/scale-to-cloud-project/app/install_app.sh

