#!/bin/bash

# given a GCP, etc account and the SDK on the install-from host, build and install a new server

# set the needed environment vars
. ../cloud-configuration/set-cloud-configuration.sh

. ./instance-name.sh

# launch the instance - assume it does NOT already exist
# on a tiny instance, this will take up to 10 minutes to create the instance,
# install Ubutnu and apply all patches
# it is faster on a larger instance
#
# TODO - check to see that the instance does not already exist
# use gcloud compute instances list --filter="name=(test-pdp11)"

echo "launching instance, patching (can take up to 10 minutes on a tiny)..."
../create-simple-google-instance/create-instance.sh

# put the main install script on the host and run it
# dont return here until the OS is running, all packages have been installed
gcloud compute scp update-os-build-simh.sh *.ini ${CLOUD_USERNAME}@${INSTANCENAME}: --project ${PROJ} --zone ${CLOUDSDK_COMPUTE_ZONE}
gcloud compute ssh ${CLOUD_USERNAME}@${INSTANCENAME} --project ${PROJ} --zone ${CLOUDSDK_COMPUTE_ZONE} -- chmod +x update-os-build-simh.sh

gcloud compute ssh ${CLOUD_USERNAME}@${INSTANCENAME} --project ${PROJ} --zone ${CLOUDSDK_COMPUTE_ZONE} -- './update-os-build-simh.sh'

echo 'OS and SIMH installed. Log into the instance and run the following commands:
$ simh-master/BIN/pdp11 tboot.ini 
$ simh-master/BIN/pdp11 buildunix.ini 
$ simh-master/BIN/pdp11 normalboot.ini 
NOTE: the first two scripts require that you manually halt ^E the simulation'



exit
