#!/bin/bash

function last_log() {

    while true; do
        
        #demande de quel utilisateur veut on voir l'historique de connexion
        read -p "De quel utilisateur souhaitez vous voir l'historique de connexion ? " log_name
            
            #verifie si l'utilisateur existe
            if id $log_name &>/dev/null; then
                #si oui affiche l'historique de connexion
                lastlog -u $log_name
                break
                #si non affiche "L'utilisateur indiquer n'existe pas "
            else
            echo "l'utilisateur indiquer n'existe pas "
            
            fi
    done
}

last_log