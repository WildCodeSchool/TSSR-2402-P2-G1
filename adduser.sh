#!/bin/bash


#fonction d'ajout d'utilisateur
add_user() {

    #demande d'ajouter un nom ou plusieurs
    read -p "indiquer le nom du ou des utilisateurs séparé par un espace" -a noms

    for nom in "${noms[@]}"; do
        if id "$nom"&>/dev/null; then
            echo "l'utilisateur $nom existe déja"
        else
            sudo useradd "$nom"
            
            if id "$nom"&>/dev/null; then
                echo "l'utilisateur $nom à bien été crée"
            else
                echo "erreur de création de l'utilisateur $nom"
            
            fi
        fi
    done
}
add_user                                                     #Luca




