# Convert `.pem` certificate to `.crt` file

```bash
openssl x509 -outform der -in cert.pem -out cert.crt
```
