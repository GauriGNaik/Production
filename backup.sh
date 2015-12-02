#!/bin/bash
touch pkglist
echo "hello world"
sudo dpkg --get-selections | sed "s/.*deinstall//" | sed "s/install$//g" > /var/projects/production/pkglist
rsync -azP --exclude='node_modules' /var/projects/production/ root@159.203.84.107:/var/projects/production
#ssh -T root@159.203.84.107 "cd /var/projects/production ; ./execute.sh"
#ssh -T root@159.203.84.107 'bash -s' < execute.sh
#ssh root@159.203.84.107 'sudo apt-get install'
ssh root@159.203.84.107 'cd /var/projects/production'
#ssh root@159.203.84.107 'sudo rm /var/lib/dpkg/lock'
#ssh root@159.203.84.107 'apt-get install npm'
#ssh root@159.203.84.107 'npm install'
ssh root@159.203.84.107 'chmod +x /var/projects/production/execute.sh'
ssh root@159.203.84.107 'bash -s' < execute.sh
                                             