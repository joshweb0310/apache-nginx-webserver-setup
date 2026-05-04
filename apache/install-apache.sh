#!/bin/bash

# ============================================
# Apache Web Server Installation Script
# For Debian/Ubuntu-based Linux Systems
# ============================================

# Exit immediately if a command exits with a non-zero status
set -e

echo "--------------------------------------------"
echo " Apache Installation Script"
echo " For Debian/Ubuntu-based systems"
echo "--------------------------------------------"

# Update package list
echo "[1/6] Updating package list..."
sudo apt update -y

# Install Apache
echo "[2/6] Installing Apache..."
sudo apt install apache2 -y

# Enable Apache service
echo "[3/6] Enabling and starting Apache..."
sudo systemctl enable apache2
sudo systemctl start apache2

# Enable common Apache modules
echo "[4/6] Enabling recommended Apache modules..."
sudo a2enmod rewrite
sudo a2enmod ssl
sudo a2enmod headers

# Create a test website directory
echo "[5/6] Creating test website directory..."
sudo mkdir -p /var/www/testsite
echo "<h1>Apache is running successfully!</h1>" | sudo tee /var/www/testsite/index.html > /dev/null

# Set permissions
echo "[6/6] Setting permissions..."
sudo chown -R $USER:$USER /var/www/testsite
sudo chmod -R 755 /var/www/testsite

# Restart Apache to apply changes
echo "Restarting Apache..."
sudo systemctl restart apache2

echo "--------------------------------------------"
echo " Apache installation complete!"
echo " Visit your server's IP address to verify."
echo "--------------------------------------------"
