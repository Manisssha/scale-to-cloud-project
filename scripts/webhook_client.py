from flask import Flask, request
import subprocess

app = Flask(__name__)

@app.route('/burst', methods=['POST'])
def burst():
    print(" Alert received → triggering GCP VM")

    subprocess.run(["bash", "/home/manish/scale-to-cloud-project/scripts/burst.sh"])

    return "OK"

app.run(host='0.0.0.0', port=5001)
