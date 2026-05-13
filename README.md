# A collection of ansible roles and scripts to handle updates of certificates
Mostly rewritten to use ECC certs from Nginx Proxy Manager to other systems

Deployment playbook for letsencrypt certificates, created for example with certbot.
I'm using nginx proxy manager to manage certificates, which creates ECC certs
and by that, forced me to rewrite most of the script I had been using with RSA certs.

### Current tested on following systems and versions, others might work as well
- Unifi CloudKey Gen2 (4.4.3, 5.0.16)
- Proxmox (9.1.1)
- Synology NAS (DSM 7.2.2)

Two playbooks is included, one pulls cerfificates from the NPM host while
the second one deploys the certs to each system

deploy_certs.yaml uses inventory groups to select roles

### Configure these files before use, example files included
group_vars/all/paths.yaml
roles/cert_puller/default/main.yaml

### Example bash script to first pull certs and deploy if new ones was found
Included in the repo, check_and_deploy.sh
To be used with for example crontab 

### Another way to run
It is to run deploy.yaml which handles both, but with some requirements if limits are used

### Vault
You can use ansible-vault to store credentials if you want to run it from crontab

### Credits
Some insperation is taken from: https://github.com/catchdave/ssl-certs/