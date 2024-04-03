#!/bin/bash



function menu() {
    echo -e "\e[32mBonjour, bienvenue dans Sumo, comment puis-je vous aider ?\e[0m"
    echo " "
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
                    echo "Ce choix n'est pas disponible, merci de saisir 1, 2 ou 3."
                    break
                    ;;
            esac
        done
    done
} 

function menu:user() {
    echo -e "\e[32mMenu utilisateur, que souhaitez-vous faire ?\e[0m"
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
                    echo -e "\e[32mBonjour, bienvenue dans Sumo, comment puis-je vous aider ?\e[0m"
                    break 2
                    ;;
                *) # Pour tout les autres choix
                    echo "Ce choix n'est pas disponible, merci de saisir 1, 2 ou 3."
                    break
                    ;;
            esac
        done
    done
}

function menu:user:info() {
    echo -e "\e[32mMenu informartion de l'utilisateur, que souhaitez-vous faire ?\e[0m"
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
                    echo -e "\e[32mMenu utilisateur, que souhaitez-vous faire ?\e[0m"
                    break 2
                    ;;
                *) # Pour tout les autres choix
                    echo "Ce choix n'est pas disponible, merci de saisir un chiffre entre 1 et 9."
                    break
                    ;;
            esac
        done
    done
}

function menu:user:action() {
    echo -e "\e[32mMenu action de l'utilisateur, que souhaitez-vous faire ?\e[0m"
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
                    echo -e "\e[32mMenu utilisateur, que souhaitez-vous faire ?\e[0m"
                    break 2
                    ;;
                *) # Pour tout les autres choix
                    echo "Ce choix n'est pas disponible, merci de saisir un chiffre entre 1 et 7."
                    break
                    ;;
            esac
        done
    done
}

function menu:computer() {
    echo -e "\e[32mMenu ordinateur, que souhaitez-vous faire ?\e[0m"
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
                    echo -e "\e[32mBonjour, bienvenue dans Sumo, comment puis-je vous aider ?\e[0m"
                    break 2
                    ;;
                *) # Pour tout les autres choix
                    echo "Ce choix n'est pas disponible, merci de saisir 1, 2 ou 3."
                    break
                    ;;
            esac
        done
    done
}

function menu:computer:info() {
    echo -e "\e[32mMenu information de l'ordinateur, que souhaitez-vous faire ?\e[0m"
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
                    echo "TODO ajout de la fonction version de l'OS"
                    break
                    ;;
                2) #Fonction nombre de disque
                    echo "TODO ajout de la fonction nombre de disque"
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
                    echo -e "\e[32mMenu ordinateur, que souhaitez-vous faire ?\e[0m"
                    break 2
                    ;;
                *) # Pour tout les autres choix
                    echo "Ce choix n'est pas disponible, merci de saisir un nombre entre 1 et 13."
                    break;;
            esac
        done
    done
}

function menu:computer:action() {
    echo -e "\e[32mMenu action de l'ordinateur, que souhaitez-vous faire ?\e[0m"
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
                    echo "TODO ajout de la fonction Mise a jour du système"
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
                    echo "TODO ajout de la fonction Activation du par-feu"
                    break
                    ;;
                11) #Fonction Désactivation du par-feu
                    echo "TODO ajout de la fonction Désactivation du par-feu"
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
                    echo -e "\e[32mMenu ordinateur, que souhaitez-vous faire ?\e[0m"
                    break 2
                    ;;
                *) # Pour tout les autres choix
                    echo "Ce choix n'est pas disponible, merci de saisir un nombre entre 1 et 15."
                    break
                    ;;
            esac
        done
    done
}
    

menu