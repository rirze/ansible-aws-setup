#!/bin/bash

# configure ssh to use key when reaching out to nodes
chmod 400 '${key_location}'
echo -e '[defaults]\nhost_key_checking = False' > /home/ubuntu/.ansible.cfg
## no simple way to do this, ssh-agent has to run everytime in a new bash shell
## make sure there's NO WHITESPACE after EOF
## if you ssh too early and need to restart bash, use `exec bash`
tee -a /home/ubuntu/.bashrc <<'EOF'

eval `ssh-agent -s` >> /dev/null
ssh-add '${key_location}' >> /dev/null
EOF

# update and install ansible
apt-add-repository --yes --update ppa:ansible/ansible
apt-get install -y ansible software-properties-common

# add nodes' addresses to ansible/hosts and hosts files
echo -e '[demo_hosts]\n${node_names}' >> /etc/ansible/hosts
echo -e '${node_ips}' >> /etc/hosts
