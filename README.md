# Ansible-Mediawiki

Vérifier que Python est installé :
    python3

Installer Ansible sur la machine dédiée :
    pip install ansible

    en principe (ansible) s'écrit avant le prompt

vérifier la version d'Ansible :
    ansible --version

Modifier le fichier /etc/hosts
    127.0.0.1 node-manager
    # le node http1
    192.168.122.11 http1
    # le node bdd1
    192.168.122.12 bdd1

Modifier l'inventaire.ini

Se connecter en ssh sur chaque machine 
    ssh sebastien@http1
    ssh sebastien@bdd1

Vérification de la connexion :
    ansible -i inventaire.ini -m ping http1 --user sebastien
    ansible -i inventaire.ini -m ping bdd1 --user sebastien

    doit répondre pong

Vérifier que python est installé sur les nodes :
    ansible -i inventaire.ini -m raw -a "sudo apt install -y python3" http1 --user sebastien
    ansible -i inventaire.ini -m raw -a "sudo apt install -y python3" bdd1 --user sebastien

Pour ajouter un utilisateur
ansible -i inventaire.ini -m user -a 'name=user-ansible
password=$6$secretsalt$X5YDmUgDphPxnMkByvHbNaiP4T5Uk0WjEZ9TukWKQnXmXN81jG3DcGZnNJiSz9ltgPhplH92HOR/RqgmyS.zN1' --user root --ask-pass all
ansible -i inventaire.ini -m user -a 'name=user-ansible groups=sudo append=yes ' --user root --ask-pass all

Vérification si l'utilisateur a les droits sudo
ansible -i inventaire.ini -m user -a 'name=user-ansible groups=sudo append=yes ' --user user-ansible --ask-pass --become --ask-become-pass all

ansible -i inventaire.ini -m authorized_key -a 'user=user-ansible state=present key="{{
lookup("file", "/home/user-ansible/.ssh/id_ecdsa.pub") }}"' --user user-ansible --ask-pass --become --ask-become-pass all
