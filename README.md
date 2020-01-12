# ansible-playground
ansible-playground for learning ansible

This is build taking inspiration from -
https://medium.com/@dcarrascal75/a-simple-ansible-playground-using-docker-eeb458cbba32 

excellent article to build a playground to start your ansible learning. The
rest of the things are build from mastering ansible ubuntu video tutorial.

The docker image is called ubunti-ssh.
build it via 'docker build -t ubuntu-ssh .'
then run the compose 'docker-compose run -d'
now check the environment via ssh -i ./id_rsa root@localhost 2224
if the above works, everything is good.
now, install ansible.. (I am using pythonwrapper)
mkvirtualenv ansible
pip install ansible
check ansible - 'ansible all -m ping'
if all are success, you have a playground ready for ansible.
