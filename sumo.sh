#!/bin/bash
# Branche Nico

####################################################################
#  Nom du Projet : System for Unified Master Operating aka SUMO
#  Description :
#    Script permettant l'automatisation de la gestion de postes 
#    et d'utilisateurs client.
#  Auteurs :
#   - Ahmed Ben Rebai <benrebaiahmed@gmail.com>
#   - Nicolas Claverie <claverie.nicolas.lapo@gmail.com>
#   - Pierre Girard <pierre.girard2788@gmail.com>
#   - Alexandre Peyronie <alexpeyro@gmail.com>
#   - Luca Pouilly <luca.pouilly@hotmail.com>
####################################################################

#######################################
# Connexion ssh simple
# Auteur : pierre 
#   
#######################################

function call_ssh()
{
    ssh -t $user_choice@$computer_choice $3
}
#######################################
# Connexion ssh avec EOF
# Auteur : pierre
#   
#######################################

function call_ssh_EOF()
{
    ssh -t $1@$2
}

#######################################
# Affiche le menu principal.
# Auteur : Nico
#   
#######################################

function menu() {
    echo -e "\e[32m----------------------------------------------------------
Bonjour, bienvenue dans Sumo, comment puis-je vous aider ?
----------------------------------------------------------\e[0m"
    local options=( 
        "Je veux cibler un utilisateur."
        "Je veux cibler un ordinateur."
        "Je veux sortir du script."
        )
    local PS3='Entrez le numéro souhaité: '

    while true; do
        select opt in "${options[@]}"; do 
            case $REPLY in
                1) # Cibler un utilisateur
                    menu:user
                    break
                    ;;
                2) # Cibler un ordinateur
                    menu:computer
                    break
                    ;;
                3) # Sortie du script
                    echo -e "\e[32mSumo vous remercie d'avoir fait appel a ses services.\e[0m"
                    echo " "
                    break 2
                    ;;
                *) # Pour tout les autres choix
                    echo -e "\e[31mCe choix n'est pas disponible, merci de saisir 1, 2 ou 3.\e[0m"
                    break
                    ;;
            esac
        done
    done
} 

#######################################
# Affiche le sous-menu utilisateurs.
# Auteur : Nico
# 
#######################################

function menu:user() {
    echo -e "--------------------------------------------------
\e[32mMenu utilisateur, que souhaitez-vous faire ?
--------------------------------------------------\e[0m"
    local options=(
        "Je veux des information."
        "Je veux effectuer une action."
        "Je veux retourner au menu précédent."
    )
    local PS3='Entrez le numéro souhaité: '

    while true; do
        select opt in "${options[@]}"; do
            case $REPLY in 
                1) #Information utilisateur
                    menu:user:info
                    break
                    ;;
                2) #Action utilisateur
                    menu:user:action
                    break
                    ;;
                3) #Retour menu précédent
                    echo "Back to the futur"
                    echo -e "\e[32m----------------------------------------------------------
Bonjour, bienvenue dans Sumo, comment puis-je vous aider ?
----------------------------------------------------------\e[0m"
                    break 2
                    ;;
                *) # Pour tout les autres choix
                    echo -e "\e[31mCe choix n'est pas disponible, merci de saisir 1, 2 ou 3.\e[0m"
                    break
                    ;;
            esac
        done
    done
}

#####################################################
# Affiche le sous-menu d'info sur les utilisateurs.
# Auteur : Nico
# 
#####################################################

function menu:user:info() {
    echo -e "\e[32m--------------------------------------------------------------
Menu informartion de l'utilisateur, que souhaitez-vous faire ?
--------------------------------------------------------------\e[0m"
    local options=(
        "Date de dernière connexion"
        "Date de la dernière modification du mot de passe"
        "Liste des sessions ouvertes par l'utilisateur"
        "A quelle groupe appartient l'utilisateur"
        "Liste des commandes utiliser par l'utilisateur"
        "Droit et permissions de l'utilisateur sur un dossier"
        "Droit et permissions de l'utilisateur sur un fichier"
        "Recherche des événements dans le fichier log_evt.log pour un utilisateur"
        "Retour au menu précédent"
    )
    local PS3='Entrez le numéro souhaité: '

    while true; do
        select opt in "${options[@]}"; do
            case $REPLY in
                1) #Fonction de la date de derniere connexion
                    echo "TODO ajout de la fonction date de connexion"
                    break
                    ;;
                2) #Fonction de la date de la dernière modification du mot de passe
                    echo "TODO ajout de la fonction de la date de la dernière modification du mot de passe"
                    break
                    ;;
                3) #Fonction de la liste des sessions ouvertes par l'utilisateur
                    echo "TODO ajout de la fonction de la liste des sessions ouvertes par l'utilisateur"
                    break
                    ;;
                4) #Fonction de quelle groupe appartient l'utilisateur
                    echo "TODO ajout de la fonction de quelle groupe appartient l'utilisateur"
                    break
                    ;;
                5) #Fonction de la liste des commandes utiliser par l'utilisateur
                    echo "TODO ajout de la fonction de la liste des commandes utiliser par l'utilisateur"
                    break
                    ;;
                6) #Fonction des droit et permissions de l'utilisateur sur un dossier
                    echo "TODO ajout de la fonction des droit et permissions de l'utilisateur sur un dossier"
                    break
                    ;;
                7) #Fonction des droit et permissions de l'utilisateur sur un fichier
                    echo "TODO ajout de la fonction des droit et permissions de l'utilisateur sur un fichier"
                    break
                    ;;
                8) #Fonction de la recherche des événements dans le fichier log_evt.log
                    echo "TODO ajout de la fonction de la recherche des événements dans le fichier log_evt.log"
                    break
                    ;;
                9) #Retour menu précédent
                    echo "Back to the futur"
                    echo -e "--------------------------------------------------
\e[32mMenu utilisateur, que souhaitez-vous faire ?
--------------------------------------------------\e[0m"
                    break 2
                    ;;
                *) # Pour tout les autres choix
                    echo -e "\e[31mCe choix n'est pas disponible, merci de saisir un chiffre entre 1 et 9.\e[0m"
                    break
                    ;;
            esac
        done
    done
}

#####################################################
# Fonction Date de dernière connexion
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Date de la dernière modification du mot de passe
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Liste des sessions ouvertes par l'utilisateur
# Auteur : 
# 
#####################################################



#####################################################
# Fonction A quelle groupe appartient l'utilisateur
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Liste des commandes utiliser par l'utilisateur
# Auteur : 
# 
#####################################################

function last_cmd() {
    echo "Liste des dernieres commandes passé par l'utilisateur $user_choice" >> $file_log
    call_ssh $user_choice $computer_choice "history" && call_ssh $user_choice $computer_choice "history" >> $file_log
}

#####################################################
# Fonction Droit et permissions de l'utilisateur sur un dossier
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Droit et permissions de l'utilisateur sur un fichier
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Recherche des événements dans le fichier log_evt.log pour un utilisateur
# Auteur : 
# 
#####################################################



#####################################################
# Affiche le sous-menu d'action sur les utilisateurs.
# Auteur : Nico
# 
#####################################################

function menu:user:action() {
    echo -e "\e[32m--------------------------------------------------------
Menu action de l'utilisateur, que souhaitez-vous faire ?
--------------------------------------------------------\e[0m"
    local options=(
        "Changer le mot de passe d'un compte"
        "Suppression d'un compte utilisateur"
        "Désactivation d'un compte utilisateur local"
        "Ajout a un groupe d'administration"
        "Ajout a un groupe local"
        "Sortie d'un groupe local"
        "Retour au menu précédent"
    )
    local PS3='Entrez le numéro souhaité: '

    while true; do
        select opt in "${options[@]}"; do
            case $REPLY in
                1) #Fonction changer le mot de passe d'un compte
                    echo "TODO ajout de la fonction changer le mot de passe d'un compte"
                    break
                    ;;
                2) #Fonction suppression d'un compte utilisateur
                    echo "TODO ajout de la fonction suppression d'un compte utilisateur"
                    break
                    ;;
                3) # Fonction désactivation d'un compte utilisateur local
                    echo "TODO ajout de la fonction désactivation d'un compte utilisateur local"
                    break
                    ;;
                4) # Fonction ajout a un groupe d'administration
                    echo "TODO ajout de la fonction ajout a un groupe d'administration"
                    break
                    ;;
                5) # Fonction ajout a un groupe local
                    echo "TODO ajout de la fonction ajout a un groupe local"
                    break
                    ;;
                6) # Fonction sortie d'un groupe local
                    echo "TODO ajout de la fonction sortie d'un groupe local"
                    break
                    ;;
                7) #Retour menu précédent
                    echo "Back to the futur"
                    echo -e "--------------------------------------------------
\e[32mMenu utilisateur, que souhaitez-vous faire ?
--------------------------------------------------\e[0m"
                    break 2
                    ;;
                *) # Pour tout les autres choix
                    echo -e "\e[31mCe choix n'est pas disponible, merci de saisir un chiffre entre 1 et 7.\e[0m"
                    break
                    ;;
            esac
        done
    done
}

#####################################################
# Fonction Changer le mot de passe d'un compte
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Suppression d'un compte utilisateur
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Désactivation d'un compte utilisateur local
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Ajout a un groupe d'administration
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Ajout a un groupe local
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Sortie d'un groupe local
# Auteur : 
# 
#####################################################



#######################################
# Affiche le sous-menu ordinateur.
# Auteur : Nico
# 
#######################################

function menu:computer() {
    echo -e "\e[32m-------------------------------------------
Menu ordinateur, que souhaitez-vous faire ?
-------------------------------------------\e[0m"
    local options=(
        "Je veux des information."
        "Je veux effectuer une action."
        "Je veux retourner au menu précédent."
    )
    local PS3='Entrez le numéro souhaité: '

    while true; do
        select opt in "${options[@]}"; do
            case $REPLY in
                1) #Information ordinateur
                    menu:computer:info
                    break
                    ;;
                2) #Action ordinateur
                    menu:computer:action
                    break
                    ;;
                3) #Retour menu précédent
                    echo "Back to the futur"
                    echo -e "\e[32m----------------------------------------------------------
Bonjour, bienvenue dans Sumo, comment puis-je vous aider ?
----------------------------------------------------------\e[0m"
                    break 2
                    ;;
                *) # Pour tout les autres choix
                    echo -e "\e[31mCe choix n'est pas disponible, merci de saisir 1, 2 ou 3.\e[0m"
                    break
                    ;;
            esac
        done
    done
}

#####################################################
# Affiche le sous-menu d'info sur les ordinateurs.
# Auteur : Nico
# 
#####################################################

function menu:computer:info() {
    echo -e "\e[32m------------------------------------------------------------
Menu information de l'ordinateur, que souhaitez-vous faire ?
------------------------------------------------------------\e[0m"
    local options=(
        "Version de l'OS"
        "Nombre de disque"
        "Partition(nombres,nom,FS,taille)"
        "Espace disque restant sur par partitions"
        "Nom et espace disque d'un dossier(nom de dossier demandé)"
        "Liste des lecteurs monté (disque,CD,etc...)"
        "Liste des applications/paquets installées"
        "Liste des services en cours d'execution"
        "Liste des utilisateurs locaux"
        "Memoire RAM total"
        "Utilisation de la RAM"
        "Recherche des événements dans le fichier log_evt.log pour la machine"
        "Retour au menu précédent"
    )
    local PS3='Entrez le numéro souhaité: '

    while true; do
        select opt in "${options[@]}"; do
            case $REPLY in
                1) #Fonction version de l'OS
                    osVer
                    break
                    ;;
                2) #Fonction nombre de disque
                    nbDsk
                    break
                    ;;
                3) #Fonction partition
                    echo "TODO ajout de la fonction partition"
                    break
                    ;;
                4) #Fonction espace disque restant par partitions
                    echo "TODO ajout de la fonction espace disque restant par partitions"
                    break
                    ;;
                5) #Fonction nom et espace disque d'un dossier
                    echo "TODO ajout de la fonction nom et espace disque d'un dossier"
                    break
                    ;;
                6) #Fonction liste des lecteurs monté
                    echo "TODO ajout de la fonction liste des lecteurs monté"
                    break
                    ;;
                7) #Fonction liste des applications/paquets installées
                    echo "TODO ajout de la fonction liste des applications/paquets installées"
                    break
                    ;;
                8) #Fonction liste des services en cours d'execution
                    echo "TODO ajout de la fonction liste des services en cours d'execution"
                    break
                    ;;
                9) #Fonction liste des utilisateurs locaux
                    echo "TODO ajout de la fonction liste des utilisateurs locaux"
                    break
                    ;;
                10) #Fonction memoire RAM total
                    echo "TODO ajout de la fonction memoire RAM total"
                    break
                    ;;
                11) #Fonction utilisation de la RAM
                    echo "TODO ajout de la fonction utilisation de la RAM"
                    break
                    ;;
                12) #Fonction recherche des événements dans le fichier log_evt.log
                    echo "TODO ajout de la fonction recherche des événements dans le fichier log_evt.log"
                    break
                    ;;
                13) #Retour menu précédent
                    echo "Back to the futur"
                    echo -e "\e[32m-------------------------------------------
Menu ordinateur, que souhaitez-vous faire ?
-------------------------------------------\e[0m"
                    break 2
                    ;;
                *) # Pour tout les autres choix
                    echo -e "\e[31mCe choix n'est pas disponible, merci de saisir un nombre entre 1 et 13.\e[0m"
                    break;;
            esac
        done
    done
}


#####################################################
# Fonction Version de l'OS
# Auteur : Nico
# 
#####################################################

function osVer() {
    echo "Version de l'OS:" >> $file_log
    call_ssh $user_choice $computer_choice "lsb_release -a" && call_ssh $user_choice $computer_choice "lsb_release -a" >> $file_log
}

#####################################################
# Fonction Nombre de disque
# Auteur : Nico
# 
#####################################################

function nbDsk() {
    echo "Nombre de disque:" >> $file_log
    call_ssh $user_choice $computer_choice "lsblk | grep disk | wc -l" && call_ssh $user_choice $computer_choice "lsblk | grep disk | wc -l" >> $file_log

}

#####################################################
# Fonction Partition(nombres,nom,FS,taille)
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Espace disque restant sur par partitions
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Nom et espace disque d'un dossier(nom de dossier demandé)
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Liste des lecteurs monté (disque,CD,etc...)
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Liste des applications/paquets installées
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Liste des services en cours d'execution
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Liste des utilisateurs locaux
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Memoire RAM total
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Utilisation de la RAM
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Recherche des événements dans le fichier log_evt.log pour la machine
# Auteur : 
# 
#####################################################



#####################################################
# Affiche le sous-menu d'action sur les ordinateurs.
# Auteur : Nico
# 
#####################################################

function menu:computer:action() {
    echo -e "\e[32m-------------------------------------------------------
Menu action de l'ordinateur, que souhaitez-vous faire ?
-------------------------------------------------------\e[0m"
    local options=(
        "Création d'un compte local"
        "Arrêt"
        "Redémarrage"
        "Verrouillage"
        "Mise a jour du système"
        "Creation de repertoire"
        "Modification de repertoire"
        "Suppression d'un repertoire"
        "Prise de main a distance"
        "Activation du par-feu"
        "Désactivation du par-feu"
        "Installation de logiciel"
        "Désinstallation de logiciel"
        "Execution de script sur la machine distante"
        "Retour au menu précédent"
    )
    local PS3='Entrez le numéro souhaité: '

    while true; do
        select opt in "${options[@]}"; do
            case $REPLY in
                1) #Fonction Création d'un compte local
                    echo "TODO ajout de la fonction Création d'un compte local"
                    break
                    ;;
                2) #Fonction Arrêt
                    echo "TODO ajout de la fonction Arrêt"
                    break
                    ;;
                3) #Fonction Redémarrage
                    echo "TODO ajout de la fonction Redémarrage"
                    break
                    ;;
                4) #Fonction Verrouillage
                    echo "TODO ajout de la fonction Verrouillage"
                    break
                    ;;
                5) #Fonction Mise a jour du système
                    update_system
                    break
                    ;;
                6) #Fonction Creation de repertoire
                    echo "TODO ajout de la fonction Creation de repertoire"
                    break
                    ;;
                7) #Fonction Modification de repertoire
                    echo "TODO ajout de la fonction Modification de repertoire"
                    break
                    ;;
                8) #Fonction Suppression d'un repertoire
                    echo "TODO ajout de la fonction Suppression d'un repertoire"
                    break
                    ;;
                9) #Fonction Prise de main a distance
                    echo "TODO ajout de la fonction Prise de main a distance"
                    break
                    ;;
                10) #Fonction Activation du par-feu
                    fw_ena
                    break
                    ;;
                11) #Fonction Désactivation du par-feu
                    fw_disa
                    break
                    ;;
                12) #Fonction Installation de logiciel
                    echo "TODO ajout de la fonction Installation de logiciel"
                    break
                    ;;
                13) #Fonction Désinstallation de logiciel
                    echo "TODO ajout de la fonction Désinstallation de logiciel"
                    break
                    ;;
                14) #Fonction Execution de script sur la machine distante
                    echo "TODO ajout de la fonction Execution de script sur la machine distante"
                    break
                    ;;
                15) #Retour menu précédent
                    echo "Back to the futur"
                    echo -e "\e[32m-------------------------------------------
Menu ordinateur, que souhaitez-vous faire ?
-------------------------------------------\e[0m"
                    break 2
                    ;;
                *) # Pour tout les autres choix
                    echo -e "\e[31mCe choix n'est pas disponible, merci de saisir un nombre entre 1 et 15.\e[0m"
                    break
                    ;;
            esac
        done
    done
}

#####################################################
# Fonction Création d'un compte local
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Arrêt
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Redémarrage
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Verrouillage
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Mise a jour du système
# Auteur : pierre 
# 
#####################################################
function update_system()
{
    call_ssh $user_choice $computer_choice "sudo apt update && sudo apt upgrade"
}

#####################################################
# Fonction Creation de repertoire
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Modification de repertoire
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Suppression d'un repertoire
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Prise de main a distance
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Activation du par-feu
# Auteur : Nico
# 
#####################################################

function fw_ena() {
    call_ssh $user_choice $computer_choice "sudo ufw enable"
} 

#####################################################
# Fonction Désactivation du par-feu
# Auteur : Nico
# 
#####################################################

function fw_disa() {
    call_ssh $user_choice $computer_choice "sudo ufw disable"
}

#####################################################
# Fonction Installation de logiciel
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Désinstallation de logiciel
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Execution de script sur la machine distante
# Auteur : 
# 
#####################################################

#demande la cible
read -p "quelle ordinateur voulez vous cibler? " computer_choice
read -p "quelle utilisateur voulez vous cibler? " user_choice

# Variable nom de fichier pour log d'information
file_log=$HOME/Documents/"Info-$computer_choice-$(date +'%Y%m%d').txt"

#Lancement de la fonction menu pour initialiser le Script Sumo
menu 