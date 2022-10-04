from concurrent.futures.process import _threads_wakeups
from flask import Flask, render_template

app = Flask(__name__)

@app.route("/")
def index():
    return render_template("index.html")
    #return "Hello, this is build in FLASK"

if __name__ == "__main__":
    app.run(debug=True)