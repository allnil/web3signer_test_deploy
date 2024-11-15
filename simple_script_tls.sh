#!/bin/bash

# Create config directory if it doesn't exist
mkdir -p config

# Generate server certificate and convert to p12
openssl req -x509 -newkey rsa:2048 -nodes \
  -keyout config/server.key \
  -out config/server.crt \
  -days 365 \
  -subj "/CN=localhost" \
  -addext "subjectAltName = DNS:localhost,IP:127.0.0.1"

openssl pkcs12 -export \
  -in config/server.crt \
  -inkey config/server.key \
  -out config/web3signer_keystore.p12 \
  -name "web3signer" \
  -passout pass:password123

# Generate client certificate
openssl req -x509 -newkey rsa:2048 -nodes \
  -keyout config/client.key \
  -out config/client.crt \
  -days 365 \
  -subj "/CN=client"

# Get client fingerprint
FINGERPRINT=$(openssl x509 -in config/client.crt -noout -fingerprint -sha256 | cut -d'=' -f2)

# Create config files
echo "password123" > config/password.txt
echo "client $FINGERPRINT" > config/knownClients.txt

# Create config.yaml
cat > config/config.yaml << EOF
http-listen-host: "0.0.0.0"
http-listen-port: 9000
http-host-allowlist: "*"

# TLS configuration
tls-keystore-file: /config/web3signer_keystore.p12 
tls-keystore-password-file: /config/password.txt 
tls-known-clients-file: /config/knownClients.txt
EOF

echo "Setup complete! Certificates and configuration files created in ./config/"