# Cloud Images

This repository contains Ansible playbooks to be used to create images with Aerokube tools for popular cloud platforms.

Usage:

1. Update `hosts` file with VM hostname

2. Launch playbook:
```
$ ansible-playbook -i hosts selenoid.yml
```
For cloud platforms not allowing (e.g. Google Cloud) root access to VM - change username in hosts file and add `--become`:
```
$ ansible-playbook -i hosts selenoid.yml --become
```

## Additional Actions for Google Cloud

1. Need to create an image from stopped VM disk (not a snapshot!):
```
$ gcloud compute images create <image-name> --source-disk <vm-disk-name> --source-disk-zone  us-central1-a --force
```
2. Add `Compute Image User` role for `allAuthenticatedUsers`.
3. Assign license to image (see [docs](https://cloud.google.com/marketplace/docs/partners/vm/build-vm-image#create_a_licensed_vm_image)):
```
$ gcloud compute images create <new-image-name> --project=<project-id> --source-image=<original-image> --source-image-project=<project-id> --licenses projects/<project-id>/global/licenses/<license-name> --description "Selenoid 1.9.2 image"
```
Here `<license-name>` is from Partner Portal section (usually `selenoid`), `<project-id>` is `aerokube-software-public`.
