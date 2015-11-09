#!/bin/sh
cd /opt/app && /usr/local/bin/gunicorn -w 3 app:app -b 0.0.0.0:8081
