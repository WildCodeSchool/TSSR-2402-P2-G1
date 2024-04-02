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
     "Menu Information de l'utilisateur, que souhaitez-vous faire ?"
     "1 - Date de dernière connexion"
     "2 - Date de la dernière modification du mot de passe"
     "3 - Liste des sessions ouvertes par l'utilisateur"
     "4 - A quelle groupe appartient l'utilisateur"
     "5 - Liste des commandes utiliser par l'utilisateur"
     "6 - Droit et permissions de l'utilisateur sur un dossier"
     "7 - Droit et permissions de l'utilisateur sur un fichier"
     "8 - Recherche des événements dans le fichier log_evt.log pour un utilisateur"
     "9 - Retour au menu précédent"
    read -p "Entrez le numéro souhaité: " choiceMUI
}

menu