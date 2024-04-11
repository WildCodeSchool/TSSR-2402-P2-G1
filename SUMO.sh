#!/bin/bash
# Branche Main

####################################################################
#  Nom du Projet : System for Unified Master Operating aka SUMO
#  Description :
#    Script permettant l'automatisation de la gestion de postes 
#    et d'utilisateurs client.
#  Auteurs :
#   - Ahmed Ben Rebai <benrebaiahmed@gmail.com>
#   - Nicolas Claverie <claverie.nicolas.lapo@gmail.com>
#   - Pierre Girard <pierre.girard2788@gmail.com>
#   - Alexandre Peyronie <alexpeyro@gmail.com>
#   - Luca Pouilly <luca.pouilly@hotmail.com>
####################################################################

#######################################
# Affiche le menu principal.
# Auteur : Nico
#   
#######################################

function menu() {
    $logs Démarrage du script pour $choix_user sur $choix_ordinateur
    $logs Menu de selection
    echo -e "\e[32m----------------------------------------------------------
Bonjour, bienvenue dans Sumo, comment puis-je vous aider ?
----------------------------------------------------------\e[0m"
    local options=( 
        "Je veux cibler l'utilisateur."
        "Je veux cibler l'ordinateur."
        "Je veux sortir du script."
        )
    local PS3='Entrez le numéro souhaité: '

    while true; do
        select opt in "${options[@]}"; do 
            case $REPLY in
                1) # Cibler un utilisateur
                    $logs Choix utilisateur
                    menu:user
                    break
                    ;;
                2) # Cibler un ordinateur
                    $logs Choix ordinateur
                    menu:computer
                    break
                    ;;
                3) # Sortie du script
                    $logs Fin du Script
                    journalctl | grep $0 >> /var/log/log_evt.log
                    echo -e "\e[32mSumo vous remercie d'avoir fait appel a ses services.\e[0m"
                    echo " "
                    break 2
                    ;;
                *) # Pour tout les autres choix
                    $logs Choix $REPLY incorrect
                    echo -e "\e[31mCe choix n'est pas disponible, merci de saisir 1, 2 ou 3.\e[0m"
                    break
                    ;;
            esac
        done
    done
} 

#######################################
# Affiche le sous-menu utilisateurs.
# Auteur : Nico
# 
#######################################

function menu:user() {
    echo -e "--------------------------------------------------
\e[32mMenu utilisateur, que souhaitez-vous faire ?
--------------------------------------------------\e[0m"
    local options=(
        "Je veux des information."
        "Je veux effectuer une action."
        "Je veux retourner au menu précédent."
    )
    local PS3='Entrez le numéro souhaité: '

    while true; do
        select opt in "${options[@]}"; do
            case $REPLY in 
                1) #Information utilisateur
                    $logs Choix information utilisateur
                    menu:user:info
                    break
                    ;;
                2) #Action utilisateur
                    $logs Choix action utilisateur
                    menu:user:action
                    break
                    ;;
                3) #Retour menu précédent
                    $logs Retour menu principal
                    echo "Back to the futur"
                    echo -e "\e[32m----------------------------------------------------------
Bonjour, bienvenue dans Sumo, comment puis-je vous aider ?
----------------------------------------------------------\e[0m"
                    break 2
                    ;;
                *) # Pour tout les autres choix
                    $logs Choix $REPLY incorrect
                    echo -e "\e[31mCe choix n'est pas disponible, merci de saisir 1, 2 ou 3.\e[0m"
                    break
                    ;;
            esac
        done
    done
}

#####################################################
# Affiche le sous-menu d'info sur les utilisateurs.
# Auteur : Nico
# 
#####################################################

function menu:user:info() {
    echo -e "\e[32m--------------------------------------------------------------
Menu informartion de l'utilisateur, que souhaitez-vous faire ?
--------------------------------------------------------------\e[0m"
    local options=(
        "Date de dernière connexion"
        "Date de la dernière modification du mot de passe"
        "Liste des sessions ouvertes par l'utilisateur"
        "A quelle groupe appartient l'utilisateur"
        "Liste des commandes utiliser par l'utilisateur"
        "Droit et permissions de l'utilisateur sur un dossier"
        "Droit et permissions de l'utilisateur sur un fichier"
        "Recherche des événements dans le fichier log_evt.log pour un utilisateur"
        "Retour au menu précédent"
    )
    local PS3='Entrez le numéro souhaité: '

    while true; do
        select opt in "${options[@]}"; do
            case $REPLY in
                1) #Fonction de la date de derniere connexion
                    $logs $REPLY Date de la derniere connexion
                    last_log
                    break
                    ;;
                2) #Fonction de la date de la dernière modification du mot de passe
                    $logs $REPLY Date de la dernière modification du mot de passe
                    last_psswd
                    break
                    ;;
                3) #Fonction de la liste des sessions ouvertes par l'utilisateur
                    $logs $REPLY Liste des sessions ouvertes par l\'utilisateur
                    last_session
                    break
                    ;;
                4) #Fonction de quelle groupe appartient l'utilisateur
                    $logs $REPLY A quelle groupe appartient l\'utilisateur
                    grp_belo
                    break
                    ;;
                5) #Fonction de la liste des commandes utiliser par l'utilisateur
                    $logs $REPLY Liste des commandes utiliser par l\'utilisateur
                    last_cmd
                    break
                    ;;
                6) #Fonction des droit et permissions de l'utilisateur sur un dossier
                    $logs $REPLY Droits et permissions de l\'utilisateur sur un dossier
                    perm_right_dir
                    break
                    ;;
                7) #Fonction des droit et permissions de l'utilisateur sur un fichier
                    $logs $REPLY Droits et permissions de l\'utilisateur sur un fichier
                    perm_right_file
                    break
                    ;;
                8) #Fonction de la recherche des événements dans le fichier log_evt.log
                    $logs $REPLY Recherche des événements dans le fichier log_evt.log pour l\'utilisateur
                    user_log
                    break
                    ;;
                9) #Retour menu précédent
                    $logs Retour menu utilisateur
                    echo "Back to the futur"
                    echo -e "--------------------------------------------------
\e[32mMenu utilisateur, que souhaitez-vous faire ?
--------------------------------------------------\e[0m"
                    break 2
                    ;;
                *) # Pour tout les autres choix
                    $logs Choix $REPLY incorrect
                    echo -e "\e[31mCe choix n'est pas disponible, merci de saisir un chiffre entre 1 et 9.\e[0m"
                    break
                    ;;
            esac
        done
    done
}

#####################################################
# Fonction Date de dernière connexion
# Auteur : Luca
# 
#####################################################

#!/bin/bash

function last_log() {

    $logs Consultation de la date de derniere connexion
    while true; do
        
        #demande de quel utilisateur veut on voir l'historique de connexion
        read -p "De quel utilisateur souhaitez vous voir l'historique de connexion ? " log_name
            
            #verifie si l'utilisateur existe
            if $sshtarget id $log_name &>/dev/null; then
                #si oui affiche l'historique de connexion
                $sshtarget lastlog -u $log_name && $sshtarget lastlog -u $log_name >> $file_log
                break
                #si non affiche "L'utilisateur indiquer n'existe pas "
            else
            echo "l'utilisateur indiquer n'existe pas "
            break
            
            fi
    done
    $logs Fin de consultation de la date de drniere connexion
}

#####################################################
# Fonction Date de la dernière modification du mot de passe 
# Auteur : Luca
# 
#####################################################

function last_psswd() {

    $logs Début d\'action de verifier la derniere modificaton de mot de passe
    
    read -p "De quel utilisateur souhaitez vous voir la derniere modification du mot de passe ? " pass_name
        
    $sshtarget "chage -l $pass_name | grep modification" && $sshtarget "chage -l $pass_name | grep modification" >> $file_log
    
    $logs Fin de L\'action de la derniere modificaton de mot de passe
    
}   

#####################################################
# Fonction Liste des sessions ouvertes par l'utilisateur
# Auteur : Luca
# !!! Work in progress !!!
#####################################################

function last_session() {

    $logs Consultation des sessions ouverte
    while true;do
        
        #demande de quel utilisateur veut on voir l'historique de session ouverte
        read -p "De quel utilisateur souhaitez-vous voir l'historique de session ouverte ? : " session_name
        
            #verifie l'existance de l'utilisateur indiquer
            if $sshtarget id $session_name &>/dev/null; then
                #si oui affiche le résultat de la commande
                $sshtarget "grep session opened /var/log/auth.log | grep $session_name" && $sshtarget "grep session opened /var/log/auth.log | grep $session_name" >> $file_log
                #si non affiche "l'utilisateur indiquer n'existe pas "
                break
                
            else
            echo "L'utilisateur indiquer n'existe pas "
            break
            fi
    done
    $logs Fin de la consultation des sessions ouverte
}

#####################################################
# Fonction A quelle groupe appartient l'utilisateur
# Auteur : Luca
# 
#####################################################

#!/bin/bash

function grp_belo() {

while true;do
    
    $logs vérifie à quel groupe appartient l\'utilisateur $belo_name
    
    #demande de quel utilisateur veut t'on verifier l'appartenance
    read -p "De quel utilisateur voulez vous verifier les groupes d'appartenance ? " belo_name
        
        #vverifie si l'utilisateur existe
        if $sshtarget id $belo_name;then
        
        #si oui execute la commande de recuperattion de groupe
        $logs Groupe d'apartenance de l\'utilisateur $belo_name 
        echo "l'utilisateur $belo_name appartient à " >> $file_log
        $sshtarget "cat /etc/group | grep $belo_name" &&  $sshtarget "cat /etc/group | grep $belo_name" >> $file_log
        
        #si non indique que l'utilisateur indiquer n'existe pas 
        else
        echo "L'utilisateur $belo_name n'existe pas "
        $logs l\'utilisateur $belo_name n\'existe pas
        break
        fi
done
    $logs fin de verification appartenance de groupe
}

#####################################################
# Fonction Liste des commandes utiliser par l'utilisateur
# Auteur : Pierre et Nico
# 
#####################################################

function last_cmd() {

    $logs Liste des commandes utiliser par l\'utilisateur
    echo "Liste des dernieres commandes passé par l'utilisateur $user_choice" >> $file_log
    $sshtarget "cat ~/.bash_history" && $sshtarget "cat ~/.bash_history" >> $file_log
    $logs Fin de liste des commandes utiliser par l\'utilisateur
}

#####################################################
# Fonction Droit et permissions de l'utilisateur sur un dossier
# Auteur : Nico
# 
#####################################################

function perm_right_dir() {
    $logs Affichage des droits et permissions dossier pour l\'utilisateur $choix_user
    read -p "Nom du dossier : " dir_name
    echo "Droit et permissions de l'utilisateur $choix_user sur le dossier $dir_name"
    $sshtarget getfacl $dir_name && $$sshtarget getfacl $dir_name >> $file_log
    $logs Fin affichage des droits et permissions dossier
}

#####################################################
# Fonction Droit et permissions de l'utilisateur sur un fichier
# Auteur : Nico
# 
#####################################################

function perm_right_file() {
    $logs Affichage des droits et permissions fichier pour l\'utilisateur $choix_user
    read -p "Nom du fichier : " file_name
    echo "Droit et permissions de l'utilisateur $choix_user sur le dossier $file_name"
    $sshtarget getfacl $file_name && $$sshtarget getfacl $file_name >> $file_log
    $logs Fin affichage des droits et permissions fichier
}

#####################################################
# Fonction Recherche des événements dans le fichier log_evt.log pour un utilisateur
# Auteur : Nico
# 
#####################################################

function user_log() {
    $logs Consultation du fichier evt_log.log pour utlisateur
    journalctl | grep $0 >> /var/log/log_evt.log
    read -p "Consultation du fichier evt_log.log pour quel utilisateur : " evtulog
    echo "Extrait du journal evt_log.log pour l'utilisateur $evtulog" >> $file_log
    cat /var/log/log_evt.log | grep $evtulog && cat /var/log/log_evt.log | grep $evtulog >> $file_log
    $logs Fin de consultation du fichier evt_log.log pour utilisateur
}

#####################################################
# Affiche le sous-menu d'action sur les utilisateurs.
# Auteur : Nico
# 
#####################################################

function menu:user:action() {
    echo -e "\e[32m--------------------------------------------------------
Menu action de l'utilisateur, que souhaitez-vous faire ?
--------------------------------------------------------\e[0m"
    local options=(
        "Création d'un compte local"
        "Changer le mot de passe d'un compte"
        "Suppression d'un compte utilisateur"
        "Désactivation d'un compte utilisateur local"
        "Ajout a un groupe d'administration"
        "Ajout a un groupe local"
        "Sortie d'un groupe local"
        "Retour au menu précédent"
    )
    local PS3='Entrez le numéro souhaité: '

    while true; do
        select opt in "${options[@]}"; do
            case $REPLY in
                1) #Fonction Création d'un compte local
                    $logs $REPLY Création d\'un compte local
                    add_user
                    break
                    ;;
                2) #Fonction changer le mot de passe d'un compte
                    $logs $REPLY Changer le mot de passe d\'un compte
                    change_pswd
                    break
                    ;;
                3) #Fonction suppression d'un compte utilisateur
                    $logs $REPLY Suppression d\'un compte utilisateur
                    del_user
                    break
                    ;;
                4) # Fonction désactivation d'un compte utilisateur local
                    $logs $REPLY Désactivation d\'un compte utilisateur local
                    shut_user
                    break
                    ;;
                5) # Fonction ajout a un groupe d'administration
                    $logs $REPLY Ajout a un groupe d\'administration
                    admin_grp
                    break
                    ;;
                6) # Fonction ajout a un groupe local
                    $logs $REPLY Ajout a un groupe local
                    add_grp
                    break
                    ;;
                7) # Fonction sortie d'un groupe local
                    $logs $REPLY Sortie d\'un groupe local
                    del_grp
                    break
                    ;;
                8) #Retour menu précédent
                    $logs Retour menu utilisateur
                    echo "Back to the futur"
                    echo -e "--------------------------------------------------
\e[32mMenu utilisateur, que souhaitez-vous faire ?
--------------------------------------------------\e[0m"
                    break 2
                    ;;
                *) # Pour tout les autres choix
                    $logs Choix $REPLY incorrect
                    echo -e "\e[31mCe choix n'est pas disponible, merci de saisir un chiffre entre 1 et 7.\e[0m"
                    break
                    ;;
            esac
        done
    done
}

#####################################################
# Fonction Création d'un compte local
# Auteur : Luca
# 
#####################################################

#fonction d'ajout d'utilisateur
add_user() {
    
    $logs Création d\'un nouveau utilisateur
    #demande d'ajouter un nom ou plusieurs
    read -p "indiquer le nom du ou des utilisateurs séparé par un espace : " -a noms
    
    for nom in "${noms[@]}"; do

        if $sshtarget id "$nom"&>/dev/null; then
            echo "l'utilisateur $nom existe déja"
            $logs echec l\'utilisateur existe déjà
        else
            $sshtarget sudo useradd "$nom"
            
            if $sshtarget id "$nom"&>/dev/null; then
                echo "l'utilisateur $nom à bien été crée"
                $logs Confirmation de création de $nom
            else
                echo "erreur de création de l'utilisateur $nom"
            
            fi
        fi
    done
    $logs Fin de l'action de création d\'utilisateur
}

#####################################################
# Fonction Changer le mot de passe d'un compte
# Auteur : Luca
# 
#####################################################

change_pswd() {

    $logs Début d\'action de modification de mot de passe     
        while true; do
        
            #demande sur quel utilisateur effectuer la modification de mot de passe
            read -p "De quel utilisateur modifier le mot de passe ? " user_pswd
            
            #verifie si l'utilisateur existe
            if $sshtarget id "$user_pswd" &>/dev/null; then
            $logs Modification du mot de passe de passe de $user_pswd
            $sshtarget sudo passwd $user_pswd
            break
            
            else
            echo "L'utilisateur $user_pswd n'existe pas"
            $logs echec L\'utilisateur $user_pswd n\'existe pas
            break
            fi
        
        done
    $logs Fin de l\'action de modification de mot de passe
}    

#####################################################
# Fonction Suppression d'un compte utilisateur
# Auteur : Luca
# 
#####################################################

del_user() {

    $logs Début action suppréssion d\'un utlisateur
    
    while true; do
        #demande quel utilisateur supprimer"
        read -p "Indiquer le nom de l'utilisateur a supprimer : " user_del
        
        #vérifie l'existance de l'utilisateur si oui demande la confirmation de suppression
        if $sshtarget id "$user_del" &>/dev/null; then
            read -p "Voulez-vous supprimer l'utilisateur $user_del ? o/n : " verif_del
                
                #si la réponse est "o" supprime l'utilisteur
                if [[ $verif_del = "o" ]]; then
                $logs Suppression de l\'utilisateur $user_del
                $sshtarget sudo userdel $user_del
                
                    #verifie si l'utilisateur a bien été supprimer
                    if $sshtarget id "$user_del" &>/dev/null; then
                    echo "Erreur l'utilisateur n'a pas été supprimé"
                    $logs Erreur dans la suppression de l\'utilisateur $user_del
                    
                    else
                    echo "L'utilisateur $user_del a bien été supprimé"
                    $logs Confirmation de Suppression de l\'Utilisateur $user_del
                    fi
                    break            
                #si la réponse est "n" affiche un message
                else
                echo "Suppression annulé"
                $logs Annulation de l\'action de suppression
                break
                fi
        
        else
        echo "l'utilisateur $user_del n'existe pas" 
        $logs Erreur l\'utilisateur $user_del n\'existe pas
        break
        fi
    
    done
    $logs Fin de l\'action de suppression d\'un utilisateur
}  

#####################################################
# Fonction Désactivation d'un compte utilisateur local
# Auteur : Luca
# 
#####################################################

shut_user() {
    
    $logs Début Action de désactivation d\'un utilisateur
    
    while true; do
        
        #demande quel utilisateur désactiver"
        read -p "Indiquer le nom de l'utilisateur a désactiver : " user_shut
        
        #vérifie l'existance de l'utilisateur si oui demande la confirmation de desactivation
        if $sshtarget id "$user_shut" &>/dev/null; then
        read -p "Voulez-vous désactiver l'utilisateur $user_shut ? o/n : " verif_shut
                
                #si la réponse est "o" désactive le compte de l'utilisteur
                if [[ $verif_shut = "o" ]]; then
                $logs Désactivation de l\'utilisateur $user_shut
                $sshtarget sudo usermod --expiredate 1 $user_shut &>/dev/null
                
                    #vérifie si l'utilisateur a bien été désactiver
                    if [ "$?" == 0 ]; then
                    echo "L'utilisateur a bien été supprimé"
                    $logs Confirmation de la désactivation de l\'utilisateur $user_shut
                    break
                    fi

                #si la réponse est "n" affiche un message
                else
                echo "Suppression annulé"
                $logs Annulation de la désactivation de l\'utilisateur $user_shut
                break
                fi
                
        else
        echo "L'utilisateur n'existe pas"
        $logs Erreur l\'utilisateur $user_shut n\'existe pas
        break
        fi
        
    done
    $logs Fin Action Désactivation d\'un utilisateur

}  

#####################################################
# Fonction Ajout a un groupe d'administration
# Auteur : Luca
# 
#####################################################

admin_grp() {

    $logs Début action ajout au groupe sudo    
    
    while true; do
    
    # demander quel utilisateur ajouter"
    read -p "Quel utlisateur voulez-vous ajouter au groupe administration ? : " grp_admin
        #verifie l'existance de l'utilisateur
        if $sshtarget id "$grp_admin" &>/dev/null; then
            
            #si oui demande confirtmation d'ajout au groupe sudo
            read -p "Voulez-vous ajouter $grp_admin au groupe sudo ? o/n :" verif_admin
                
                #si oui ajoute au groupe sudo
                if [[ $verif_admin == "o" ]]; then
                    $logs Ajout au groupe sudo
                    $sshtarget sudo usermod -aG sudo $grp_admin
                        
                        #verifie si le l'utilisateur a bien été integré au groupe sudo
                        if $sshtarget id $grp_admin | grep -qw 'sudo'; then
                            #si oui affiche l'utilisateur a été ajouté avec succes
                            echo "l'utilisateur a été ajouter avec succes"
                            $logs Confirmation ajout au groupe sudo
                            break
                        else
                            echo "L'ajout de l'utilisateur au groupe administration a échoué"
                            $logs Echec de l\'ajout au grouoe sudo
                            break
                        fi
                    #si non affiche annulation d'ajout au groupe administrateur
                else
                    echo "Ajout au groupe administration annulé"
                    $logs Annulation de l\'ajout au groupe sudo
                    break
                fi
        else
            echo "L'utilisateur $grp_admin n'existe pas"
            $logs Erreur l\'utilisateur n\'existe pas
            break
        fi

    done
    $logs Fin de l\'action d\'ajout au grouoe sudo
}

#####################################################
# Fonction Ajout a un groupe local
# Auteur : Luca
# 
#####################################################

function add_grp() {

    $logs Action d\'ajout à un groupe local

    while true; do
        
        # Demande quel utilisateur doit être ajouté à un groupe
        read -p "Quel utilisateur souhaitez-vous ajouter à un groupe ? : " grp_add 
        
        # Vérifie si l'utilisateur saisi existe
        if $sshtarget id "$grp_add" &>/dev/null; then
            # Si l'utilisateur existe, demande à quel groupe il doit être ajouté
            read -p "À quel groupe souhaitez-vous ajouter $grp_add ? : " grp_name
            
            # Vérifie si le groupe demandé existe
            if $sshtarget getent group "$grp_name" &>/dev/null; then 
                # Si oui, ajoute l'utilisateur au groupe
                $logs Ajout de $grp_add au groupe $grp_name
                $sshtarget sudo usermod -aG "$grp_name" "$grp_add"
                
                # Vérifie si l'utilisateur a bien été ajouté au groupe
                if $sshtarget id -nG "$grp_add" | grep -qw "$grp_name"; then
                    # Si oui, affiche un message de validation
                    echo "L'utilisateur $grp_add a bien été ajouté au groupe $grp_name."
                    $logs Confirmation de l\'ajout au groupe $grp_name
                    break
                else
                    # Si non, affiche un message d'erreur
                    echo "Erreur lors de l'ajout de l'utilisateur au groupe $grp_name."
                    $logs Echec de l\'ajout de $grp_add au groupe $grp_name
                fi 
            else
                echo "Le groupe indiqué n'existe pas."
                $logs Erreur le groupe n\'existe pas
                break
            fi
        else
            echo "L'utilisateur indiqué n'existe pas."
            $logs Erreur l\'utilisateur n\'existe pas
            break
        fi
    done      
    $logs Fin de l\'action d\'ajout à un groupe     
}       


#####################################################
# Fonction Sortie d'un groupe local
# Auteur : Luca
# 
#####################################################

function del_grp() {

    $logs Début action de suppression d\'un groupe

    while true; do
        
        # Demande quel utilisateur doit être supprimer d'un groupe
        read -p "Quel utilisateur souhaitez-vous supprimer d'un groupe ? : " grp_del 
        
        # Vérifie si l'utilisateur saisi existe
        if $sshtarget id "$grp_del" &>/dev/null; then
            # Si l'utilisateur existe, demande à quel groupe il doit être supprimer
            read -p "De quel groupe souhaitez-vous supprimer $grp_del ? : " grp_verif
            
            # Vérifie si le groupe demandé existe
            if $sshtarget getent group "$grp_verif" &>/dev/null; then
                
                #verifi si l'utilisateur est dans le groupe demander
                if $sshtarget id -nG "$grp_del" | grep -qw "$grp_verif"; then
                    
                    # Si oui, supprime l'utilisateur du groupe
                    $sshtarget sudo gpasswd -d "$grp_del" "$grp_verif" 
                    $logs Suppression de $grp_del du groupe $grp_verif
                    # Vérifie si l'utilisateur a bien été supprimer du groupe
                    if $sshtarget ! id -nG "$grp_del" | grep -qw "$grp_verif"; then
                        
                        # Si oui, affiche un message de validation
                        echo "L'utilisateur $grp_del a bien été supprimé du groupe $grp_verif."
                        $logs Confirmation de l'ajout de l\'utilisateur $grp_del au groupe $grp_verif
                        break
                    else
                        # Si non, affiche un message d'erreur
                        echo "Erreur lors de la suppression du groupe $grp_verif."
                        $logs Echec lors de la suppression de $grp_del du groupe $grp_verif
                        break
                    fi 
                    
                else
                    echo "L'utilisateur ne fait pas partie de ce groupe"
                    $logs Erreur l\'utilisateur ne fait pas partie de ce groupe
                    break
                    fi
            else
                echo "Le groupe indiqué n'existe pas."
                break
            fi
        else
            echo "L'utilisateur indiqué n'existe pas."
            break
        fi
    done            
}    

#######################################
# Affiche le sous-menu ordinateur.
# Auteur : Nico
# 
#######################################

function menu:computer() {
    echo -e "\e[32m-------------------------------------------
Menu ordinateur, que souhaitez-vous faire ?
-------------------------------------------\e[0m"
    local options=(
        "Je veux des information."
        "Je veux effectuer une action."
        "Je veux retourner au menu précédent."
    )
    local PS3='Entrez le numéro souhaité: '

    while true; do
        select opt in "${options[@]}"; do
            case $REPLY in
                1) #Information ordinateur
                    $logs Choix information ordinateur
                    menu:computer:info
                    break
                    ;;
                2) #Action ordinateur
                    $logs Choix action ordinateur
                    menu:computer:action
                    break
                    ;;
                3) #Retour menu précédent
                    $logs Retour menu principal
                    echo "Back to the futur"
                    echo -e "\e[32m----------------------------------------------------------
Bonjour, bienvenue dans Sumo, comment puis-je vous aider ?
----------------------------------------------------------\e[0m"
                    break 2
                    ;;
                *) # Pour tout les autres choix
                    $logs Choix $REPLY incorrect
                    echo -e "\e[31mCe choix n'est pas disponible, merci de saisir 1, 2 ou 3.\e[0m"
                    break
                    ;;
            esac
        done
    done
}

#####################################################
# Affiche le sous-menu d'info sur les ordinateurs.
# Auteur : Nico
# 
#####################################################

function menu:computer:info() {
    echo -e "\e[32m------------------------------------------------------------
Menu information de l'ordinateur, que souhaitez-vous faire ?
------------------------------------------------------------\e[0m"
    local options=(
        "Version de l'OS"
        "Nombre de disque"
        "Partition(nombres,nom,FS,taille)"
        "Espace disque restant sur par partitions"
        "Nom et espace disque d'un dossier(nom de dossier demandé)"
        "Liste des lecteurs monté (disque,CD,etc...)"
        "Liste des applications/paquets installées"
        "Liste des services en cours d'execution"
        "Liste des utilisateurs locaux"
        "Memoire RAM total"
        "Utilisation de la RAM"
        "Recherche des événements dans le fichier log_evt.log pour la machine"
        "Retour au menu précédent"
    )
    local PS3='Entrez le numéro souhaité: '

    while true; do
        select opt in "${options[@]}"; do
            case $REPLY in
                1) #Fonction version de l'OS
                    $logs $REPLY Version de l\'OS
                    osVer
                    break
                    ;;
                2) #Fonction nombre de disque
                    $logs $REPLY Nombre de disque
                    nbDsk
                    break
                    ;;
                3) #Fonction partition
                    $logs $REPLY Partition
                    partitions
                    break
                    ;;
                4) #Fonction espace disque restant par partitions
                    $logs $REPLY Espace disque restant par partitions
                    space_disk
                    break
                    ;;
                5) #Fonction nom et espace disque d'un dossier
                    $logs $REPLY Nom et espace disque d\'un dossier
                    space_doc
                    break
                    ;;
                6) #Fonction liste des lecteurs monté
                    $logs $REPLY Liste des lecteurs monté
                    mount-lecteurs
                    break
                    ;;
                7) #Fonction liste des applications/paquets installées
                    $logs $REPLY Liste des applications/paquets installées
                    app_instal
                    break
                    ;;
                8) #Fonction liste des services en cours d'execution
                    $logs $REPLY Liste des services en cours d\'execution
                    exec_service
                    break
                    ;;
                9) #Fonction liste des utilisateurs locaux
                    $logs $REPLY Liste des utilisateurs locaux
                    usr_list
                    break
                    ;;
                10) #Fonction memoire RAM total
                    $logs $REPLY Memoire RAM total
                    ram_total $choix_user $choix_ordinateur
                    break
                    ;;
                11) #Fonction utilisation de la RAM
                    $logs $REPLY Utilisation de la RAM
                    ram_use $choix_user $choix_ordinateur
                    break
                    ;;
                12) #Fonction recherche des événements dans le fichier log_evt.log
                    $logs $REPLY Recherche des événements dans le fichier log_evt.log pour l\'ordinateur
                    computer_log
                    break
                    ;;
                13) #Retour menu précédent
                    $logs Retour menu ordinateur
                    echo "Back to the futur"
                    echo -e "\e[32m-------------------------------------------
Menu ordinateur, que souhaitez-vous faire ?
-------------------------------------------\e[0m"
                    break 2
                    ;;
                *) # Pour tout les autres choix
                    $logs Choix $REPLY incorrect
                    echo -e "\e[31mCe choix n'est pas disponible, merci de saisir un nombre entre 1 et 13.\e[0m"
                    break;;
            esac
        done
    done
}


#####################################################
# Fonction Version de l'OS
# Auteur : Nico
# 
#####################################################

function osVer() {

    $logs Affichage de la version de l\'os
    echo "Version de l'OS:" >> $file_log
    $sshtarget "lsb_release -a" && $sshtarget "lsb_release -a" >> $file_log
}

#####################################################
# Fonction Nombre de disque
# Auteur : Nico
# 
#####################################################

function nbDsk() {

    $logs Affichage du nombre de disque
    echo "Nombre de disque:" >> $file_log
    $sshtarget "lsblk | grep disk | wc -l" && $sshtarget "lsblk | grep disk | wc -l" >> $file_log
}

#####################################################
# Fonction Partition(nombres,nom,FS,taille)
# Auteur : Luca
# 
#####################################################

function partitions() {
    
    $logs Affichage information partirions
    $sshtarget "lsblk -fs" && $sshtarget "lsblk -fs" >> $file_log
    $logs Fin de l\'affichage des information partitions
}

#####################################################
# Fonction Espace disque restant sur par partitions
# Auteur : Luca
# 
#####################################################

function space_disk() {
    
    $logs Affichage espace disques restant par partitions
    $sshtarget "df -h" && $sshtarget "df -h" >> $file_log
    $logs Fin de l\'affichage espaces disques restant par partitions
}

#####################################################
# Fonction Nom et espace disque d'un dossier(nom de dossier demandé)
# Auteur : Luca
# 
#####################################################

function space_doc() {

    $logs Affichage de l\'espace utilisé par le dossier $doc_name
    read -p "De quel dossier verifié l'espace utilisé(chemin complet) ? " doc_name
        if $sshtarget [ -d $doc_name ]; then
        echo "Le dossier $doc_name fait "
        $sshtarget "du -sh $doc_name" && $sshtarget "du -sh $doc_name" >> $file_log
        else
        echo "le dossier $doc_name n'existe pas"
        $logs Le dossier $doc_name n\'existe pas
        fi
    $logs Fin de l\'affichege de l\'espace utilisé par le dossier $doc_name
}

#####################################################
# Fonction Liste des lecteurs monté (disque,CD,etc...)
# Auteur : Luca
# 
#####################################################

function mount-lecteurs() {
    
    $logs Affichage de la liste des lecteurs monté
    $sshtarget "lsblk" && $sshtarget "lsblk" >>$file_log
    $logs Fin de l\'affichage de la liste des lecteurs monté
}

#####################################################
# Fonction Liste des applications/paquets installées
# Auteur : Luca
# 
#####################################################

function app_instal(){

    $logs Listes des applications/paquets installées
    $sshtarget "dpkg -l" && $sshtarget "dpkg -l" >>$file_log
    $logs Fin de la listes des applications/paquets installées
}

#####################################################
# Fonction Liste des services en cours d'execution
# Auteur : Luca
# 
#####################################################

function exec_service() {

    $logs Listes des services en cour d\'execution
    $sshtarget "systemctl list-units --type=service --state=running" && $sshtarget "systemctl list-units --type=service --state=running" >> $file_log
    $logs Fin de la liste des services en cour d\'execution   
}

#####################################################
# Fonction Liste des utilisateurs locaux
# Auteur : Luca
# 
#####################################################

function usr_list() {

    $logs liste des utilisateurs locaux
    $sshtarget "cut -d: -f1 /etc/passwd" && $sshtarget "cut -d: -f1 /etc/passwd" >>$file_log
    $logs Fin de la liste des utilisateurs locaux
    
}

#####################################################
# Fonction Memoire RAM total
# Auteur : pierre 
# 
#####################################################

function ram_total() {

    $logs Consultation de la RAM total
    echo "RAM Totale présente sur le poste" && echo "RAM Totale présente sur le poste:" >> $file_log
    $sshtarget free -h | grep 'Mem' | awk '{print $2}' && $sshtarget free -h | grep 'Mem' | awk '{print $2}' >> $file_log
}

#####################################################
# Fonction Utilisation de la RAM
# Auteur :pierre 
# 
#####################################################

function ram_use() {

    $logs Consultation utilisation de la RAM
    echo "RAM utilisé sur le poste " && echo "RAM utilisé sur le poste:" >> $file_log
    $sshtarget free -h | grep 'Mem' | awk '{print $3}' && $sshtarget free -h | grep 'Mem' | awk '{print $3}' >> $file_log

}

#####################################################
# Fonction Recherche des événements dans le fichier log_evt.log pour la machine
# Auteur : Nico
# 
#####################################################

function computer_log() {
    $logs Consultation du fichier evt_log.log pour $choix_ordinateur
    journalctl | grep $0 >> /var/log/log_evt.log
    read -p "Consultation du fichier evt_log.log pour quel ordinateur : " evtclog
    echo "Extrait du journal evt_log.log pour l'ordinateur $evtclog" >> $file_log
    cat /var/log/log_evt.log | grep $evtclog && cat /var/log/log_evt.log | grep $evtclog >> $file_log
    $logs Fin de consultation du fichier evt_log.log pour ordinateur
}

#####################################################
# Affiche le sous-menu d'action sur les ordinateurs.
# Auteur : Nico
# 
#####################################################

function menu:computer:action() {
    echo -e "\e[32m-------------------------------------------------------
Menu action de l'ordinateur, que souhaitez-vous faire ?
-------------------------------------------------------\e[0m"
    local options=(
        "Arrêt"
        "Redémarrage"
        "Verrouillage"
        "Mise a jour du système"
        "Creation de repertoire"
        "Modification de repertoire"
        "Suppression d'un repertoire"
        "Prise de main a distance"
        "Activation du par-feu"
        "Désactivation du par-feu"
        "Installation de logiciel"
        "Désinstallation de logiciel"
        "Execution de script sur la machine distante"
        "Retour au menu précédent"
    )
    local PS3='Entrez le numéro souhaité: '

    while true; do
        select opt in "${options[@]}"; do
            case $REPLY in
                1) #Fonction Arrêt
                    $logs $REPLY Arrêt
                    arreter_client
                    break
                    ;;
                2) #Fonction Redémarrage
                    $logs $REPLY Redémarrage
                    redemarrer_client
                    break
                    ;;
                3) #Fonction Verrouillage
                    $logs $REPLY Verrouillage
                    verrouiller_client
                    break
                    ;;
                4) #Fonction Mise a jour du système
                    $logs $REPLY Mise a jour du système
                    update_system $choix_user $choix_ordinateur
                    break
                    ;;
                5) #Fonction Creation de repertoire
                    $logs $REPLY Creation de repertoire
                    creer_repertoire
                    break
                    ;;
                6) #Fonction Modification de repertoire
                    $logs $REPLY Modification de repertoire
                    renommer_repertoire
                    break
                    ;;
                7) #Fonction Suppression d'un repertoire
                    $logs $REPLY Suppression d\'un repertoire
                    supprimer_repertoire
                    break
                    ;;
                8) #Fonction Prise de main a distance
                    $logs $REPLY Prise de main a distance
                    accees_cli
                    break
                    ;;
                9) #Fonction Activation du pare-feu
                    $logs $REPLY Activation du pare-feu
                    fw_ena
                    break
                    ;;
                10) #Fonction Désactivation du pare-feu
                    $logs $REPLY Désactivation du pare-feu
                    fw_disa
                    break
                    ;;
                11) #Fonction Installation de logiciel
                    $logs $REPLY Installation de logiciel
                    install_ware
                    break
                    ;;
                12) #Fonction Désinstallation de logiciel
                    $logs $REPLY Désinstallation de logiciel
                    remove_ware
                    break
                    ;;
                13) #Fonction Execution de script sur la machine distante
                    $logs $REPLY Execution de script sur la machine distante
                    script_exec
                    break
                    ;;
                14) #Retour menu précédent
                    $logs Retour menu ordinateur
                    echo "Back to the futur"
                    echo -e "\e[32m-------------------------------------------
Menu ordinateur, que souhaitez-vous faire ?
-------------------------------------------\e[0m"
                    break 2
                    ;;
                *) # Pour tout les autres choix
                    $logs Choix $REPLY incorrect
                    echo -e "\e[31mCe choix n'est pas disponible, merci de saisir un nombre entre 1 et 15.\e[0m"
                    break
                    ;;
            esac
        done
    done
}


#####################################################
# Fonction Arrêt
# Auteur : Ahmed
# 
#####################################################

function arreter_client() {

    $logs Arrêt client
    $sshtarget systemctl poweroff 
}

#####################################################
# Fonction Redémarrage
# Auteur : Ahmed
# 
#####################################################

function redemarrer_client() {

    $logs Redémarage client à distance
    $sshtarget systemctl reboot
}

# Appel de la fonction pour redémarrer l'ordinateur distant

#####################################################
# Fonction Verrouillage
# Auteur : Ahmed
# 
#####################################################

# Fonction pour verrouiller un ordinateur client
function verrouiller_client() {

    $logs Vérrouillage client
    $sshtarget loginctl lock-session $XDG_SESSION_ID

}

#####################################################
# Fonction Mise a jour du système
# Auteur : pierre 
# 
#####################################################
function update_system()
{
    $logs Mise à jour du systeme
    $sshtarget "sudo apt update && sudo apt upgrade"
}


#####################################################
# Fonction Creation de repertoire
# Auteur : Ahmed
# 
#####################################################

function creer_repertoire() {

    $logs début création de répertoire
    
    # Demande du nom du répertoire à créer
    read -p "Entrez le nom du répertoire à créer : " nom_repertoire
    $sshtarget mkdir -p $nom_repertoire
    
    # Vérification si la création du répertoire a réussi
    if $sshtarget [ -d $nom_repertoire ]; then
        echo "Répertoire $nom_repertoire créé avec succès."
        $logs Répertoire $nom_repertoire créé avec succès.
    else
        echo "Échec de la création du répertoire $nom_repertoire."
        $logs Échec lors de la création du répertoire $nom_repertoire
    fi
    
    $logs Fin création de répertoire

}

#####################################################
# Fonction Modification de repertoire
# Auteur : Ahmed
# 
#####################################################

function renommer_repertoire() {
    $logs début renommage du répertoire

    # Demande de l'ancien nom du répertoire
    read -p "Entrez l'ancien nom du répertoire : " ancien_nom

    # Demande du nouveau nom du répertoire
    read -p "Entrez le nouveau nom du répertoire : " nouveau_nom

    # Renommer le répertoire distant
    $sshtarget "mv $ancien_nom $nouveau_nom"

    # Vérification si le répertoire a été renommé avec succès
    if $sshtarget [ -d $nouveau_nom ]; then
        echo "Le répertoire $ancien_nom a été renommé avec succès en $nouveau_nom."
        $logs Répertoire $ancien_nom renommé avec succès en $nouveau_nom.
    else
        echo "Échec du renommage du répertoire '$ancien_nom'."
        $logs Échec du renommage du répertoire $ancien_nom.
    fi

    $logs Fin renommage du répertoire
}

#####################################################
# Fonction Suppression d'un repertoire
# Auteur : Ahmed
# 
#####################################################

function supprimer_repertoire() {
    $logs début suppression de répertoire
    
    # Demande du nom du répertoire à supprimer
    read -p "Entrez le nom du répertoire à supprimer : " nom_repertoire
    $sshtarget "rm -r $nom_repertoire"
    
    # Vérification si la suppression du répertoire a réussi
    if $sshtarget [ -d $nom_repertoire ]; then
        echo "Répertoire $nom_repertoire supprimé avec succès."
        $logs Répertoire $nom_repertoire supprimé avec succès.
    else
        echo "Échec de la suppression du répertoire $nom_repertoire."
        $logs Échec lors de la suppression du répertoire $nom_repertoire
    fi

    $logs Fin suppression de répertoire
}

#####################################################
# Fonction Prise de main a distance
# Auteur : Nico
# 
#####################################################

function accees_cli() {
    $logs Accées a distance en CLI sur $choix_ordinateur
    $sshtarget
    $logs Fin d\'accées a distance en CLI

}

#####################################################
# Fonction Activation du par-feu
# Auteur : Nico
# 
#####################################################

function fw_ena() {
    $logs Activation du par-feu
    $sshtarget "sudo ufw enable"
} 

#####################################################
# Fonction Désactivation du par-feu
# Auteur : Nico
# 
#####################################################

function fw_disa() {

    $logs Désactivation du par-feu
    $sshtarget "sudo ufw disable"
}

#####################################################
# Fonction Installation de logiciel
# Auteur : Nico
# 
#####################################################

function install_ware() {
    read -p "Nom du logiciel à installer avec APT : " ware
    $logs Installation du logiciel $ware
    $sshtarget sudo apt install $ware
    $logs Fin installation du logiciel
}

#####################################################
# Fonction Désinstallation de logiciel
# Auteur : Nico
# 
#####################################################

function remove_ware() {
    read -p "Nom du logiciel à désinstaller : " unware
    $logs Désinstallation du logiciel $unware
    $sshtarget sudo apt remove $unware --purge
    $logs Fin désinstallation du logiciel
}

#####################################################
# Fonction Execution de script sur la machine distante
# Auteur : Nico
# 
#####################################################

function script_exec() {
    read -p "Nom du script a éxécuter : " scpt
    $logs Exécution du script $scpt sur la machine $choix_ordinateur
    $sshtarget bash $scpt
    $logs Fin execution du script
}

echo -e "\e[32m                                __ \e[0m"
echo -e "\e[32m                            ,;.'--'. \e[0m"
echo -e '\e[32m                             /"/=,=( \e[0m'
echo -e "\e[32m                             \(  __/ \e[0m"
echo -e "\e[32m                          ___/    (____ \e[0m"
echo -e "\e[32m                        .'     -  -    '. \e[0m"
echo -e "\e[32m                       /         v       \ \e[0m"
echo -e "\e[32m                    __/    ,     |    \   '-/'_ \e[0m"
echo -e "\e[32m                   {z, ,__/__,__/\__,_ )__(   z} \e[0m"
echo -e "\e[32m                    \>'   (            \_  --c/ \e[0m"
echo -e '\e[32m                       _.- \_      ,   / \_ \e[0m'
echo -e "\e[32m                      (       .______.'    '. \e[0m"
echo -e "\e[32m                       \   ,   \    ( __     ) \e[0m"
echo -e "\e[32m                        \   )-'-\__/-'  |   / \e[0m"
echo -e "\e[32m                         |  |          /  .' \e[0m"
echo -e "\e[32m                        /  ,)         (   \_ \e[0m"
echo -e "\e[32m                       oooO'           '--Ooo  \e[0m"

echo -e "\e[32m                     ___ _   _ _ __ ___   ___  \e[0m"
echo -e '\e[32m                    / __| | | |  _   _ \ / _ \ \e[0m'
echo -e "\e[32m                    \__ \ |_| | | | | | | (_) |\e[0m"
echo -e "\e[32m                    |___/\__,_|_| |_| |_|\___/ \e[0m"


echo -e "\e[32m-----------------------------------------------------------------------
Bonjour, bienvenue dans Sumo, merci d'entrer les identifiants à cibler.
-----------------------------------------------------------------------\e[0m"

#demande la cible
read -p "Quel ordinateur voulez-vous cibler? : " choix_ordinateur
read -p "Quel utilisateur voulez-vous cibler? : " choix_user

$logs Démarrage du script pour $choix_user sur $choix_ordinateur

#Variable pour la connexion SSH

sshtarget="ssh -t $choix_user@$choix_ordinateur"

# Variable nom de fichier pour log d'information
file_log=$HOME/Documents/"Info-$choix_ordinateur-$(date +'%Y%m%d').txt"

# Variable Logger pour le fichier "log_evt.log"
logs="logger -t $0 $choix_user $choix_ordinateur"

#Lancement de la fonction menu pour initialiser le Script Sumo
menu 
