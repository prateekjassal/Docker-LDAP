# Pull base image
docker pull ubuntu:14.04
# Read from conf file for setting domain name
source conf/ldap-install.conf
# Build image
docker build -t ubuntu/ldapserver .
# Remove any existing containers
docker rm -f ldapserver
docker run --name=ldapserver --hostname=$domainName -d -p 636:636 -p 389:389 \
ubuntu/ldapserver
