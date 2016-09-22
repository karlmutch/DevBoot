For installation instructions related to ansible please use the information 
found at http://docs.ansible.com/ansible/intro_installation.html#getting-ansible

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

After setting the inventory file up use the ansible command to run it as follows:

ansible-playbook -i ./inventory playbook.yml
