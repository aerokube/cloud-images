# Cloud Images

This repository contains Ansible playbooks to be used to create images with Aerokube tools for popular cloud platforms.

Usage:

1. Update `hosts` file with VM hostname

2. Launch playbook:
```
$ ansible-playbook -i hosts selenoid.yml
```
For Google Cloud add change username in hosts file and add `--become`:
```
$ ansible-playbook -i hosts selenoid.yml --become
```

## Additional Actions for Google Cloud

1. Need to create an image from stopped VM (not a snapshot!).
2. Add `Compute Image User` role for `allAuthenticatedUsers`.
3. Assign license to image:
```
$ gcloud compute images create <new-image-name> --project=<project-id> --source-image=<original-image> --source-image-project=<project-id> --licenses projects/<project-id>/global/licenses/<license-name> --description "Selenoid 1.9.2 image"
```
