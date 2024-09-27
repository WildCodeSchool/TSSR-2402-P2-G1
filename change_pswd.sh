#!/bin/bash

change_pswd() {
        
while true; do
        
        #demande sur quel utilisateur effectuer la modification de mot de passe
        
        #verifie si l'utilisateur existe
        if id "$user_pswd" &>/dev/null; then
        sudo passwd $user_pswd
        break
        
        else
        echo "l'utilisateur $user_pswd n'existe pas"
        
        fi
        
done
}                                       #Luca
change_pswd