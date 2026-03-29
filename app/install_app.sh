#!/bin/bash
apt-get update && apt-get install -y ngnix
echo "<h1>Burst mode Active: Serving from GCP</h1>" > /var/www/html/index.html

