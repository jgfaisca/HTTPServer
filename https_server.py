import http.server
import ssl
import sys

def serve(host, port, cert_fpath, privkey_fpath):
    context = ssl.SSLContext(ssl.PROTOCOL_TLS_SERVER)
    context.load_cert_chain(certfile=cert_fpath, keyfile=privkey_fpath, password='')
    server_address = (host, port)
    httpd = http.server.HTTPServer(server_address, http.server.SimpleHTTPRequestHandler)
    httpd.socket = context.wrap_socket(httpd.socket, server_side=True)
    httpd.serve_forever()


if __name__ == '__main__':
    if len(sys.argv) < 4:
        print(f'Usage:\n  {sys.argv[0]} <port> <PEM certificate file> <private key file>')
        sys.exit()
    
    PORT = int(sys.argv[1])
    CERT_FPATH = sys.argv[2]
    PRIVKEY_FPATH = sys.argv[3]
    
    serve('0.0.0.0', PORT, CERT_FPATH, PRIVKEY_FPATH)
    
