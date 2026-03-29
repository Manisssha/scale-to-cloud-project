from flask import Flask
import time

app = Flask(__name__)

@app.route("/")
def home():
    return "App is running!"

@app.route("/load")
def load():
    # simulate CPU work
    start = time.time()
    while time.time() - start < 2:
        pass
    return "Load generated!"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000)
