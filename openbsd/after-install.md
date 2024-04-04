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

