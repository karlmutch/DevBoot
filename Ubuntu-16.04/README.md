For installation instructions related to ansible please use the information 
found at http://docs.ansible.com/ansible/intro_installation.html#getting-ansible

When using the tasks present within this repository a user account will be created
using the user ID of the account you start the ansible playbook from automatically.
This means you should use the account that the cloud provider offers by default 
and not choose the name of final user account when creating the base machine on 
AWS, DigitalOcean or other infrastructure.

When using this ansible playbook first modify the inventory file to contain 
information concerning your target Linux system.

Your inventory should contain an entry such as:

karlmutch.com ansible_connection=ssh        ansible_user=ubuntu

Now copy the id_rsa.pub file from the machine on which the ansible playbook will be initiated 
to your new Linux system. Specifically you need to append your public key to the 
the authorized_keys file in the .ssh directory of the target system.

Logout of the target linux system and test that it can be accessed using ssh from the
machine driving the upgrade using just the keys.

Your ansible_user must also be able to sudo without needing a password. If this is not the
case read the instructions at http://sleepyhead.de/howto/?href=sudo for more information
how to remove the need for the ansible_user to enter their password.

These ansible files are able to setup a mail relay that uses your google gmail account.

The gmail details must be configured as host variables as documented 
here, http://docs.ansible.com/ansible/intro_inventory.html#host-variables.
A short hand option is to add these to the inventory file, for example:

karlmutch.com ansible_connection=ssh        ansible_user=ubuntu gmail_user=example@gmail.com gmail_app_password=abcdefghijkl

The two variables needed are, gmail_user and gmail_app_password. If these are not present your 
postfix server will not forward system reports to your gmail account.  Generating an application
password can be done after logging into your GMail account then visiting the page at,
https://security.google.com/settings/security/apppasswords to create a new application password.
You must generate one password for each application you will be used with your GMail account, do
not share these passwords between accounts or with other people.

After setting the inventory file and any variables up, use the ansible command to run it as follows:

ansible-playbook -i ./inventory playbook.yml
