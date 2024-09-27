#!/bin/bash

admin_grp() {

while true; do

    # demander quel utilisateur ajouter"
    read -p "quelle utlisateur vouler vous ajouter au groupe administration " grp_admin
        #verifie l'existance de l'utilisateur
        if id "$grp_admin" &>/dev/null; then

            #si oui demande confirtmation d'ajout au groupe sudo
            read -p "vouler vous ajouter $grp_admin au groupe sudo ? o/n " verif_admin

                #si oui ajoute au groupe sudo
                if [[ $verif_admin == "o" ]]; then
                    sudo usermod -aG sudo "$grp_admin" &>/dev/null

                        #verifie si le l'utilisateur a bien été integré au groupe sudo
                        if id $grp_admin | grep -qw 'sudo'; then
                            #si oui affiche l'utilisateur a été ajouté avec succes
                            echo "l'utilisateur a été ajouter avec succes"
                            break
                        else
                            echo "l'ajout de l'utilisateur au groupe adminstration à échoué"

                        fi
                    #si non affiche annulation d'ajout au groupe administrateur
                else
                    echo "Ajout au groupe administration annulé"
                    
          
               fi
        else
            echo "l'utilisateur $grp_admin n'existe pas"
        fi
done
}
admin_grp