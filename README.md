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

The main deployment process is done by creating a Base Box using the BaseBox/build.bat file.  The output from this step is then copied by the Dev/build.bat file into a local input directory within the Dev project.

Once the main 2 steps have been completed the resulting Dev machine can be initialized by navigating into the Dev/Build directory where the Dev.box file can be found.  The virtual box dev appliance can be added to your Vagrant installation by using the command 'vagrant box add Dev.box --name Dev', a Vagrant file is then needed and can be generated using the 'vagrant init Dev' command.  To run the new machine use the 'vagrant up' command and you will be able to login into the new machine using SSH to complete your setup.

If you wish to add postgres to the installation navigate to the Dev/ansible directory and run the command 'ansible-playbook runtime.yml -i ./Dev.inventory'.
