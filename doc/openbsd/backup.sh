#!/usr/bin/env bash

folders="/etc /home /var/www /var/gopher"

host=deneb.im
d=$(date "+%d%m%y")
root=/root/backup/$d
mkdir -p $root
backup_tgz="$root/$host-$d.tar.gz"
backup_gpg="$backup_tgz.gpg"
tar cvzf $backup_tgz $folders
gpg -r peter.ferenc.hajdu@gmail.com -e $backup_tgz
scp $backup_gpg hptr@backup.deneb.im:backup/
rm -r $root

