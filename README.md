Development Environments Project
================================


This project was motivated by the need to repeatedly create and deploy personal development systems using Linux.

To use tooling within this project a copy of Ansible must be installed, the target systems will need python
installed along with remote SSH access enabled.

The project contains ansible definitions for provisioning and deploying working development systems.
The first set of development systems used were based upon having locally deployed development systems on 
Laptops and workstations.  The second deployment strategy shifted to being deployed and hosted within 
both AWS and DigitalOcean.  This project allows both approaches.

The deployments are supported for Ubuntu 14.04, 16.04, and 18.04 in the Ubuntu directory.  Ansible will
be used to detect the OS version and this will be used when specific versions of packages are
needed.

The motivation behind the move to using DigitalOcean and cloud in general has been the introduction of
two-factor authentication and rock bottom costs for using cloud based offerings.  My development tends
to be using tools such as GoLang, and vim-go opting for minimalist approachs to creating software solutions.
The Ubuntu 16.04 machines I use require less than 1Gb of memory, 1 core, and 25GB of disk for the base OS.
The cost for this system is about $6.00 a month hosted by DigitalOcean.  Increasing capacity to 2GB of 
memory and 50 GB disk system is still only $11.00 a month, all prices including taxes.

The project was begun labour day weekend 2015.
