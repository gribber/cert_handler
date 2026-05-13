### A collection of ansible roles and scripts to handle updates of certificates
Mostly rewritten to use ECC certs from Nginx Proxy Manager to other systems

# Current supported/tested on following systems and versions
- Unifi CloudKey Gen2 (4.4.3, 5.0.16)
- Proxmox (9.1.1)
- Synology NAS (DSM 7.2.2)

Two playbooks is included, one pulls cerfificates from the NPM host while
the second one deploys the certs to each system

deploy_certs.yaml uses inventory groups to select roles

# Configure these files before use, example files included
group_vars/all/paths.yaml
roles/cert_puller/default/main.yaml

# Example bash script to first pull certs and deploy if new ones was found

included in the repo, check_and_deploy.sh


# Another posibility is to run deploy.yaml which handles both, but with some requirements if limits are used