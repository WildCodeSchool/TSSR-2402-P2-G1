#!/bin/bash

function menu() {
    echo "Bonjour, bienvenue dans Sumo, comment puis-je vous aider ?"
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
                    echo "Sumo vous remercie d'avoir fait appel a ses services."
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
    echo "Menu utilisateur, que souhaitez-vous faire ?"
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
                    echo "Menu utilisateur, que souhaitez-vous faire ?"
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
    echo "Menu informartion de l'utilisateur, que souhaitez-vous faire ?"
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
                    echo "Menu de l'utilisateur, que souhaitez-vous faire ?"
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
    echo "Menu action de l'utilisateur, que souhaitez-vous faire ?"
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
                    echo "Menu de l'utilisateur, que souhaitez-vous faire ?"
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

menu