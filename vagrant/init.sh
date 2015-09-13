apt-get update
apt-get install -y git
curl -sSL https://get.docker.com/ | sh
usermod -aG docker vagrant
shutdown -r now
