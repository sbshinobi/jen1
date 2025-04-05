from http.server import HTTPServer, BaseHTTPRequestHandler

class SimpleHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type", "text/html")
        self.end_headers()
        self.wfile.write(b"Yo, Earth! Live from EC2!")

httpd = HTTPServer(('0.0.0.0', 80), SimpleHandler)
httpd.serve_forever()