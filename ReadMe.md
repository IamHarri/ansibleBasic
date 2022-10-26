
# ANSIBLE
## client machine
-   create user with command: adduser ansadmin
-   visudo: ansadmin ALL=(ALL) NOPASSWD= ALL
-   config ssh as password for this machine
## host machine (host ansible)
-   the same as client ( create user ansadmin)
-   add client Ip inside this path: /etc/ansible/hosts ( this file will store all client ip)
-   copy master ssh key to client server for authentication
-   Run this commnand `ssh-copy-id {client IP} inside the user home directory ( run ssh-keygen before it)
-   after this key will be placed in the client machine
-   Run: `ansible all -m ping` to test the connection
```sh
ansible <hosts> -a <command>
ansible all -a "/sbin/reboot"
ansible <hosts> -m <module>
ansible target1 -m ping
-------------------------
parameters link: https://docs.ansible.com/ansible/2.3/intro_inventory.html
# Ansible playbook


```
# answer the problem why we need ansible
```text
Reason: 
-   config hundred of servers, migrate, system reboot ....
-   script: require coding skills, maintence these script, put these single script to the server
-   replace script --> ansible playbook
_USECASE
power off the database first --> power off backend server --> front end ....
```
# Set up ansible
```text 
if  you don't define any inventory file --> by default /etc/ansible/hosts
config option:[ansible-parameters][https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html] 
ansible_conenction=ssh (linux) or winrm (win server)
first started should be use: ansible_port, ansible_password


```
# Ansible inventory
```text

target1 ansible_host=192.168.56.101 ansible_user=harry ansible_ssh_pass=0000
target2 ansible_host=192.168.1.32 ansible_user=harry ansible_ssh_pass=0000
Note: ansible is not understanding number password (if use number should be --ask-password)
```
```text
ansible runbook is all task run in sequence
list of dictionary
```
## Syntax
```yaml
host: "define the group name in inventory or global( etc/ansible/hosts)"
```
## Module
```text
different action run by task ( command, script, yum, service)
```
# Ansible playbook
```test
- in the begining is showing that it is started at the first place 
```
# Module
```text
syytem : system level ( user, service ...)
commands: execution ( shell, script,)
file: (9 arhive , copy, find...)
database: ( posgresql, mysql)
cloud: aws, azure, atomic, docker, google
Note: service
state=stated why? not start
-   if httpd is not already started --> start it
if httpd is already started , --> do  nothing

```
# Role
```text
reuse the task
can be share with other user (call as galaxy)
run this command to init a built-in role: ansible-galaxy init {role_name ex: msql}
```
# statergy
```text
default: linear
    move together all task
free: no waiting
serial: a serial  of agent will be run as a time
```
# security
-   ansible-vault encrypt {{filename}}
-   run ansible-playbook with this option --ask-vault-pass
-   also --vault-password-file ~./vault_pass.txt

NOTE: command: ansible-playbook playbook-docker.yml -i inventory.ini --vault-password-file ~/vaultpass.txt