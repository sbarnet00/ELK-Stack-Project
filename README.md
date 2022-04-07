# ELK-Stack

## Automated ELK Stack Deployment

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


The files below have been tested and used to generate a live ELK deployment on Azure cloud servers. They can be used to either recreate the entire deployment pictured in the next section. Portions of these playbooks can also be used to deploy individual items, such as Filebeat.

[Docker Install](Ansible/pentest.yml)

[Hosts](Ansible/hosts)

[Elk Install](Ansible/install-EKL.yml)

[Filebeat Install](Ansible/filebeat-playbook.yml)

[Filebeat Config](Ansible/filebeat-config.yml)

[Metricbeat Install](Ansible/metricbeat-playbook.yml)

[Metricbeat Config](Ansible/metricbeat-config.yml)


### Description of the Topology

The files noted above were used to configure the network depicted below.

![Elk Stack Network Diagram](Diagrams/ELK-Stack-Net-Diagam.drawio.png)

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancer advantages:

 -ensures that the web application will be highly available by delegating traffic to available servers and avoid         overloading and prevent DDOS attacks 
 
 -restricts access to the rest of the internal network
 
 -control security for multiple servers in an umbrella instead of per server, fully configurable
 
 -logs/documents traffic with the ability to deny access(IDS/IPS function)
 
 -increased fault tolerance and redundancy


The jump box acts as a gateway to the backend of the servers, via secured public access, to remotely manage, create/scale, udpate, modify servers, in addition to deploying new containers/software as desired.

Integrating an ELK server allows administrators/SOCs to easily monitor the vulnerable VMs for the desired metrics - in this case log file activity, priviledge escalation via Filebeat and system health/resource usage/running services via Metricbeat

The configuration details of each machine may be found below.

| Name        | Function      | IP Address               | Operating System |
|-------------|---------------|--------------------------|------------------|
| Jump Box    | Gateway       | 10.0.0.4, 20.213.88.91   | Linux            |
| Web-1       | Server        | 10.0.0.5                 | Linux            |
| Web-2       | Server        | 10.0.0.6                 | Linux            |
| ELW         | Server        | 10.1.0.4, 20.203.153.131 | Linux            |
| Red-Team-LB | Load Balancer | 20.213.78.90             | N/A              |

### Access Policies
 

Only the load balancer machine can accept connections from the Internet. Access to this machine is currently only allowed from the following IP addresses:37.19.213.123:80 (my computer's public IP address). The machines on the internal network are not exposed to the public Internet.

Machines within the network can only be accessed via the jump box. The ELK vm accessible from the jump box(10.0.0.4:22) or Public Internet, to which access is restricted to only my public IP address 37.19.213.123:22.

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses            |
|----------|---------------------|---------------------------------|
| Jump Box | Yes, but restricted | 37.19.213.123:22                |
| Web-1    | No                  | 10.0.0.4:22                     |
| Web-2    | No                  | 10.0.0.4:22                     |
| ELK      | Yes, but restricted | 10.0.0.4:22, 37.19.213.123:5601 |
| L-Bal    | Yes                 | 37.19.213.123:80                |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because we can configure/deploy software/update multiple machines with one automated playbook

The playbook implements the following tasks:
- download software
- install software
- configure software
- configure virtual memory limits
- launch the newly downloaded software/start service
- configure the software to launch on boot/enable service at boot

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![Docker-PS](Diagrams/RunningElkContainer.PNG)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- 10.0.0.5
- 10.0.0.6

We have installed the following FileBeats and Metricbeats on these machines which allosw us to collect the following information from each machine:
- filebeats tracks log file changes/events (ie: new users added, login attempts, file system changes)
- metricbeats monitors system parameters/health/load/resource usage  (ie: cpu stats, RAM usage, disk and network IO, available resources which could indicate a possible attack if values are beyond the acceptible range)

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the YAML playbook file to /etc/Ansible and specify group of target machines as defined in the hosts file
- Update the hosts file to include the target machines if not already listed
- Run the playbook, and navigate to http://ELKip:5601/app/kibana (in my case http://20.203.153.131:5601/app/kibana) to check that the installation worked as expected.

![Filebeat Successful](/Ansible/filebeatsuccess.png)

![Metricbeat Successful](/Ansible/metricbeatsuccess.png)


Commands used to run the Ansible configuration:

-access the Jumpbox with $ ssh redadmin@20.213.88.91

-list containers if Ansible container name unknown with $ sudo docker list -a

-start ansible container with $ sudo docker start 'name of container' (in this case jolly_joliot)

-enter container with $ sudo docker attach 'name of container' (in this case jolly_joliot)

- go to the ansible playbook directory with $ cd /etc/ansible

-launch playbook with $ ansible-playbook *.yml (*= name of playbook)

-confirm error free deployment, or troubleshoot as necessary
