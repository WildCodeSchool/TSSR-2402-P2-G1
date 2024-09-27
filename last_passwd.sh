#!/bin/bash

function last_psswd() {

    while true;do
        
        #demande de quel utilisateur veut on voir la derniere mofification de mot de passe
        read -p "De quel utilisateur souhaitez vous voir la derniere modification du mot de passe ? " pass_name
        
            #verifie l'existance de l'utilisateur indiquer
            if id $pass_name &>/dev/null; then
                #si oui affiche le résultat de la commande
                sudo chage -l $pass_name | grep "Last password change"
                #si non affiche "l'utilisateur indiquer n'existe pas "
                break
                
            else
            echo "l'utilisateur indiquer n'existe pas "
            
            fi
    done
}

last_psswd