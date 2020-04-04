Setting up nginx:

```
sudo yum install epel-release
sudo yum install nginxosudo systemctl start nginx
sudo systemctl enable nginx

# Enable server blocks:
sudo mkdir /etc/nginx/sites-available
sudo mkdir /etc/nginx/sites-enabled

sudo vi /etc/nginx/nginx.conf
#Add in http:
#http {
#  include /etc/nginx/sites-enabled/*.conf;
#  server_names_hash_bucket_size 64;
#  ...
#}

# Important: this is only for internal traffic, not used in multihost
setsebool -P httpd_can_network_connect 1
```