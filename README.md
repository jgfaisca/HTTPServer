# HTTPServer

HTTPS server with Basic authentication and client certificate authentication.  

## Installation

```sh
$ pip install http_server
```

## Usage

```sh
# Serve HTTP.
$ python -m http_server

# Serve HTTPS.
$ python -m http_server -s /path/to/server/cert.pem

# Serve HTTPS and enable client certificate authentication.
$ python -m http_server -s /path/to/server/cert.pem -c /path/to/CA/cacert.pem

# Enable Basic authentication.
# Create user 'alice' with password '4321', and user 'bob' with password '8756'.
$ python -m http_server -u alice bob -p 4321 8756

# Environment variables are also available.
$ export SIMPLE_HTTPS_USERS='alice bob'
$ export SIMPLE_HTTPS_PASSWORDS='4321 8756'

# Enable multi-thread.
$ python -m http_server -t

# Specify listening port (default: 8000).
$ python -m http_server 8080

# Bind to localhost only.
$ python -m http_server -b 127.0.0.1

# Enable IPv6.
$ python -m http_server -b ::

# create a self-signed TLS certificate and private key
$ openssl req -new -newkey rsa:2048 -x509 -sha256 -days 365 -nodes -out cert.pem -keyout key.pem
...

