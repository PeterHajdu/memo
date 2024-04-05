# sshd config

## disable password and root login

/etc/ssh/sshd_config
```
PermitRootLogin no
PubkeyAuthentication yes
PasswordAuthentication no
```

