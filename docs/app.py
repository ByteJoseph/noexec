from flask import Flask, request, send_from_directory

app = Flask(__name__)

@app.route('/')
def serve_file():
    user_agent = request.headers.get('User-Agent', '').lower()

    if 'curl' in user_agent:
        return send_from_directory('.', 'installer.sh', as_attachment=False)
    else:
        return send_from_directory('.', 'index.html')

if __name__ == '__main__':
    app.run()
