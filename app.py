from flask import Flask, jsonify
from datetime import datetime

app = Flask(__name__)

@app.route("/test")
def hello_world():
    return jsonify({
        "test": True,
        "time": str(datetime.now())
    })
