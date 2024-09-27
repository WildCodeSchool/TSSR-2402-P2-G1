#!/bin/bash

function add_grp() {

    while true; do
        
        # Demande quel utilisateur doit être ajouté à un groupe
        read -p "Quel utilisateur souhaitez-vous ajouter à un groupe ? " grp_add 
        
        # Vérifie si l'utilisateur saisi existe
        if id "$grp_add" &>/dev/null; then
            # Si l'utilisateur existe, demande à quel groupe il doit être ajouté
            read -p "À quel groupe souhaitez-vous ajouter $grp_add ? " grp_name
            
            # Vérifie si le groupe demandé existe
            if getent group "$grp_name" &>/dev/null; then 
                # Si oui, ajoute l'utilisateur au groupe
                sudo usermod -aG "$grp_name" "$grp_add"
                
                # Vérifie si l'utilisateur a bien été ajouté au groupe
                if id -nG "$grp_add" | grep -qw "$grp_name"; then
                    # Si oui, affiche un message de validation
                    echo "L'utilisateur $grp_add a bien été ajouté au groupe $grp_name."
                    break
                else
                    # Si non, affiche un message d'erreur
                    echo "Erreur lors de l'ajout de l'utilisateur au groupe $grp_name."
                fi 
            else
                echo "Le groupe indiqué n'existe pas."
            fi
        else
            echo "L'utilisateur indiqué n'existe pas."
        fi
    done            
}       

add_grp
