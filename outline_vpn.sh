#! /bin/bash

# Outline VPN
sudo su
yum-config-manager --enable rhui-REGION-rhel-server-extras
yum -y install docker
systemctl start docker
systemctl enable docker
sudo bash -c "$(wget -qO- https://raw.githubusercontent.com/Jigsaw-Code/outline-server/master/src/server_manager/install_scripts/install_server.sh)" 2>&1 | tee outline.log

# Whatsapp Proxy
curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/bin/docker-compose
chmod +x /usr/bin/docker-compose
yum -y install git-all
git clone https://github.com/WhatsApp/proxy.git
docker-compose -f proxy/proxy/ops/docker-compose.yml up -d
