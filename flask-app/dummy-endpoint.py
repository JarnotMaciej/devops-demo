from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/', methods=['GET'])
def hello_world():
    """
    A simple hello-world GET endpoint.
    Returns a JSON response.
    """
    return jsonify({
        "status": "success",
        "message": "hello world",
        "data": "minimal setup working"
    }), 200

if __name__ == '__main__':
    app.run(debug=True, port=5000)