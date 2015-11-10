
#!/usr/bin/env python

from flask import Flask
import urllib2
import json

url = "http://api.icndb.com/jokes/random"

app = Flask(__name__)


@app.route('/joke', methods=['POST'])
def joke_get():
    joke = urllib2.urlopen(url, timeout=3)
    joke_json = json.loads(joke.read())
    print joke_json["value"]["joke"]
    try:
        return "{\"color\": \"green\", \"message\": \"" + joke_json["value"]["joke"] + "\", \"notify\": false, \"message_format\": \"text\"}"
    except:
        return 404

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080)
