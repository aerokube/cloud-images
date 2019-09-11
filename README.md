# Cloud Images

This repository contains Ansible playbooks to be used to create images with Aerokube tools for popular cloud platforms.

Usage:

1. Update `hosts` file with VM hostname

2. Launch playbook:
```
$ ansible-playbook -i hosts selenoid-digitalocean.yml
```
