#!/bin/bash
ansible  $1 -u root -e "ssh_connection_password=$2"   -m user -a "password={{ '<NEXTCLOUD_SERVERS_ROOT_PASSWORD_HERE>' | password_hash('sha512', '<PASSWORD_HASH>') }} name=cloudbuilder state=present "-u 
echo "set up user cloudbuilder"

ansible $1 -u root -e "ssh_connection_password=$2" -m authorized_key -a "user=cloudbuilder state=present key={{ lookup('file', '/home/<LOCAL_USER>/.ssh/<YOUR_PUBLIC_SSH_KEY>') }}"

ansible $1 -u root -e "ssh_connection_password=$2" -m copy -a "content=\"user ALL=(ALL:ALL) NOPASSWD:ALL\" dest=/etc/sudoers.d/user validate: /usr/sbin/visudo -csf %s"