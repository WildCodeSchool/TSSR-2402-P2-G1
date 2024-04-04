#!/bin/bash

function del_grp() {

    while true; do
        
        # Demande quel utilisateur doit être supprimer d'un groupe
        read -p "Quel utilisateur souhaitez-vous supprimer d'un groupe ? " grp_del 
        
        # Vérifie si l'utilisateur saisi existe
        if id "$grp_del" &>/dev/null; then
            # Si l'utilisateur existe, demande à quel groupe il doit être supprimer
            read -p "De quel groupe souhaitez-vous supprimer $grp_del ? " grp_verif
            
            # Vérifie si le groupe demandé existe
            if getent group "$grp_verif" &>/dev/null; then
                
                #verifi si l'utilisateur est dans le groupe demander
                if id -nG "$grp_del" | grep -qw "$grp_verif" &>/dev/null; then
                    
                    # Si oui, supprime l'utilisateur du groupe
                    sudo gpasswd -d "$grp_del" "$grp_verif" &>/dev/null
                    
                    # Vérifie si l'utilisateur a bien été supprimer du groupe
                    if ! id -nG "$grp_del" | grep -qw "$grp_verif" &>/dev/null; then
                        
                        # Si oui, affiche un message de validation
                        echo "L'utilisateur $grp_del a bien été supprimer du groupe $grp_verif."
                        break
                    else
                        # Si non, affiche un message d'erreur
                        echo "Erreur lors de la suppression du groupe $grp_verif."
                    fi 
                    
                else
                echo "l'utilisateur ne fait pas partie de ce groupe"
                fi
            else
                echo "Le groupe indiqué n'existe pas."
            fi
        else
            echo "L'utilisateur indiqué n'existe pas."
        fi
    done            
}       

del_grp
