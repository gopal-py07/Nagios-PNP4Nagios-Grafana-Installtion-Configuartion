sudo apt-get update
sudo apt-get install -y rrdtool librrd-simple-perl php-gd php-xml
cd /tmp
sudo wget -O pnp4nagios.tar.gz https://github.com/lingej/pnp4nagios/archive/0.6.26.tar.gz
sudo tar xzf pnp4nagios.tar.gz
cd pnp4nagios-0.6.26
sudo ./configure --with-httpd-conf=/etc/apache2/sites-enabled
sudo make all
sudo make install
sudo make install-webconf
sudo make install-config
sudo make install-init
# Reload systemd to pick up any changes to unit files
sudo systemctl daemon-reload

# Enable the npcd.service to start on boot using service
sudo service npcd enable

# Start the npcd.service immediately using service
sudo service npcd start

# Restart Apache web server (apache2 service) using service
sudo service apache2 restart

