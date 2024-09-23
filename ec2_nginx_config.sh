#!/bin/bash

# Activate python virtual environment.
python3.9 -m venv venv
source venv/bin/activate

# Install python dependecies
pip install -r requirements.txt
pip install gunicorn pymysql cryptography

# Set Env Variables
FLASK_APP=microblog.py

# Configure flask
flask translate compile
flask db upgrade

# Validate Nginx configuration file
echo "Checking content of ngnix configuration file."
cat /etc/nginx/sites-enabled/default

# Run gunicorn web server
gunicorn -b :5000 -4 microblog:app
