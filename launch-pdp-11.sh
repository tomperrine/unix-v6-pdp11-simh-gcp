#!/bin/bash

# given a GCP, etc account and the SDK on the install-from host, build and install a new server

# set the needed enviropnment vars
. ../cloud-configuration/set-cloud-configuration.sh

. ./instance-name.sh

# launch the instance - assume it does NOT already exist
# on a tiny instance, this will take up to 10 minutes to create the instance,
# install Ubutnu and apply all patches
# it is faster on a larger instance
echo "launching instance, patching (can take up to 10 minutes on a tiny)..."
../create-simple-google-instance/create-instance.sh

#
# here's how to get the internal and external IP addresses for all instances
echo "internal address: " `gcloud --format="value(networkInterfaces[0].networkIP)"  compute instances list`
echo "external IP address: " `gcloud --format="value(networkInterfaces[0].accessConfigs[0].natIP)"  compute instances list`

# or for just the known instance
echo just this instance
gcloud --format="value(networkInterfaces[0].networkIP)"  compute instances describe ${INSTANCENAME} --zone ${CLOUDSDK_COMPUTE_ZONE}


# put the main install script on the host and run it
# dont return here until the OS is running, all packages have been installed
gcloud compute scp update-os-build-simh.sh ${CLOUD_USERNAME}@${INSTANCENAME}: --project ${PROJ} --zone ${CLOUDSDK_COMPUTE_ZONE}
gcloud compute ssh ${CLOUD_USERNAME}@${INSTANCENAME} --project ${PROJ} --zone ${CLOUDSDK_COMPUTE_ZONE} -- chmod +x update-os-build-simh.sh

gcloud compute ssh ${CLOUD_USERNAME}@${INSTANCENAME} --project ${PROJ} --zone ${CLOUDSDK_COMPUTE_ZONE} -- './update-os-build-simh.sh'


exit
