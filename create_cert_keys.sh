#!/bin/bash
# 
# Create Self-Signed Certificates and Keys with openssl
#

## Creating the Certificate Authority's Certificate and Keys ##
echo "Creating the Certificate Authority's Certificate and Keys ..."

# 1. Generate a private key for the CA
openssl genrsa -out ca-key.pem 2048

# 2. Generate the X509 certificate for the CA
openssl req -new -x509 -nodes -sha256 -days 365 \
       -key ca-key.pem \
       -out ca-cert.pem

## Creating the Server's Certificate and Keys ##
echo "Creating the Server's Certificate and Keys ..."

# 1. Generate the private key and certificate request
openssl req -newkey rsa:2048 -nodes -days 365 \
   -keyout server-key.pem \
   -out server-req.pem

# 2. Generate the X509 certificate for the server
openssl x509 -req -days 365 -sha256 -CAcreateserial \
       -in server-req.pem \
       -out server-cert.pem \
       -CA ca-cert.pem \
       -CAkey ca-key.pem

# 3. Generate the server chain (certificate + key)
cat server-cert.pem server-key.pem > server-chain.pem

## Creating the Client's Certificate and Keys ##
echo "Creating the Client's Certificate and Keys ..."

# 1. Generate the private key and certificate request
openssl req -newkey rsa:2048 -nodes -days 365 \
   -keyout client-key.pem \
   -out client-req.pem

# 2. Generate the X509 certificate for the client
openssl x509 -req -days 365 -sha256 -CAcreateserial \
       -in client-req.pem \
       -out client-cert.pem \
       -CA ca-cert.pem \
       -CAkey ca-key.pem \
       -extfile client.cnf \
       -extensions client

# 3. Generate the client chain (certificate + key)
openssl pkcs12 -export -out client-chain.pfx \
       -inkey client-key.pem \
       -in client-cert.pem \
       -certfile ca-cert.pem

## Verifying the Certificates ##
echo "Verifying the Certificates ..."

# 1. Verify the server certificate:
openssl verify -CAfile ca-cert.pem \
   ca-cert.pem \
   server-cert.pem

# 2. Verify the client certificate:
openssl verify -CAfile ca-cert.pem \
   ca-cert.pem \
   client-cert.pem
   
