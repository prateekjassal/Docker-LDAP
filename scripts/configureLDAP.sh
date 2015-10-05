#!/bin/bash
source conf/ldap-install.conf
echo "slapd slapd/internal/generated_adminpw password root" | debconf-set-selections
echo "slapd slapd/internal/adminpw password root" | debconf-set-selections
echo "slapd slapd/password1 password root" | debconf-set-selections
echo "slapd slapd/password2 password root" | debconf-set-selections
echo "slapd slapd/domain string $domainName" |debconf-set-selections
echo "slapd shared/organization string $orgName" |debconf-set-selections
echo "slapd slapd/backend string $dbType" |debconf-set-selections
echo "slapd slapd/purge_database boolean $purgeDB" |debconf-set-selections
echo "slapd slapd/move_old_database boolean $moveOldDB" |debconf-set-selections
echo "slapd slapd/allow_ldap_v2 boolean $allowLDAPV2" |debconf-set-selections
echo "slapd slapd/no_configuration boolean $noConfig" |debconf-set-selections
dpkg-reconfigure -f noninteractive slapd
