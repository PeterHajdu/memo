# Generate private key for ca

``` bash
openssl genrsa -out aabpca.key 2048
```

# Generate ca cert

``` bash
openssl req -x509 -new -key aabpca.key -sha256 -days 1825 -out aabpca.pem
```

# Generating requests

First generate a private key.

``` bash
openssl req -new -key sppit.key -out sppit.csr
```

# Signing the certificate

``` bash
openssl x509 -req -in sppit.csr -CA aabpca.pem -CAkey aabpca.key -CAcreateserial -out sppit.crt
```

# From other source

# Create the root CA

based on https://jamielinux.com/docs/openssl-certificate-authority/create-the-root-pair.html

## key

``` bash
openssl genrsa -aes256 -out private/ca.key.pem 4096
```

## root cert

``` bash
openssl req -config openssl.cnf \
      -key private/ca.key.pem \
      -new -x509 -days 7300 -sha256 -extensions v3_ca \
      -out certs/ca.cert.pem
```
