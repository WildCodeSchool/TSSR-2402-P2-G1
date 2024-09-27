#!/bin/bash

function last_session() {

    while true;do
        
        #demande de quel utilisateur veut on voir l'historique de session ouverte
        read -p "De quel utilisateur souhaitez vous voir l'historique de session ouverte ? " session_name
        
            #verifie l'existance de l'utilisateur indiquer
            if id $session_name &>/dev/null; then
                #si oui affiche le résultat de la commande
                grep "session opened" /var/log/auth.log | grep "$user"
                #si non affiche "l'utilisateur indiquer n'existe pas "
                break
                
            else
            echo "l'utilisateur indiquer n'existe pas "
            
            fi
    done
}
last_session