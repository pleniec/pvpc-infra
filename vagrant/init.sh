apt-get update
apt-get install -y git python-pip
curl -sSL https://get.docker.com/ | sh
usermod -aG docker vagrant
pip install docker-py requests
shutdown -r now
