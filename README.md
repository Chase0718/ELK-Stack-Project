# ELK-Stack-Project
Automated ELK Stack Deployment
The files in this repository were used to configure the network depicted below.
Cyber-Security-Project-1/ AzureNetworkDiagram.png
These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the Filebeat-playbook the file may be used to install only certain pieces of it, such as Filebeat.
filebeat-playbook.yml
This document contains the following details:
Description of the Topologu
Access Policies
ELK Configuration
Beats in Use
Machines Being Monitored
How to Use the Ansible Build
Description of the Topology
The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.
Load balancing ensures that the application will be highly available, in addition to restricting access to the network.
Load balancers can help with preventing intrusions from the outside by restricting acces to the servers that hole the application. Furthermore, Load balancers protect agaisnt denial of service by diverting traffic to another server if one server is compromised. 
Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the files and system metrics.
Filebeats watch for changes in the file locations that the user specifies or log files. Then filebears collects and sends the data to elastic search. 
Metricbeat collects the metric data from the services and sends it to elastic search.
The configuration details of each machine may be found below. Note: Use the Markdown Table Generator to add/remove values from the table.
Name
Function
IP Address
Operating System
Jump Box
Gateway
10.0.0.1
Linux
ELK-VM
Hosts
10.2.0.5
Linux
Web-1
Hosts
10.0.0.7
Linux
Web-2
Hosts
10.0.0.8
Linux
Access Policies
The machines on the internal network are not exposed to the public Internet. 
Only the jump box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
Personal IP address, set up with a SSH keygen. 
Machines within the network can only be accessed by Jump box.
Only the Jump box with the IP 20.114.57.185 with anisible container can access the ELK server.
A summary of the access policies in place can be found in the table below.
Name
Publicly Accessible
Allowed IP Addresses
JumpBox
Yes
10.0.0.7 and 10.0.0.8
ELK-VM
No
SSH 10.2.0.5 JumpBox HTTP Port 5601 Personal IP
Web-1
Through load Balancer
LB public IP 20.109.173.116 10.0.0.4 Jumpbox
Web-2
Through load Balancer
LB public IP 20.109.173.116 10.0.0.4 Jumpbox
Elk Configuration
Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because…
It allows us to configure multiple machines by running the ansible playbook rather than configuring multiple machines seperately.
The playbook implements the following tasks:
Install docker.io
Install PIP and docker python module
Downloads and install a docker ELK container, and runs a command to increase memory
The following screenshot displays the result of running docker ps after successfully configuring the ELK instance.
Cyber-Security-Project-1/ Docker ps.png
Target Machines & Beats
This ELK server is configured to monitor the following machines:
DVMT Web-1 10.0.0.7 DVMT Web-2 10.0.0.8
We have installed the following Beats on these machines:
Filebeat and Metricbeat
These Beats allow us to collect the following information from each machine:
File beats track the changes in the files in the locations we specify or the log files, then send the data to elasticsearch. For example, if a file is midified filebeat will track it and send it to elastic serach/logstash. 
Metricbeat collects the metric data from the services and the operating system and sends it to logstash/elasticsearch, for example Apache services. 
Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 
SSH into the control node and follow the steps below:
Copy the filebeat-playbook.yml file and metricbeat-playbook.yml to /etc/ansible.
Update the /etc/ansible/hosts file to include the IP address of the ELK server
Run the playbook, and navigate to http://13.82.52.46:5601/ to check that the installation worked as expected.
Answer the following questions to fill in the blanks:_
_Which file is the playbook? elk-playbook.yml - used to install ELK Server filebeat-playbook.yml - Installs and configures Filebeat on Elk Server and DVWA servers metricbeat-playbook.yml - Installs and configures Metricbeat on Elk Server and DVWA servers
Where do you copy it? /etc/ansible
_Which file do you update to make Ansible run the playbook on a specific machine? /etc/ansible/hosts.cfg
How do I specify which machine to install the ELK server on versus which to install Filebeat on? In /etc/ansible/hosts you tell it where you want eachto be installed ElkServers or FileBeat
_Which URL do you navigate to in order to check that the ELK server is running? http://publicip(elkserver):5601
As a Bonus, provide the specific commands the user will need to run to download the playbook, update the files, etc.
For Filebeats following needs to be added in the playbook
curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.6.2-amd64.deb sudo dpkg -i filebeat-7.6.2-amd64.deb copy filebeat.yml from /etc/ansible/files/filebeat.yml(ansible) to /etc/metricbeat/filebeat.yml(Webserver) filebeat modules enable system filebeat setup service filebeat start
For Metricbeats following needs to be added in the playbook curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.6.2-amd64.deb sudo dpkg -i metricbeat-7.6.2-amd64.deb copy metricbeat.yml from /etc/ansible/files/metricbeat.yml(ansible) to /etc/metricbeat/metricbeat.yml(Webserver) metricbeat modules enable system metricbeat setup service metricbeat start
