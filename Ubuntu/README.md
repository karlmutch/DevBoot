For installation instructions related to ansible please use the information 
found at https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible-on-ubuntu.
The main prerequisite for ansible is that python be installed on the Linux systems.

When using the tasks present within this repository a user account will be created
using the user ID of the account you start the ansible playbook from automatically.
This means you should use the account that the cloud provider offers by default 
and not choose the name of final user account when creating the base machine on 
AWS, DigitalOcean or other infrastructure.

Github tokens
---
In addition to setting up the user account github access can also be enabled
for the machine and user account if the GITHUB_TOKEN environment variable is set
on the controlling host shell.  If you do use GITHUB_TOKEN be sure that on the
scopes for that token on github the admin:public_key rights are set.  This is
the only right needed and so you can generate a one time key with nothing else
set use for provisioning and then delete it after installation is complete.

When setting up github the new user account will be granted access using its own
id_ed25519 ssh public key.  The key will be added to the account of the original user
with a title something like "Access Key for MyTest 174.16.7.4 ff:df:8c:82:a0:34".

A caveat is that the token used to generate the key and your actual SSH key are 
both linked within Github.  Deleting the TOKEN will kill the SSH keys and revoke access
to the machine and user account created by DevBoot.

Regenerating the same token will retain access and remove the ability of an evesdropper 
to keep creating new SSH keys after you have completed your deployment.

Ansible Inventory setup
---

When using this ansible playbook first modify the inventory file to contain
information concerning your target Linux system. The Linux target system
should be an Ubuntu Server Edition installation 64bit.

Your inventory should contain an entry such as:

```karlmutch.com ansible_connection=ssh        ansible_user=ubuntu```

Bare metal and non cloud deployments
---

Now copy the id_ed25519.pub file from the machine on which the ansible playbook will be played
on your new Linux system. Specifically you need to append your public key to the 
the authorized_keys file in the .ssh directory of the target system.

Logout of the target linux system and test that it can be accessed using ssh from the
machine driving the upgrade using just the keys.

Your ansible_user must also be able to sudo without needing a password. If this is not the
case read the instructions at https://askubuntu.com/questions/192050/how-to-run-sudo-command-with-no-password
for more information on how to remove the need for the ansible_user to enter their password.

Mail relays
---

These ansible files are able to setup a mail relay that uses your google gmail account.

The gmail details must be configured as host variables as documented 
here, http://docs.ansible.com/ansible/intro_inventory.html#host-variables.
A short hand option is to add these to the inventory file, for example:

```karlmutch.com ansible_connection=ssh        ansible_user=ubuntu gmail_user=example@gmail.com gmail_app_password=abcdefghijkl```

The two variables needed are, gmail_user and gmail_app_password. If these are not present your 
postfix server will not forward system reports to your gmail account.  Generating an application
password can be done after logging into your GMail account then visiting the page at,
https://security.google.com/settings/security/apppasswords to create a new application password.
You must generate one password for each application you will be used with your GMail account, do
not share these passwords between accounts or with other people.

Usage
---

After setting the inventory file and any variables up, use the ansible command to run it as follows:

```ansible-playbook -i ./inventory playbook.yml```

If you wish to update the localhost on which your development is being done you can use a 
command such as the following to update an existing machine with an existing developer
account.

```ansible-playbook -i "localhost," --become-user=kmutch -u kmutch -c local limited.yml -u kmutch ```
