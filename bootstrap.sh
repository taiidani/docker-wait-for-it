#! /bin/sh

echo "Adding Docker package source"
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list

echo "Updating package repositories"
apt-get -yqq update

echo "Installing required host packages"
apt-get -yq install linux-image-extra-$(uname -r) docker-engine=1.10.1-0~trusty

echo "Setting up Docker group"
usermod -aG docker vagrant

echo "Installing Docker Compose"
curl -sSL https://github.com/docker/compose/releases/download/1.6.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# With docker compose command completion!
curl -sSL https://raw.githubusercontent.com/docker/compose/1.6.2/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose
