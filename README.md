# HTTPServer

HTTPS server with Basic authentication and client certificate authentication.  

## Installation

```sh
$ pip install HTTPServer
```

## Usage

```sh
# Serve HTTP.
$ python -m HTTPServer

# Serve HTTPS.
$ python -m HTTServer -s /path/to/server/cert.pem

# Serve HTTPS and enable client certificate authentication.
$ python -m HTTServer -s /path/to/server/cert.pem -c /path/to/CA/cert.pem

# Enable Basic authentication.
# Create user 'alice' with password '4321', and user 'bob' with password '8756'.
$ python -m HTTPServer -u alice bob -p 4321 8756

# Environment variables are also available.
$ export SIMPLE_HTTPS_USERS='alice bob'
$ export SIMPLE_HTTPS_PASSWORDS='4321 8756'

# Enable multi-thread.
$ python -m HTTPServer -t

# Specify listening port (default: 8000).
$ python -m HTTPServer 8080

# Bind to localhost only.
$ python -m HTTPServer -b 127.0.0.1

# Enable IPv6.
$ python -m HTTPServer -b ::

# create a self-signed TLS certificate and private key
$ openssl req -new -newkey rsa:2048 -x509 -sha256 -days 365 -nodes -out crt.pem -keyout key.pem
...

```
