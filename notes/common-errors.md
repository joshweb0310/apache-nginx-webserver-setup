# Common Linux & Web Server Errors

A quick-reference guide for diagnosing frequent issues on Debian/Ubuntu systems.

---

## 1. Permission Denied
### **Cause**
- Wrong file or directory permissions
- Wrong ownership

### **Fix**
sudo chown -R $USER:$USER /var/www/example
sudo chmod -R 755 /var/www/example

Code

---

## 2. Port Already in Use
### **Cause**
Another service is using port 80 or 443.

### **Fix**
Check what’s running:
sudo lsof -i :80
sudo lsof -i :443

Code

Stop the conflicting service.

---

## 3. Service Not Starting
### **Cause**
- Bad configuration file
- Missing directory
- Syntax error

### **Fix**
Check status:
sudo systemctl status apache2
sudo systemctl status nginx

Code

Check logs:
sudo journalctl -xe

Code

---

## 4. 403 Forbidden
### **Cause**
- Missing index file
- Directory not readable
- Permissions incorrect

### **Fix**
sudo chmod -R 755 /var/www/example

Code

---

## 5. 404 Not Found
### **Cause**
- Wrong root path
- File missing

### **Fix**
Verify:
ls -l /var/www/example

Code

---

## 6. DNS Not Resolving
### **Cause**
- DNS not propagated
- Wrong A record

### **Fix**
Check DNS:
dig example.com
nslookup example.com

Code

---

## 7. Firewall Blocking Traffic
### **Fix**
sudo ufw allow 80
sudo ufw allow 443
sudo ufw status
