# Steps after install

## Read

```
man afterboot
man intro
```

## Locale support

Follow the steps on the faq to set up utf-8.  https://www.openbsd.org/faq/faq10.html#locales

Add ```export LC_CTYPE="hu_HU.UTF-8"``` to ~/.xsession and ~/.profile.

## Install fonts

```
$ pkg_add -D snap noto-fonts noto-cjk noto-emoji
```

## Set default umask to 077

In  /etc/login.conf set the default umask to ```077```.

## Edit /etc/mail/aliases

```
# Well-known aliases -- these should be filled in!
root:           sysadm
manager:        root
dumper:         root
```

## List running daemons

```
rcctl ls on
man 8 intro #learn about them
rcctl enable apmd #power management
```

## Check filesystem daily

/etc/daily.local

```
CHECKFILESYSTEMS=1
man 8 daily
```

## Configure pf

/etc/pf.conf
```
tcp_pass = "{22}"
block log

pass in proto icmp
pass in on egress proto tcp to port $tcp_pass
pass out
```

Some useful commands.
```
pfctl -f /etc/pf.conf #reload rules
pfctl -F all #empty firewall rules
pfctl -sr #list all active rules
```

# Disable root login and use pubkey auth

/etc/ssh/sshd_config
```
PermitRootLogin no
PubkeyAuthentication yes
PasswordAuthentication no
```

# Get notification about important stuff

Subscribe to the following mailinglists:
 * announce
 * security-announce
 * ports-security
