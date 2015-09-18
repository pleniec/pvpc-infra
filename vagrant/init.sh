apt-get update
apt-get install -y git python-pip
pip install docker-py
curl -sSL https://get.docker.com/ | sh
usermod -aG docker vagrant
shutdown -r now
