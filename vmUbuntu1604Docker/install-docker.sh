echo $1
apt-get update
apt-get install -y --no-install-recommends \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual
apt-get install -y --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://apt.dockerproject.org/gpg | sudo apt-key add -
add-apt-repository \
       "deb https://apt.dockerproject.org/repo/ \
       ubuntu-$(lsb_release -cs) \
       main"
apt-get update
apt-get -y install docker-engine=1.13.1-0~ubuntu-xenial
groupadd docker
usermod -aG docker $1
systemctl enable docker
sysctl -w vm.max_map_count=262144
