#!/bin/bash
apt-get update
apt-get install software-properties-common
apt-add-repository --yes --update ppa:ansible/ansible
apt-get install -y ansible
echo -e '[demo_hosts]\n${node_names}' >> /etc/ansible/hosts
echo -e '${node_ips}' >> /etc/hosts
