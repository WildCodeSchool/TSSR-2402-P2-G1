#!/bin/bash
# test branche
# 1er menu

# 1-choix de cibler un utilisateur avec son nom complet ou partiel 
#                              ou
# 2-choix de cibler un ordinateur avec nom complet ou adresse IP

# demander validation

#_______________________________________________________________

# si on vise un utilisateur

# choix action ou information sur un utilisateur
# si choix action :

# choix pour agir sur un utilisateur :

# 1-creation d'un compte local
sudo useradd $user &>/dev/null
# 2-changer le mot de passe d'un compte
sudo passwd $user &>/dev/null
# 3-supression d'un compte utilisateur
sudo userdel $user &>/dev/null
# 4-desactivation d'un compte utilisateur local
sudo usermod --expiredate 1 $user &>/dev/null
# 5-ajout a un groupe d'administration
sudo usermod -aG sudo $user &>/dev/null
# 6-ajout a un groupe local
read -p "à quel groupe faut il ajouter $user" grp_add
sudo usermod -aG "$grp_choice" &>/dev/null
# 7-sortie d'un groupe local
read -p "de quel groupe faaut il retirer $user" grp_del
sudo userdel -G $grp_del $user &>/dev/null
#_______________________________________________________________

# choix pour obtenir information sur un utilisateur :

# 1-date de derniere connexion d'un utilisateur
lastlog -u $user
# 2-date de la derniere modification du mot de passe
sudo chage -l $user | grep "Last password change"
# 3-liste des sessions ouvertes par l'utilisateur
grep "session opened" /var/log/auth.log | grep "$user"
# 4-a quelle groupe apartient l'utilisateur
cat /etc/group | grep "$user"
# 5-liste des commandes utiliser par l'utilisateur
cat /home/$user/.bash_history
# 6-droit et permissions de l'utilisateur sur un dossier 
read -p "ajouter le chemin d'accès du dossier dont consulter les droits" doss_road
ls -l $doss_road
# 7-droit et permissions de l'utilisateur sur un fichier
read -p "ajouter le chemin d'accès du fichier dont consulter les droits" file_road
ls -l $file_road
# 8-recherche des evenements dans le fichier log_evt.log pour un utilisateur
grep $user /var/log/syslog
#_______________________________________________________________

# si une information est demander on l'affiche et on l'enrengistre
# si plusieurs info sont demander on affiche rien mais on l'enrengistre

#_______________________________________________________________

# si on vise un ordinateur :

# choix action ou information sur une machine
# choix pour agir :

# 1-arret
sudo shutdown -h now
# 2-redemarage
sudo shutdown -r now
# 3-Verouilage
sudo systemctl suspend
# 4-Mise a jour du systeme
sudo apt update && sudo apt upgrade
# 5-creation de repertoire
read -p "indiquer un nom de répertoire" rep_name
mkdir $rep_name
# 6-modification de repertoire
read -p "indiquer chemin a suivre" rep_travel
cd $rep_travel
# 7-supression d'un repertoire
read -p "inddiquer un répertoire à supprimer" rep_del
rm -r $rep_del
# 8-prise de main a distance
read -p "indiquer l'adresse ip de la cible" ip_cible
ssh $user@$ip_cible
# 9-activation du par-feu
sudo ufw enable
# 10-desactivation du par-feu
sudo ufw disable
# 11-instalation de logiciel
read -p "indiquer le nom du logiciel à installer" add_logiciel
sudo apt install $add_logiciel
# 12-desinstalation de logiciel
read -p "indiquer le nom du logiciel à désinstaller" del_logiciel
sudo apt remove $del_logiciel
# 13-Execution de script sur la machine distante
ssh $user@$ip_cible'bash -s' < sumo.sh

#_______________________________________________________________

# choix information sur la machine

# 1-version de l'OS
lsb_release -a
# 2-Nombre de disque
lsblk | grep disk | wc -l
# 3-partition(nombres,nom,FS,taille)
lsblk
# 4-Espace disque restant sur par partitions
df -h
# 5-nom et espace disque d'un dossier(nom de dossier demandé)
read -p "indiquer nom du dossier à consulter" doss_space
du -sh $doss_space
# 6-liste des lecteurs monté (disque,CD,etc...)
mount | grep "^/dev"
# 7-liste des apllications/paquets installées
dpkg -l
# 8-liste des services en cours d'execution
systemctl list-units --type=service
# 9-liste des utilisateurs locaux
cut -d: -f1 /etc/passwd
# 10-memoire RAM total
free -h | grep "Mem:" | awk '{print $2}'
# 11-Utilisation de la RAM
free -h | grep "Mem:" | awk '{print $3}'
# 12-recherche des evenements dans le fichier log_evt.log pour la machine
grep "machine" /var/log/syslog
#_______________________________________________________________

# si une information est demander on l'affiche et on l'enrengistre
# si plusieurs info sont demander on affiche rien mais on l'enrengistre