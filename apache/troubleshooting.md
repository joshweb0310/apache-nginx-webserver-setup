# Apache Troubleshooting Guide

This guide covers common Apache issues on Debian/Ubuntu systems and how to fix them.

---

## 1. Apache Won’t Start or Restart
### **Error Example**

Job for apache2.service failed because the control process exited with error code.

Code

### **Fix**
Check the syntax:
sudo apachectl configtest

Code

If you see:
Syntax OK

Code
then the issue is elsewhere.

Check logs:
sudo tail -n 50 /var/log/apache2/error.log

Code

Restart:
sudo systemctl restart apache2

Code

---

## 2. 403 Forbidden
### **Causes**
- Wrong permissions  
- Missing index file  
- Directory not allowed  

### **Fix**
Set correct permissions:
sudo chown -R $USER:$USER /var/www/example
sudo chmod -R 755 /var/www/example

Code

Ensure `.htaccess` is allowed:
AllowOverride All

Code

---

## 3. 404 Not Found
### **Fix**
Check DocumentRoot:
grep -R "DocumentRoot" /etc/apache2/sites-enabled/

Code

Ensure the file exists:
ls -l /var/www/example

Code

---

## 4. Rewrite Not Working
Enable the module:
sudo a2enmod rewrite
sudo systemctl restart apache2

Code

---

## 5. Port 80 Already in Use
Check what’s using it:
sudo lsof -i :80

Code

Stop the conflicting service.

---

## 6. SSL Not Working
Enable SSL:
sudo a2enmod ssl
sudo systemctl restart apache2

Code

Check cert paths in your vhost.

---

## 7. Logs
Error log:
/var/log/apache2/error.log

Code

Access log:
/var/log/apache2/access.log
