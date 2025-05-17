#!/bin/bash

cd /home/ubuntu/app

# Kill existing Flask process if running
pkill -f "python3 app.py"

# Set up virtual environment and install dependencies
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

# Start the Flask app in the background
nohup python3 app.py > output.log 2>&1 &
