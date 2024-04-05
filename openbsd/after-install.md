# Steps after install

## Read

```
man afterboot
man intro
```

## Configure pf

Check pf.md

## Configure sshd

Check sshd.md

## Locale support

Follow the steps on the faq to set up utf-8.  https://www.openbsd.org/faq/faq10.html#locales

Add ```export LC_CTYPE="hu_HU.UTF-8"``` to ~/.xsession and ~/.profile.

## Install fonts

```
$ pkg_add -D snap noto-fonts noto-cjk noto-emoji
```

## Set default umask to 077

Add to ~/.profile and /etc/skel/.profile

```
umask 077
```

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

## Get notification about important stuff

Subscribe to the following mailinglists:
 * announce
 * security-announce
 * ports-security

## Great information sources

 * [host with openbsd](https://si3t.ch/ah/en/)
 * [openbsd faq](https://www.openbsd.org/faq/)
 * [openbsd handbook](https://www.openbsdhandbook.com/)

