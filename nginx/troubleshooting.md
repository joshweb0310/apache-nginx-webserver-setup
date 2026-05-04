# Nginx Troubleshooting Guide

This guide covers common Nginx issues on Debian/Ubuntu systems and how to fix them.

---

## 1. Nginx Won’t Start or Reload
### **Fix**
Test config:
sudo nginx -t

Code

If errors appear, fix the file shown.

Restart:
sudo systemctl restart nginx

Code

---

## 2. 403 Forbidden
### **Causes**
- Wrong permissions  
- Missing index file  
- Directory not readable  

### **Fix**
sudo chown -R $USER:$USER /var/www/example
sudo chmod -R 755 /var/www/example

Code

Ensure index file exists:
ls /var/www/example

Code

---

## 3. 404 Not Found
### **Fix**
Check root path:
grep -R "root" /etc/nginx/sites-enabled/

Code

Check try_files:
try_files $uri $uri/ =404;

Code

---

## 4. Port 80 Already in Use
Check:
sudo lsof -i :80

Code

Stop the conflicting service.

---

## 5. Server Block Not Loading
Ensure it’s enabled:
sudo ln -s /etc/nginx/sites-available/example /etc/nginx/sites-enabled/

Code

Reload:
sudo systemctl reload nginx

Code

---

## 6. SSL Issues
Check cert paths:
ssl_certificate
ssl_certificate_key

Code

Test config again:
sudo nginx -t

Code

---

## 7. Logs
Error log:
/var/log/nginx/error.log

Code

Access log:
/var/log/nginx/access.log
