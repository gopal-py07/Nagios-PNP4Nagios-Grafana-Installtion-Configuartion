# Nagios-PNP4Nagios-Grafana-Installtion-Configuartion
Monitoring Server with Nagios , PNP4Nagios and Grafana

What is Nagios?
Nagios is used for Continuous monitoring of systems, applications, services, and business processes etc in a DevOps culture. In the event of a failure, Nagios can alert technical staff of the problem, allowing them to begin remediation processes before outages affect business processes, end-users, or customers. With Nagios, you don’t have to explain why an unseen infrastructure outage affects your organization’s bottom line.
Plugins: 
These are compiled executables or scripts (Perl scripts, shell scripts, etc.) that can be run from a command line to check the status or a host or service. Nagios uses the results from the plugins to determine the current status of the hosts and services on your network.








Installation:
Installing Nagios core on ubuntu sever locally  
Open terminal and create file sudo vi nagios-install.sh and update below command in the file
	

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
