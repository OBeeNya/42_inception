# NGINX can be accessed by port 443 only
sudo netstat -tulpn

# Ensure that a SSL/TLS certificate is used
curl --insecure -vvI https://baubigna.42.fr 2>&1 | awk 'BEGIN { cert=0 } /^\* SSL connection/ { cert=1 } /^\*/ { if (cert) print }'
