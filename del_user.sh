#!/bin/bash

del_user() {

    while true; do
        #demande quel utilisateur supprimer"
        read -p "indiquer le nom de l'utilisateur a supprimer " user_del

        #vérifie l'existance de l'utilisateur si oui demande la confirmation de suppression
        if id "$user_del" &>/dev/null; then
            read -p "vouler vous supprimer l'utilisateur $user_del ? o/n " verif_del
        
                #si la réponse est "o" supprime l'utilisteur
                if [[ $verif_del = "o" ]]; then
                sudo userdel $user_del

                    #verifie si l'utilisateur a bien été supprimer
                    if id "$user_del" &>/dev/null; then
                    echo "erreur l'utilisateur na pas été supprimer"
                    
                    else
                    echo "l'utilisateur $user_del à bien été supprimer"
                
                    fi
                    break            
                #si la réponse est "n" affiche un message
                else
                echo "Suppression annulé"
                
                fi

        else
        echo "l'utilisateur $user_del n'existe pas" 

        fi
    
    done

}                                                          #Luca 
del_user