#!/bin/bash

while true; do
    echo "Bonjour, bienvenue dans Sumo, comment puis-je vous aider ?"
    echo "1 - Je veux cibler un utilisateur."
    echo "2 - Je veux cibler un ordinateur."
    read -p "Entrez le numéro souhaité: " choiceM1

    case $choiceM1 in
        1)
        while true; do
            echo "Menu utilisateur, que souhaitez-vous faire ?"
            echo "1 - Je veux des information."
            echo "2 - Je veux effectuer une action."
            echo "3 - Je veux retourner au menu précédent."
            read -p "Entrez le numéro souhaité: " choiceMU2
            case $choiceMU2 in
                1)
                echo "1 - Date de dernière connexion"
                echo "2 - Date de la dernière modification du mot de passe"
                echo "3 - Liste des sessions ouvertes par l'utilisateur"
                echo "4 - A quelle groupe appartient l'utilisateur"
                echo "5 - Liste des commandes utiliser par l'utilisateur"
                echo "6 - Droit et permissions de l'utilisateur sur un dossier"
                echo "7 - Droit et permissions de l'utilisateur sur un fichier"
                echo "8 - Recherche des événements dans le fichier log_evt.log pour un utilisateur"
                echo "9 - Retour au menu précédent"
                ;;
                2)
                echo "1 - Changer le mot de passe d'un compte"
                echo "2 - Suppression d'un compte utilisateur"
                echo "3 - Désactivation d'un compte utilisateur local"
                echo "4 - Ajout a un groupe d'administration"
                echo "5 - Ajout a un groupe local"
                echo "6 - Sortie d'un groupe local"
                echo "7 - Retour au menu précédent"
                ;;
                3)
                echo "Back to the futur"
                ;;
                *)
                echo "Ce choix n'est pas disponible, merci de saisir 1, 2 ou 3."
                ;;
            esac
        done
        ;;
        2)
        while true; do
            echo "Menu ordinateur, que souhaitez-vous faire ?"
            echo "1 - Je veux des information."
            echo "2 - Je veux effectuer une action."
            echo "3 - Je veux retourner au menu précédent."
            read -p "Entrez le numéro souhaité: " choiceMO3
                case $choiceMO3 in
                1)
                echo "1 - Version de l'OS"
                echo "2 - Nombre de disque"
                echo "3 - Partition(nombres,nom,FS,taille)"
                echo "4 - Espace disque restant sur par partitions"
                echo "5 - Nom et espace disque d'un dossier(nom de dossier demandé)"
                echo "6 - Liste des lecteurs monté (disque,CD,etc...)"
                echo "7 - Liste des applications/paquets installées"
                echo "8 - Liste des services en cours d'execution"
                echo "9 - Liste des utilisateurs locaux"
                echo "10 - Memoire RAM total"
                echo "11 - Utilisation de la RAM"
                echo "12 - Recherche des événements dans le fichier log_evt.log pour la machine"
                echo "13 - Retour au menu précédent"
                ;;
                2)
                echo "1 - Création d'un compte local"
                echo "2 - Arrêt"
                echo "3 - Redémarrage"
                echo "4 - Verrouillage"
                echo "5 - Mise a jour du système"
                echo "6 - Creation de repertoire"
                echo "7 - Modification de repertoire"
                echo "8 - Suppression d'un repertoire"
                echo "9 - Prise de main a distance"
                echo "10 - Activation du par-feu"
                echo "11 - Désactivation du par-feu"
                echo "12 - Installation de logiciel"
                echo "13 - Désinstallation de logiciel"
                echo "14 - Execution de script sur la machine distante"
                echo "15 - Retour au menu précédent"
                ;;
                3)
                echo "Back to the futur"
                ;;
                *)
                echo "Ce choix n'est pas disponible, merci de saisir 1, 2 ou 3."
                ;;
                esac
            done
        exit 0
        ;;
        *)
        echo "Ce choix n'est pas disponible, merci de saisir 1 ou 2."
        ;;
    esac
done
exit 0
