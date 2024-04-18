# Openssl usage

## Download site certificate

~~~
openssl s_client -connect <host>:<port> -showcerts > certificate_file
~~~

## Generate x509 certificate

~~~
cat certificate_file | openssl x509
~~~

## Generate sha256 fingerprint of certificate

~~~
cat certificate_file | openssl x509 -fingerprint -sha256
~~~

# ca

## create root key

```
openssl genrsa -out rootCA.key 2048
openssl req -x509 -new -nodes -key rootCA.key -sha256 -days 1024 -out rootCA.pem
```

## create certificate

```
openssl genrsa -out device.key 2048
openssl req -new -key device.key -out device.csr
openssl x509 -req -in device.csr -CA rootCA.pem -CAkey rootCA.key -CAcreateserial -out device.crt -days 500 -sha256
```

## requesting a certificate

```
openssl req -newkey rsa:4096 -keyout my.private.key -out my.csr
```

## signing a certificate request

```
openssl ca -config ca.conf -out my.crt -infiles my.csr
```
