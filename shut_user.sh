#!/bin/bash

shut_user() {


    while true; do

        #demande quel utilisateur désactiver"
        read -p "indiquer le nom de l'utilisateur a désactiver " user_shut

        #vérifie l'existance de l'utilisateur si oui demande la confirmation de desactivation
        if id "$user_shut" &>/dev/null; then
        read -p "vouler vous désactiver l'utilisateur $user_shut ? o/n " verif_shut
        
                #si la réponse est "o" désactive le compte de l'utilisteur
                if [[ $verif_shut = "o" ]]; then
                sudo sudo usermod --expiredate 1 $user_shut &>/dev/null

                    #vérifie si l'utilisateur a bien été désactiver
                    if [ "$?" == 0 ]; then
                    echo "l'utilisateur à bien été supprimer"
                    break

                    fi
                #si la réponse est "n" affiche un message
                else
                echo "Suppression annulé"

                fi

        else
        echo "l'utilisateur n'éxiste pas"
    
        fi

    done

}                                                          #Luca
shut_user