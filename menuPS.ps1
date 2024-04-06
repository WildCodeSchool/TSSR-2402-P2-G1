####################################################################
#  Nom du Projet : System for Unified Master Operating aka SUMO
#  Script en PowerShell pour Windows
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

# Fonction pour afficher le menu
function Menu {
    Write-Host "    ----------------------------------------------------------
    Bonjour, bienvenue dans Sumo, comment puis-je vous aider ?
    ----------------------------------------------------------
    "
    Write-Host "1. Je veux cibler l'utilisateur."
    Write-Host "2. Je veux cibler l'ordinateur."
    Write-Host "Q. Je veux sortir du script."
}

# Fonction pour aller dans le menu sélectionnée
function menu_options {
    while ($true) {
        Menu
        $choiceM = Read-Host "Entrez le numero souhaite"
        switch ($choiceM) {
            '1' {
                #Choix Utilisateur
                User_Menu_options
            }
            '2' {
                #Choix ordinateur
                Write-Host " "
                # Ajoutez ici le code à exécuter pour l'Option 2
            }
            'q' {
                Clear-Host
                Write-Host "Sumo vous remercie d'avoir fait appel a ses services."
                Exit
            }
            default {
                Write-Host "Choix invalide. Veuillez selectionner une option valide."
            }
        }
    }
}

#######################################
# Affiche le sous-menu utilisateurs.
# Auteur : Nico
# 
#######################################

# Fonction afficher le sous-menu utilisateurs.
function User_Menu {
    Write-Host "    --------------------------------------------------
    Menu utilisateur, que souhaitez-vous faire ?
    --------------------------------------------------
    "
    Write-Host "1. Je veux des information."
    Write-Host "2. Je veux effectuer une action."
    Write-Host "R. Je veux retourner au menu precedent."
}

# Fonction pour aller dans les options du sous-menu utilisateurs.
function User_Menu_options {
    while ($true) {
        User_Menu
        $choiceUM = Read-Host "Entrez le numero souhaite: "
        switch ($choiceUM) {
            '1' {
                #Choix information
                Write-Host " "
                User_Menu_info_options
            }
            '2' {
                #Choix Action
                Write-Host " "
                User_Menu_Action_options
            }
            'r' {
                Write-Host "Back to the futur."
                return
            }
            default {
                Write-Host "Ce choix n'est pas disponible, merci de saisir 1, 2 ou R."
            }
        }
    }
}


#####################################################
# Affiche le sous-menu d'info sur les utilisateurs.
# Auteur : Nico
# 
#####################################################

# Fonction afficher le sous-menu d'info sur les utilisateurs
function User_Menu_info {
    Write-Host "    --------------------------------------------------------------
    Menu informartion de l'utilisateur, que souhaitez-vous faire ?
    --------------------------------------------------------------
    "
    Write-Host "1. Date de derniere connexion"
    Write-Host "2. Date de la derniere modification du mot de passe"
    Write-Host "3. Liste des sessions ouvertes par l'utilisateur"
    Write-Host "4. A quelle groupe appartient l'utilisateur"
    Write-Host "5. Liste des commandes utiliser par l'utilisateur"
    Write-Host "6. Droit et permissions de l'utilisateur sur un dossier"
    Write-Host "7. Droit et permissions de l'utilisateur sur un fichier"
    Write-Host "8. Recherche des evenements dans le fichier log_evt.log pour un utilisateur"
    Write-Host "R. Retour au menu precedent"
}

# Fonction pour aller dans les options du sous-menu info utilisateurs.
function User_Menu_info_options {
    while ($true) {
        User_Menu_info
        $choiceUMI = Read-Host "Entrez le numero souhaite"
        switch ($choiceUMI) {
            '1' {
                #Fonction Date de dernière connexion
                Write-Host "TODO faire fonction Date de dernière connexion"
            }
            '2' {
                #Fonction Date de la dernière modification du mot de passe
                Write-Host "TODO faire fonction Date de la dernière modification du mot de passe"
            }
            '3' {
                #Fonction Liste des sessions ouvertes par l'utilisateur
                Write-Host "TODO faire fonction Liste des sessions ouvertes par l'utilisateur"
            }
            '4' {
                #Fonction A quelle groupe appartient l'utilisateur
                Write-Host "TODO faire fonction A quelle groupe appartient l'utilisateur"
            }
            '5' {
                #Fonction Liste des commandes utiliser par l'utilisateur
                Write-Host "TODO faire fonction Liste des commandes utiliser par l'utilisateur"
            }
            '6' {
                #Fonction Droit et permissions de l'utilisateur sur un dossier
                Write-Host "TODO faire fonction Droit et permissions de l'utilisateur sur un dossier"
            }
            '7' {
                #Fonction Droit et permissions de l'utilisateur sur un fichier
                Write-Host "TODO faire fonction Droit et permissions de l'utilisateur sur un fichier"
            }
            '8' {
                #Fonction Recherche des événements dans le fichier log_evt.log pour un utilisateur
                Write-Host "TODO faire fonction Recherche des événements dans le fichier log_evt.log pour un utilisateur"
            }
            'r' {
                #Retour au menu précédent
                Write-Host "Back to the futur."
                return 
            }
            Default {
                Write-Host "Ce choix n'est pas disponible, merci de saisir un chiffre entre 1 et 8 ou R." 
            }
        }
    }   
}

#####################################################
# Affiche le sous-menu d'action sur les utilisateurs.
# Auteur : Nico
# 
#####################################################

# Fonction afficher le sous-menu d'action sur les utilisateurs
function User_Menu_Action {
    Write-Host "    --------------------------------------------------------------
    Menu action de l'utilisateur, que souhaitez-vous faire ?
    --------------------------------------------------------------
    "
    Write-Host "1. Creation d'un compte local"
    Write-Host "2. Changer le mot de passe d'un compte"
    Write-Host "3. Suppression d'un compte utilisateur"
    Write-Host "4. Desactivation d'un compte utilisateur local"
    Write-Host "5. Ajout a un groupe d'administration"
    Write-Host "6. Ajout a un groupe local"
    Write-Host "7. Sortie d'un groupe local"
    Write-Host "R. Retour au menu precedent"
}

# Fonction pour aller dans les options du sous-menu info utilisateurs.
function User_Menu_Action_options {
    while ($true) {
        User_Menu_Action
        $choiceUMA = Read-Host "Entrez le numero souhaite"
        switch ($choiceUMA) {
            '1' {
                #Fonction Création d'un compte local
                Write-Host "TODO faire la fonction Création d'un compte local"
            }
            '2' {
                #Fonction Changer le mot de passe d'un compte
                Write-Host "TODO faire la fonction Changer le mot de passe d'un compte"
            }
            '3' {
                #Fonction Suppression d'un compte utilisateur
                Write-Host "TODO faire la fonction Suppression d'un compte utilisateur"
            }
            '4' {
                #Fonction Désactivation d'un compte utilisateur local
                Write-Host "TODO faire la fonction Désactivation d'un compte utilisateur local"
            }
            '5' {
                #Fonction Ajout a un groupe d'administration
                Write-Host "TODO faire la fonction Ajout a un groupe d'administration"
            }
            '6' {
                #Fonction Ajout a un groupe local
                Write-Host "TODO faire la fonction Ajout a un groupe local"
            }
            '7' {
                #Fonction Sortie d'un groupe local
                Write-Host "TODO faire la fonction Sortie d'un groupe local"
            }
            'r' {
                #Retour au menu précédent
                Write-Host "Back to the futur."
                return 
            }
            Default {
                Write-Host "Ce choix n'est pas disponible, merci de saisir un chiffre entre 1 et 7 ou R." 
            }
        }     
    }

}









menu_options
