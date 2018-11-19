#!/bin/bash
echo 'starting server'
echo "$path"
git clone "$path"

echo 'Git project downloaded'

# cd ./json-server-customers-api

echo 'Starting JSON Server'
# json-server sandbox_runner.js -p 3000 -r sandbox_routers.json

json-server data.json -p 3000 -r routes.json