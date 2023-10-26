# https_server

HTTPS server with support for SSL/TLS/HTTPS.

## Usage

```sh
# Serve HTTPS.
$ python3 ./https_server.py <port> <PEM certificate file> <private key file>

# Serve HTTPS example.
$ python3 ./https_server.py 443 ./cert.pem ./key.pem

# create a self-signed TLS certificate and private key
$ openssl req -new -newkey rsa:2048 -x509 -sha256 -days 365 -nodes -out cert.pem -keyout key.pem

```

# https_server_auth

HTTPS server with Basic authentication and client certificate authentication.  

## Installation

```sh
$ pip install https_server_auth
```

## Usage

```sh
# Serve HTTP.
$ python -m https_server_auth

# Serve HTTPS.
$ python -m https_server_auth -s /path/to/server/cert.pem

# Serve HTTPS and enable client certificate authentication.
$ python -m https_server_auth -s /path/to/server/cert.pem -c /path/to/CA/cacert.pem

# Enable Basic authentication.
# Create user 'alice' with password '4321', and user 'bob' with password '8756'.
$ python -m https_server_auth -u alice bob -p 4321 8756

# Environment variables are also available.
$ export SIMPLE_HTTPS_USERS='alice bob'
$ export SIMPLE_HTTPS_PASSWORDS='4321 8756'

# Enable multi-thread.
$ python -m https_server_auth -t

# Specify listening port (default: 8000).
$ python -m https_server_auth 8080

# Bind to localhost only.
$ python -m https_server_auth -b 127.0.0.1

# Enable IPv6.
$ python -m https_server_auth -b ::
...


