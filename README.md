# A collection of ansible roles and scripts to handle updates of certificates
Deployment playbook for letsencrypt certificates, created for example with certbot.
I switched from opnsense/acme to Nginx Proxy Manager (NPM) to manage certificates, which 
creates ECC certs instead of RSA (the only supported type at the point of writing this) and by 
that, forced me to rewrite most of the script I had been using with RSA certs.

### Current tested on following systems and versions, others might work as well
- Unifi CloudKey Gen2 (4.4.3, 5.0.16)
- Proxmox (9.1.1)
- Synology NAS (DSM 7.2.2, 7.3.2)

Two playbooks is included, one pulls cerfificates from the NPM host while
the second one deploys the certs to each system

deploy_certs.yaml uses inventory groups to select roles, for example:
```
$ cat /etc/ansible/hosts
[all:vars]

[unifi]
cloudkey.somehost.se

[proxmox]
pve1.somehost.se
pve2.somehost.se

[synology]
nas.somehost.se
```

### Configure these files before use, example files included
group_vars/all/paths.yaml
roles/cert_puller/default/main.yaml

### Example bash script to first pull certs and deploy if new ones was found
Included in the repo, check_and_deploy.sh
It will first check for new certs and retrieve them, if new ones was found, the second playbook
which deploys the certs will be called.
To be used with for example crontab 

### Another way to run
It is to run deploy.yaml which handles both, but with some requirements if limits are used (localhost needs to be included)

### Vault
You can use ansible-vault to store credentials if you want to run it from crontab

this is just an example, may not be the best or the safest way
```
# to create a vault:
ansible-vault create group_vars/all/vault.yaml

# to edit
ansible-vault edit group_vars/all/vault.yaml

# pwd file for decryption when running with crontab for example
$ cat ~/.ansible.cfg
[defaults]
vault_password_file = /some/safe/path/.ansible_vault

# permissions permissions permissions
$ chmod 600 /some/safe/path/.ansible_vault
```

### Credits
Some inspiration is taken from: https://github.com/catchdave/ssl-certs/