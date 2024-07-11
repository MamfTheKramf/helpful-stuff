# Make self signed certificates

```Bash
openssl req -newkey rsa:4069 -nodes -x509 -days 365 -subj "/CN=<IP-Address>" -keyout key.pem -out certificate.pem
```

Replace `<IP-Address>` for the address for which you want the certificate

## Using `subjectAltName`

If only using `CN` isn't working for you, and you need to use `subjectAltName`, try this command:

```bash
openssl req -newkey rsa:4096 -nodes -addext "subjectAltName = IP:<IP-Address>" -subj "/CN=<IP-Address>" -x509 -days 365 -keyout key.pem -out cert.pem
```

If you want to use a domain name instead of an IP address, use `DNS:<Domain-Name>` for the value of `subjectAltName`.
