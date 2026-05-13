#!/bin/bash

# Cleanup old marker
rm -f /tmp/cert_updated_marker

# Run first playbook
ansible-playbook pull_certs.yaml

# Check for marker
if [ -f /tmp/cert_updated_marker ]; then
    echo "Cert was updated, running playbook to deploy certs..."
#    ansible-playbook deploy_certs.yaml
fi
