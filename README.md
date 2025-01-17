# ansible-playground
## ansible-playground for learning ansible
This is build taking inspiration from -
https://medium.com/@dcarrascal75/a-simple-ansible-playground-using-docker-eeb458cbba32 

excellent article to build a playground to start your ansible learning. The
rest of the things are build from mastering ansible ubuntu video tutorial.

## build podman images
The podman image is called fedora-ssh.
build it via 
```
git pull https://github.com/saneax/ansible-playground.git
cd ansible-playground
podman build -t fedora-ssh .
```

## run podman-compose
install podman-compose via pip or dnf first.
then run the compose 
```
podman-compose up -d'
cd ansible 
ssh -i ./id_rsa -p 2224 root@localhost
```

## Check IP address from the running podman and populate ssh.config file
`podman ps --format "{{.ID}}" | xargs -I {} podman exec -it {} ifconfig`


## install ansible
if the above works, everything is good.
now, install ansible.. (I am using pythonwrapper)
mkvirtualenv ansible
pip install ansible
check ansible - 'ansible all -m ping'
if all are success, you have a playground ready for ansible.
