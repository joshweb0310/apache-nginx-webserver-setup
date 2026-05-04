#!/bin/bash

# ============================================
# Nginx Web Server Installation Script
# For Debian/Ubuntu-based Linux Systems
# ============================================

set -e

echo "--------------------------------------------"
echo " Nginx Installation Script"
echo " For Debian/Ubuntu-based systems"
echo "--------------------------------------------"

# Update package list
echo "[1/7] Updating package list..."
sudo apt update -y

# Install Nginx
echo "[2/7] Installing Nginx..."
sudo apt install nginx -y

# Enable and start Nginx
echo "[3/7] Enabling and starting Nginx..."
sudo systemctl enable nginx
sudo systemctl start nginx

# Create test website directory
echo "[4/7] Creating test website directory..."
sudo mkdir -p /var/www/testsite
echo "<h1>Nginx is running successfully!</h1>" | sudo tee /var/www/testsite/index.html > /dev/null

# Set permissions
echo "[5/7] Setting permissions..."
sudo chown -R $USER:$USER /var/www/testsite
sudo chmod -R 755 /var/www/testsite

# Create a basic server block
echo "[6/7] Creating server block..."
sudo tee /etc/nginx/sites-available/testsite > /dev/null <<EOF
server {
    listen 80;
    server_name _;
    root /var/www/testsite;
    index index.html;

    location / {
        try_files \$uri \$uri/ =404;
    }

    access_log /var/log/nginx/testsite_access.log;
    error_log /var/log/nginx/testsite_error.log;
}
EOF

# Enable the server block
echo "[7/7] Enabling server block..."
sudo ln -sf /etc/nginx/sites-available/testsite /etc/nginx/sites-enabled/testsite

# Test configuration
echo "Testing Nginx configuration..."
sudo nginx -t

# Reload Nginx
echo "Reloading Nginx..."
sudo systemctl reload nginx

echo "--------------------------------------------"
echo " Nginx installation complete!"
echo " Visit your server's IP address to verify."
echo "--------------------------------------------"

