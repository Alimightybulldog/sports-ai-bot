from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return "✅ Your Sports AI Bot is running and ready!"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
