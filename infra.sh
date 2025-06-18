#!/bin/bash

set -e

chmod +x OCI/oci-setup.sh
chmod +x AWS/aws-setup.sh

echo "Provisioning OCI resources...\n"
./OCI/oci-setup.sh
echo "\n\nProvisioning AWS resources...\n"
./AWS/aws-setup.sh
echo "All resources provisioned successfully! Check the respective cloud providers for the created resources.\n"