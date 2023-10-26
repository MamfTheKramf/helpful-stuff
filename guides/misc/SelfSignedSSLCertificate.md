# Make self signed certificates

```Bash
openssl req -newkey rsa:4069 -nodes -keyout key.pem -x509 -days 3650 -out certificate.pem -subj "/CN=<IP-Address>"
```

Replace `<IP-Address>` for the address for which you want the certificate
