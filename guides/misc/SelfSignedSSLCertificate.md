# Make self signed certificates

```Bash
openssl req -newkey rsa:4069 -nodes -x509 -days 365 -subj "/CN=<IP-Address>" -keyout key.pem -out cert.pem
```

Replace `<IP-Address>` for the address for which you want the certificate

## Using `subjectAltName`

If only using `CN` isn't working for you, and you need to use `subjectAltName`, try this command:

```bash
openssl req -newkey rsa:4096 -nodes -addext "subjectAltName = IP:<IP-Address>" -subj "/CN=<IP-Address>" -x509 -days 365 -keyout key.pem -out cert.pem
```

If you want to use a domain name instead of an IP address, use `DNS:<Domain-Name>` for the value of `subjectAltName`.

# Signed with own CA certificate

Credit: This guide is basically the guide from the [Harbor documentation](https://goharbor.io/docs/2.12.0/install-config/configure-https/#generate-a-certificate-authority-certificate)

If you need multiple certificates and don't want to trust all of them separately, it can be easier to create a ca certificate, sign all the certificates with the ca cert and then only trust that ca cert:

1. Create ca key and cert pair
```bash
openssl req -x509 -newkey rsa:4096-new -nodes -sha512 -days 3650 \
  -subj "/C=<Country-Code>/ST=<State>/L=<City>/CN=MyPersonal Root CA" \
  -keyout ca.key.pem \
  -out ca.crt.pem
```

2. Generate Certificate Signing Request (csr) (do this for each server where you need a certificate for)

   Note that CN can alo be an IP-Address
```bash
openssl req -sha512 -new -nodes \
  -subj "/C=<Country-Code>/ST=<State>/L=<City>/CN=yourdomain.com" \
  -newkey rsa:4096 \
  -keyout yourdomain.com.key.pem \
  -out yourdomain.com.csr
```

3. Generate x509 v3 extension file

  Paste the following into a file called `v3.ext` (or something else, but update the path in the following command then)

```
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
extendedKeyUsage = serverAuth
subjectAltName = @alt_names

[alt_names]
DNS.1=yourdomain.com
DNS.2=yourdomain
```
  If you run the server without a domain name (i.e., just behind an IP address) use `IP=XXX.XXX.XXX.XXX` instead of the `DNS.X` lines under `[alt_names]`.

4. Generate the certificate

```bash
openssl x509 -req -sha512 -days 3650 \
    -extfile v3.ext \
    -CA ca.crt.pem -CAkey ca.key.pem -CAcreateserial \
    -in yourdomain.com.csr \
    -out yourdomain.com.pem
```
