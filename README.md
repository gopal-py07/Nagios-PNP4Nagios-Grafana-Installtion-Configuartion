# Nagios-PNP4Nagios-Grafana-Installtion-Configuartion
Monitoring Server with Nagios , PNP4Nagios and Grafana

What is Nagios?
Nagios is used for Continuous monitoring of systems, applications, services, and business processes etc in a DevOps culture. In the event of a failure, Nagios can alert technical staff of the problem, allowing them to begin remediation processes before outages affect business processes, end-users, or customers. With Nagios, you don’t have to explain why an unseen infrastructure outage affects your organization’s bottom line.
Plugins: 
These are compiled executables or scripts (Perl scripts, shell scripts, etc.) that can be run from a command line to check the status or a host or service. Nagios uses the results from the plugins to determine the current status of the hosts and services on your network.








Installation:
Installing Nagios core on ubuntu sever locally  
Open terminal and create file sudo vi nagios-install.sh and update below command in the file
	
sudo apt update && sudo apt upgrade
sudo apt install -y wget build-essential apache2 php openssl perl make php-gd libgd-dev libapache2-mod-php libperl-dev libssl-dev daemon autoconf libc6-dev libmcrypt-dev libssl-dev libnet-snmp-perl gettext unzip
cd /tmp
wget https://assets.nagios.com/downloads/nagioscore/releases/nagios-4.4.6.tar.gz
sudo useradd nagios
sudo groupadd nagcmd
sudo usermod -a -G nagcmd nagioo
tar -xzf nagios-4.4.6.tar.gz
cd nagios-4.4.6
sudo ./configure --with-httpd-conf=/etc/apache2/sites-enabled
sudo make all
sudo make install
sudo make install-init
sudo make install-commandmode
sudo make install-config
sudo /usr/bin/install -c -m 644 sample-config/httpd.conf /etc/apache2/sites-enabled/nagios.conf
sudo a2enmod rewrite
sudo a2enmod cgi
sudo systemctl restart apache2
cd /tmp
wget https://nagios-plugins.org/download/nagios-plugins-2.3.3.tar.gz
tar -xzf nagios-plugins-2.3.3.tar.gz
cd nagios-plugins-2.3.3
sudo ./configure --with-nagios-user=nagios --with-nagios-group=nagios --with-openssl
sudo make
sudo make install
sudo /usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg
sudo systemctl enable --now nagios.service
sudo systemctl restart apache2.service
sudo htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin
sudo nano /etc/apache2/sites-enabled/nagios.conf


Next, Give executable permission to file, sudo chmod 777 nagios-install.sh
Run the command, Sudo ./ nagios-install.sh 
While executing script asking for set password for Nagios . set any password and note it down
Note:
sudo systemctl restart apache2.service
[sudo] password for inpun0134nb:
System has not been booted with systemd as init system (PID 1). Can't operate. Got such error the use cmd 
sudo service  apache2 status | start | restart | stop

check sever http://localhost/nagios/  or (http://ip-sever/nagios/)
username : nagiosadmin
password : (enter your password which is set while executing script) 


Check hosts is up and default services are showing.(ref below)




Installing pnp4nagios graph which is given graphical view and later use for communicating with grafana-server

Installation of pnp4nagios:
Open terminal and create file such as , 
sudo vi pnp4nagios-install.sh and update fileas per below commands

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





Use click on esc then : (colon)  then wq!
Make file executable : sudo chmod 777 pnp4nagios-install.sh
Run file: sudo ./ pnp4nagios-install.sh
Check  server url on browser 
http://localhost/pnp4nagios/
sudo mv /usr/local/pnp4nagios/share/install.php /usr/local/pnp4nagios/share/old_install.php




























Installation of Graffana-Server:
	Open terminal and Create file : sudo vi grafana-install.sh
	Update file as per below
	
Use click on esc then : (colon)  then wq!
Make file executable : sudo chmod 777 grafana-install.sh
Run file: sudo ./ grafana-install.sh
Check url  http://localhost:3000/ on browser
username: admin
password: admin

update password after first login

sudo service npcd start
sudo service apache2 start
sudo service nagios start


sudo service apache2 restart 
 sudo service nagios restart
 sudo service npcd restart

woeking on documentation part
