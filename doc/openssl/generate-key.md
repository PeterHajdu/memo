# simple rsa key generation

```
openssl genrsa -out stuff.key <keysize>
```

# generate public key from private key

```
openssl rsa -in stuff.key -pubout -out stuff.pub
```

