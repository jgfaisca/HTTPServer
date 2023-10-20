#!/bin/bash
# 
# Create Self-Signed Certificates and Keys with openssl
#

## Creating the Certificate Authority's Certificate and Keys ##
echo "Creating the Certificate Authority's Certificate and Keys ..."

# 1. Generate a private key for the CA
openssl genrsa 2048 > ca-key.pem

# 2. Generate the X509 certificate for the CA
openssl req -new -x509 -nodes -days 365000 \
       -key ca-key.pem \
       -out ca-cert.pem

## Creating the Server's Certificate and Keys ##
echo "Creating the Server's Certificate and Keys ..."

# 1. Generate the private key and certificate request
openssl req -newkey rsa:2048 -nodes -days 365000 \
   -keyout server-key.pem \
   -out server-req.pem

# 2. Generate the X509 certificate for the server
openssl x509 -req -days 365000 -set_serial 01 \
       -in server-req.pem \
       -out server-cert.pem \
       -CA ca-cert.pem \
       -CAkey ca-key.pem

## Creating the Client's Certificate and Keys ##
echo "Creating the Client's Certificate and Keys ..."

# 1. Generate the private key and certificate request
openssl req -newkey rsa:2048 -nodes -days 365000 \
   -keyout client-key.pem \
   -out client-req.pem

# 2. Generate the X509 certificate for the client
openssl x509 -req -days 365000 -set_serial 01 \
       -in client-req.pem \
       -out client-cert.pem \
       -CA ca-cert.pem \
       -CAkey ca-key.pem

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
   
