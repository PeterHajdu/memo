# Steps after install

## Locale support

Follow the steps on the faq to set up utf-8.  https://www.openbsd.org/faq/faq10.html#locales

Add ```export LC_CTYPE="hu_HU.UTF-8"``` to ~/.xsession and ~/.profile.

## Install fonts

```
$ pkg_add -D snap noto-fonts noto-cjk noto-emoji
```

