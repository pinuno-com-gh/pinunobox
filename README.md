# Pinuno LAMP development box
This is Vagrant box build process for Ubuntu 16, MySQL 5, Apache 2, PHP 5.6 and GIT. 
It is used to provide a quick startup for development

>*pinunobox*

IP:192.168.33.20
DB User: root
DB Pass: pinuno


DOC_root: /html


##Usage
* **git clone** to project workspace
* **cd** into the workspace
* **vagrant up** command to start the provisioning process
* **vagrant ssh** command to enter the command prompt of **pinunobox**

##After provisioning
Files placed in the **html** folder will be browser accessible


## Known issues
After provisioning the apache2 services gives a warning about not setting the qualified name.
[Follow the link](https://askubuntu.com/questions/256013/apache-error-could-not-reliably-determine-the-servers-fully-qualified-domain-n) to learn how to fix it.