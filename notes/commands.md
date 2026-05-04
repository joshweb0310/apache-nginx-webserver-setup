# Useful Linux, Apache, and Nginx Commands

A quick cheat sheet for common hosting and troubleshooting tasks.

---

## System Commands

### Update system
sudo apt update && sudo apt upgrade -y

Code

### Check running services
systemctl status <service>

Code

### Restart a service
sudo systemctl restart <service>

Code

### Enable service on boot
sudo systemctl enable <service>

Code

---

## Apache Commands

### Test config
sudo apachectl configtest

Code

### Restart Apache
sudo systemctl restart apache2

Code

### Enable a module
sudo a2enmod <module>

Code

### Disable a module
sudo a2dismod <module>

Code

### Enable a site
sudo a2ensite <site>

Code

### Disable a site
sudo a2dissite <site>

Code

### Logs
/var/log/apache2/error.log
/var/log/apache2/access.log

Code

---

## Nginx Commands

### Test config
sudo nginx -t

Code

### Restart Nginx
sudo systemctl restart nginx

Code

### Reload Nginx
sudo systemctl reload nginx

Code

### Logs
/var/log/nginx/error.log
/var/log/nginx/access.log

Code

---

## File & Permission Commands

### Change ownership
sudo chown -R $USER:$USER /var/www/example

Code

### Change permissions
sudo chmod -R 755 /var/www/example

Code

### View permissions
ls -l

Code

---

## Networking Commands

### Check open ports
sudo lsof -i -P -n

Code

### Check DNS
dig example.com
nslookup example.com

Code

### Check IP
ip a
