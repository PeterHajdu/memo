#!/usr/bin/env bash

function check_ssh {
  echo "Checking sshd config"
  sshd_config=/etc/ssh/sshd_config
  grep PermitRootLogin $sshd_config
  grep PasswordAuthentication $sshd_config
  grep PubkeyAuthentication $sshd_config
  echo "Fix $sshd_config if this is not ok."
  read
}

function check_pf {
  echo "Checking pf config"
  cat "/etc/pf.conf"
  echo "Fix /etc/pf.conf if this is not ok."
  echo "and reload rules with: pfctl -f /etc/pf.conf"
  read
}

function check_aliases {
  echo "Checking mail aliases"
  aliases_file="/etc/mail/aliases"
  grep "root:" $aliases_file
  grep "manager:" $aliases_file
  grep "dumper:" $aliases_file
  echo "This should be something like this:"
  echo "root: <new sysadmin user>"
  echo "manager: root"
  echo "dumber: root"

  echo "Fix $aliases_file"
  read
}

function check_filesystems_daily {
  echo "CHECKFILESYSTEMS=1" >> /etc/daily.local
  echo "syspatch -c" >> /etc/daily.local
}

function install_pf_badhost {
  echo "installing pf_badhost"
  useradd -s /sbin/nologin -d /var/empty _pfbadhost
  ftp https://geoghegan.ca/pub/pf-badhost/0.5/pf-badhost.sh
  install -m 755 -o root -g bin pf-badhost.sh /usr/local/bin/pf-badhost
  install -m 640 -o _pfbadhost -g wheel /dev/null /etc/pf-badhost.txt
  install -d -m 755 -o root -g wheel /var/log/pf-badhost
  install -m 640 -o _pfbadhost -g wheel /dev/null /var/log/pf-badhost/pf-badhost.log
  install -m 640 -o _pfbadhost -g wheel /dev/null /var/log/pf-badhost/pf-badhost.log.0.gz
  pkg_add ripgrep mawk

  echo "permit root" >> /etc/doas.conf
  echo "permit nopass _pfbadhost cmd /sbin/pfctl args -nf /etc/pf.conf" >> /etc/doas.conf
  echo "permit nopass _pfbadhost cmd /sbin/pfctl args -t pfbadhost -T replace -f /etc/pf-badhost.txt" >> /etc/doas.conf
  echo "permit nopass _pfbadhost cmd /usr/bin/zcat args -f /var/log/authlog /var/log/authlog.0.gz" >> /etc/doas.conf

  echo "add The following lines to your pf.conf"
  echo 'table <pfbadhost> persist file "/etc/pf-badhost.txt"'
  echo 'block in quick on egress from <pfbadhost>'
  echo 'block out quick on egress to <pfbadhost>'
  read

  doas -u _pfbadhost pf-badhost -O openbsd
  pfctl -f /etc/pf.conf
  doas -u _pfbadhost pf-badhost -O openbsd

  echo "update crontab: crontab -u _pfbadhost -e"
  echo "with this: ~ 0~1 * * * -s pf-badhost -O openbsd"
}

function install_sshguard {
  echo "add the following to pf.conf"
  echo 'table <sshguard> persist'
  echo 'block in from <sshguard>'
  read
  pkg_add sshguard
  cp /usr/local/share/examples/sshguard/sshguard.conf.sample /etc/sshguard.conf
  echo "edit /etc/sshguard.conf"
  rcctl enable sshguard
  rcctl start sshguard
}

check_ssh
check_pf
check_aliases
check_filesystems_daily
install_pf_badhost
install_sshguard

