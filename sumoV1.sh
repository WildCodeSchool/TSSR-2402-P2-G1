#!/bin/bash
# Branche Nico

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
# Connexion ssh simple
# Auteur : pierre
#   
#######################################

function call_ssh()
{
    ssh -t $1@$2 $3
}
#######################################
# Connexion ssh avec EOF
# Auteur : pierre
#   
#######################################

function call_ssh_EOF()
{
    ssh -t $1@$2
}

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
                    echo "TODO ajout de la fonction date de connexion"
                    break
                    ;;
                2) #Fonction de la date de la dernière modification du mot de passe
                    $logs $REPLY Date de la dernière modification du mot de passe
                    echo "TODO ajout de la fonction de la date de la dernière modification du mot de passe"
                    break
                    ;;
                3) #Fonction de la liste des sessions ouvertes par l'utilisateur
                    $logs $REPLY Liste des sessions ouvertes par l\'utilisateur
                    echo "TODO ajout de la fonction de la liste des sessions ouvertes par l'utilisateur"
                    break
                    ;;
                4) #Fonction de quelle groupe appartient l'utilisateur
                    $logs $REPLY A quelle groupe appartient l\'utilisateur
                    echo "TODO ajout de la fonction de quelle groupe appartient l'utilisateur"
                    break
                    ;;
                5) #Fonction de la liste des commandes utiliser par l'utilisateur
                    $logs $REPLY Liste des commandes utiliser par l\'utilisateur
                    last_cmd
                    break
                    ;;
                6) #Fonction des droit et permissions de l'utilisateur sur un dossier
                    $logs $REPLY Droits et permissions de l\'utilisateur sur un dossier
                    echo "TODO ajout de la fonction des droits et permissions de l'utilisateur sur un dossier"
                    break
                    ;;
                7) #Fonction des droit et permissions de l'utilisateur sur un fichier
                    $logs $REPLY Droits et permissions de l\'utilisateur sur un fichier
                    echo "TODO ajout de la fonction des droit et permissions de l'utilisateur sur un fichier"
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
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Date de la dernière modification du mot de passe 
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Liste des sessions ouvertes par l'utilisateur
# Auteur : Luca
# !!! Work in progress !!!
#####################################################

function last_session() {

    while true;do
        
        #demande de quel utilisateur veut on voir l'historique de session ouverte
        read -p "De quel utilisateur souhaitez-vous voir l'historique de session ouverte ? : " session_name
        
            #verifie l'existance de l'utilisateur indiquer
            if $sshtarget id $session_name &>/dev/null; then
                #si oui affiche le résultat de la commande
                $sshtarget grep "session opened" /var/log/auth.log | grep "$session_name" && $sshtarget grep "session opened" /var/log/auth.log | grep "$session_name" >> $file_log
                #si non affiche "l'utilisateur indiquer n'existe pas "
                break
                
            else
            echo "L'utilisateur indiquer n'existe pas "
            
            fi
    done
}

#####################################################
# Fonction A quelle groupe appartient l'utilisateur
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Liste des commandes utiliser par l'utilisateur
# Auteur : Pierre et Nico
# 
#####################################################

function last_cmd() {
    echo "Liste des dernieres commandes passé par l'utilisateur $user_choice" >> $file_log
    $sshtarget "cat ~/.bash_history" && $sshtarget "cat ~/.bash_history" >> $file_log
}

#####################################################
# Fonction Droit et permissions de l'utilisateur sur un dossier
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Droit et permissions de l'utilisateur sur un fichier
# Auteur : 
# 
#####################################################



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
    $logs début ajout d'utilisateur
    #demande d'ajouter un nom ou plusieurs
    read -p "indiquer le nom du ou des utilisateurs séparé par un espace" -a noms
    
    for nom in "${noms[@]}"; do
        if $sshtarget id "$nom"&>/dev/null; then
            echo "l'utilisateur $nom existe déja"
            $logs echec, l\'utilisateur $nom existe déjà
        else
            $sshtarget sudo useradd "$nom"
            $logs Création de l\'utilisateur $nom
            if $sshtarget id "$nom"&>/dev/null; then
                echo "l'utilisateur $nom à bien été crée"
            else
                echo "erreur de création de l'utilisateur $nom"
                $logs echec lors de la création de l\'utilisateur $nom
            
            fi
        fi
    done
    $logs Fin ajout d\'utilisateur
}

#####################################################
# Fonction Changer le mot de passe d'un compte
# Auteur : Luca
# 
#####################################################

change_pswd() {
        
while true; do
        
        #demande sur quel utilisateur effectuer la modification de mot de passe
        
        #verifie si l'utilisateur existe
        if $sshtarget id "$user_pswd" &>/dev/null; then
        $sshtarget sudo passwd $user_pswd
        break
        
        else
        echo "L'utilisateur $user_pswd n'existe pas"
        
        fi
        
done
}    

#####################################################
# Fonction Suppression d'un compte utilisateur
# Auteur : Luca
# 
#####################################################

del_user() {

    while true; do
        #demande quel utilisateur supprimer"
        read -p "Indiquer le nom de l'utilisateur a supprimer : " user_del

        #vérifie l'existance de l'utilisateur si oui demande la confirmation de suppression
        if $sshtarget id "$user_del" &>/dev/null; then
            read -p "Voulez-vous supprimer l'utilisateur $user_del ? o/n : " verif_del
        
                #si la réponse est "o" supprime l'utilisteur
                if [[ $verif_del = "o" ]]; then
                $sshtarget sudo userdel $user_del

                    #verifie si l'utilisateur a bien été supprimer
                    if $sshtarget id "$user_del" &>/dev/null; then
                    echo "Erreur l'utilisateur n'a pas été supprimé"
                    
                    else
                    echo "L'utilisateur $user_del a bien été supprimé"
                
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

}  

#####################################################
# Fonction Désactivation d'un compte utilisateur local
# Auteur : Luca
# 
#####################################################

shut_user() {


    while true; do

        #demande quel utilisateur désactiver"
        read -p "Indiquer le nom de l'utilisateur a désactiver : " user_shut

        #vérifie l'existance de l'utilisateur si oui demande la confirmation de desactivation
        if $sshtarget id "$user_shut" &>/dev/null; then
        read -p "Voulez-vous désactiver l'utilisateur $user_shut ? o/n : " verif_shut
        
                #si la réponse est "o" désactive le compte de l'utilisteur
                if [[ $verif_shut = "o" ]]; then
                $sshtarget sudo usermod --expiredate 1 $user_shut &>/dev/null

                    #vérifie si l'utilisateur a bien été désactiver
                    if [ "$?" == 0 ]; then
                    echo "L'utilisateur a bien été supprimé"
                    break

                    fi
                #si la réponse est "n" affiche un message
                else
                echo "Suppression annulé"
                break

                fi

        else
        echo "L'utilisateur n'existe pas"
    
        fi

    done

}  

#####################################################
# Fonction Ajout a un groupe d'administration
# Auteur : Luca
# 
#####################################################

admin_grp() {

while true; do

    # demander quel utilisateur ajouter"
    read -p "Quel utlisateur voulez-vous ajouter au groupe administration ? : " grp_admin
        #verifie l'existance de l'utilisateur
        if $sshtarget id "$grp_admin" &>/dev/null; then

            #si oui demande confirtmation d'ajout au groupe sudo
            read -p "Voulez-vous ajouter $grp_admin au groupe sudo ? o/n :" verif_admin

                #si oui ajoute au groupe sudo
                if [[ $verif_admin == "o" ]]; then
                    $sshtarget sudo usermod -aG sudo "$grp_admin" &>/dev/null

                        #verifie si le l'utilisateur a bien été integré au groupe sudo
                        if $sshtarget id $grp_admin | grep -qw 'sudo'; then
                            #si oui affiche l'utilisateur a été ajouté avec succes
                            echo "l'utilisateur a été ajouter avec succes"
                            break
                        else
                            echo "L'ajout de l'utilisateur au groupe administration a échoué"

                        fi
                    #si non affiche annulation d'ajout au groupe administrateur
                else
                    echo "Ajout au groupe administration annulé"
                    
                fi
        else
            echo "L'utilisateur $grp_admin n'existe pas"
        fi
done
}

#####################################################
# Fonction Ajout a un groupe local
# Auteur : Luca
# 
#####################################################

function add_grp() {

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
                $sshtarget sudo usermod -aG "$grp_name" "$grp_add"
                
                # Vérifie si l'utilisateur a bien été ajouté au groupe
                if $sshtarget id -nG "$grp_add" | grep -qw "$grp_name"; then
                    # Si oui, affiche un message de validation
                    echo "L'utilisateur $grp_add a bien été ajouté au groupe $grp_name."
                    exit 0
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


#####################################################
# Fonction Sortie d'un groupe local
# Auteur : Luca
# 
#####################################################

function del_grp() {

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
                if $sshtarget id -nG "$grp_del" | grep -qw "$grp_verif" &>/dev/null; then
                    
                    # Si oui, supprime l'utilisateur du groupe
                    $sshtarget sudo gpasswd -d "$grp_del" "$grp_verif" &>/dev/null
                    
                    # Vérifie si l'utilisateur a bien été supprimer du groupe
                    if $sshtarget ! id -nG "$grp_del" | grep -qw "$grp_verif" &>/dev/null; then
                        
                        # Si oui, affiche un message de validation
                        echo "L'utilisateur $grp_del a bien été supprimé du groupe $grp_verif."
                        break
                    else
                        # Si non, affiche un message d'erreur
                        echo "Erreur lors de la suppression du groupe $grp_verif."
                    fi 
                    
                else
                echo "L'utilisateur ne fait pas partie de ce groupe"
                fi
            else
                echo "Le groupe indiqué n'existe pas."
            fi
        else
            echo "L'utilisateur indiqué n'existe pas."
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
                    echo "TODO ajout de la fonction partition"
                    break
                    ;;
                4) #Fonction espace disque restant par partitions
                    $logs $REPLY Espace disque restant par partitions
                    echo "TODO ajout de la fonction espace disque restant par partitions"
                    break
                    ;;
                5) #Fonction nom et espace disque d'un dossier
                    $logs $REPLY Nom et espace disque d\'un dossier
                    echo "TODO ajout de la fonction nom et espace disque d'un dossier"
                    break
                    ;;
                6) #Fonction liste des lecteurs monté
                    $logs $REPLY Liste des lecteurs monté
                    echo "TODO ajout de la fonction liste des lecteurs monté"
                    break
                    ;;
                7) #Fonction liste des applications/paquets installées
                    $logs $REPLY Liste des applications/paquets installées
                    echo "TODO ajout de la fonction liste des applications/paquets installées"
                    break
                    ;;
                8) #Fonction liste des services en cours d'execution
                    $logs $REPLY Liste des services en cours d\'execution
                    echo "TODO ajout de la fonction liste des services en cours d'execution"
                    break
                    ;;
                9) #Fonction liste des utilisateurs locaux
                    $logs $REPLY Liste des utilisateurs locaux
                    echo "TODO ajout de la fonction liste des utilisateurs locaux"
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
    echo "Version de l'OS:" >> $file_log
    $sshtarget "lsb_release -a" && $sshtarget "lsb_release -a" >> $file_log
}

#####################################################
# Fonction Nombre de disque
# Auteur : Nico
# 
#####################################################

function nbDsk() {
    echo "Nombre de disque:" >> $file_log
    $sshtarget "lsblk | grep disk | wc -l" && $sshtarget "lsblk | grep disk | wc -l" >> $file_log
}

#####################################################
# Fonction Partition(nombres,nom,FS,taille)
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Espace disque restant sur par partitions
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Nom et espace disque d'un dossier(nom de dossier demandé)
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Liste des lecteurs monté (disque,CD,etc...)
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Liste des applications/paquets installées
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Liste des services en cours d'execution
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Liste des utilisateurs locaux
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Memoire RAM total
# Auteur : pierre 
# 
#####################################################

function ram_total() {
    echo "RAM Totale présente sur le poste:" >> $file_log
    $sshtarget free -h | grep 'Mem' | awk '{print $2}' && $sshtarget free -h | grep 'Mem' | awk '{print $2}' >> $file_log
}
#function ram_total()
#{
#call_ssh_EOF $1 $2 <<-"EOF"
#    ram=$(free)
#    ram=$(echo $ram | cut -d' ' -f8)
#    echo $ram
#EOF
#}


#####################################################
# Fonction Utilisation de la RAM
# Auteur :pierre 
# 
#####################################################

function ram_use() {
echo "RAM utilisé sur le poste:" >> $file_log
$sshtarget free -h | grep 'Mem' | awk '{print $3}' && $sshtarget free -h | grep 'Mem' | awk '{print $3}' >> $file_log

}
#function ram_use()
#{
#call_ssh_EOF $1 $2 <<-"EOF"
#        ram=$(free)
#        ram=$(echo $ram | cut -d' ' -f9)
#        echo $ram
#EOF
#}


#####################################################
# Fonction Recherche des événements dans le fichier log_evt.log pour la machine
# Auteur : 
# 
#####################################################

function computer_log() {
    $logs Consultation du fichier evt_log.log pour utlisateur
    journalctl | grep $0 >> /var/log/log_evt.log
    read -p "Consultation du fichier evt_log.log pour quel utilisateur : " evtclog
    echo "Extrait du journal evt_log.log pour l'utilisateur $evtclog" >> $file_log
    cat /var/log/log_evt.log | grep $evtclog && cat /var/log/log_evt.log | grep $evtclog >> $file_log
    $logs Fin de consultation du fichier evt_log.log pour utilisateur
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
                    echo "TODO ajout de la fonction Creation de repertoire"
                    break
                    ;;
                6) #Fonction Modification de repertoire
                    $logs $REPLY Modification de repertoire
                    echo "TODO ajout de la fonction Modification de repertoire"
                    break
                    ;;
                7) #Fonction Suppression d'un repertoire
                    $logs $REPLY Suppression d\'un repertoire
                    echo "TODO ajout de la fonction Suppression d'un repertoire"
                    break
                    ;;
                8) #Fonction Prise de main a distance
                    $logs $REPLY Prise de main a distance
                    echo "TODO ajout de la fonction Prise de main a distance"
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
                    echo "TODO ajout de la fonction Installation de logiciel"
                    break
                    ;;
                12) #Fonction Désinstallation de logiciel
                    $logs $REPLY Désinstallation de logiciel
                    echo "TODO ajout de la fonction Désinstallation de logiciel"
                    break
                    ;;
                13) #Fonction Execution de script sur la machine distante
                    $logs $REPLY Execution de script sur la machine distante
                    echo "TODO ajout de la fonction Execution de script sur la machine distante"
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
    # Adresse IP ou nom d'hôte de l'ordinateur client
    client_address="adresse_ip_ou_nom_hote"

    # Nom d'utilisateur sur l'ordinateur client
    username="utilisateur"

    # Utilisation de la commande ssh pour se connecter à l'ordinateur client et l'arrêter
    $sshtarget sudo poweroff
}

#####################################################
# Fonction Redémarrage
# Auteur : Ahmed
# 
#####################################################

function redemarrer_client() {

    # Utilisation de la commande ssh pour redémarrer l'ordinateur distant
    $sshtarget sudo reboot
}

# Appel de la fonction pour redémarrer l'ordinateur distant

#####################################################
# Fonction Verrouillage
# Auteur : Ahmed
# 
#####################################################

# Fonction pour verrouiller un ordinateur client
function verrouiller_client() {

    # Utilisation de la commande ssh pour se connecter à l'ordinateur client et verrouiller l'écran
    $sshtarget loginctl lock-session

}

#####################################################
# Fonction Mise a jour du système
# Auteur : pierre 
# 
#####################################################
function update_system()
{
    call_ssh $1 $2 "sudo apt update && sudo apt upgrade"
}


#####################################################
# Fonction Creation de repertoire
# Auteur : Ahmed
# 
#####################################################



#####################################################
# Fonction Modification de repertoire
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Suppression d'un repertoire
# Auteur : Ahmed
# 
#####################################################



#####################################################
# Fonction Prise de main a distance
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Activation du par-feu
# Auteur : Nico
# 
#####################################################

function fw_ena() {
    $sshtarget "sudo ufw enable"
} 

#####################################################
# Fonction Désactivation du par-feu
# Auteur : Nico
# 
#####################################################

function fw_disa() {
    $sshtarget "sudo ufw disable"
}

#####################################################
# Fonction Installation de logiciel
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Désinstallation de logiciel
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Execution de script sur la machine distante
# Auteur : 
# 
#####################################################

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