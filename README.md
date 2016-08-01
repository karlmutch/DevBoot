Developer Bootstrapping Project
===============================


This project was motivated by the need to create a personal development environment that has a custom disk layout using a seperate /home partition and a large set of default tools useful for development that are selected based on personal preference.  The projects goal is to provide a developer environment that can be spun up completely, or at least largely automated and in a reproducable manner.

This project contains several files to enable development environments to be spun up using a combination of Packer, VirtualBox, Vagrant, and Ansible.

This project requires serveral Vagrant plugins installed which will be done when using the install.bat file

The project was begun labour day weekend 2015

Dependencies
------------

The Vagrant files used within this provisioning setup require the use of some vagrant plugs namely:

vagrant plugin install vagrant-hosts

Usage
-----

The main deployment process is done by creating a Base Box running the BaseBox/build.bat file.  The output from this step is then copied by the Dev/build.bat file into a local input directory within the Dev project.

cd BaseBox

./install.bat   -- First time only
./build.bat 

or

./install.sh    -- First time only
./build.sh

The second step will read the output from the first step and use it to generate a fully configured Linux Development box file

cd ../Dev
./build.sh    -- Windows and OSX

Once the main 2 steps have been completed the resulting Dev machine can be initialized by navigating into the Dev/Build directory where the Dev.box file can be found.  The virtual box dev appliance can be added to your Vagrant installation by using the command:

vagrant box add build/Dev.box --name Dev

You might find that the output directory for the vagrant box add is not the default folder for the VirtualBox administration UI.  Look in your login directory for the .vagrant.d/boxes/Dev/0/virtualbox directory.  The files in this directory constitute your virtual machine that can be imported by the VirtualBox administration UI.

Having imported the virtual machine into VirtualBox you will need to attach the network interface to the VM that will be used for connecting from your localhost to your development environment.  use the Host only interface that is created by using the install.sh file in the BaseBox directory.  You can also reuse an existing interface that is a HostOnly interface allowing SSH access from your workstation to the Linux VM.

To use the attached network interface start your virtual machine and use the console to login to it using the console as the vagrant user with a password of vagrant.  Then use sudo vi /etc/network/interfaces to add the new eth1 interface using the same entries as the eth0 interface, that is using DHCP.  You can also add your own explict IP address using instructions found at, https://help.ubuntu.com/community/NetworkConfigurationCommandLine/Automatic#Finding_your_network_interface.

Then logout and restart the VM and use SSH to login. SSH will use the user name of your local machines account to login to linux machine and will use your public key to access the development VM.


If you wish to add postgres to the installation navigate to the Dev/ansible directory and run the command 'ansible-playbook runtime.yml -i ./Dev.inventory'.
