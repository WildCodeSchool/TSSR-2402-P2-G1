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

function Menu {
    while ($true) {
        Write-Host "    ----------------------------------------------------------
    Bonjour, bienvenue dans Sumo, comment puis-je vous aider ?
    ----------------------------------------------------------
    "
        Write-Host "1. Je veux cibler l'utilisateur."
        Write-Host "2. Je veux cibler l'ordinateur."
        Write-Host "Q. Je veux sortir du script.
        "
        $choiceM = Read-Host "Entrez le numero souhaite"
        # Redirection des choix 
        switch ($choiceM) {
            '1' {
                #Choix Utilisateur
                User_Menu
            }
            '2' {
                #Choix ordinateur
                Write-Host " "
                Computer_Menu
            }
            'q' {
                Clear-Host
                Write-Host "Sumo vous remercie d'avoir fait appel a ses services."
                Exit
            }
            default {
                Write-Host "Choix invalide. Veuillez selectionner une option valide.
                "
            }
        }
    }
}

#######################################
# Affiche le sous-menu utilisateurs.
# Auteur : Nico
# 
#######################################

function User_Menu {
    while ($true) {
        Write-Host "    --------------------------------------------------
    Menu utilisateur, que souhaitez-vous faire ?
    --------------------------------------------------
            "
        Write-Host "1. Je veux des information."
        Write-Host "2. Je veux effectuer une action."
        Write-Host "R. Je veux retourner au menu precedent.
        "
        $choiceUM = Read-Host "Entrez le numero souhaite: "
        # Redirection des choix 
        switch ($choiceUM) {
            '1' {
                #Choix information
                Write-Host " "
                User_Menu_info
            }
            '2' {
                #Choix Action
                Write-Host " "
                User_Menu_Action
            }
            'r' {
                Write-Host "Back to the futur."
                return
            }
            default {
                Write-Host "Ce choix n'est pas disponible, merci de saisir 1, 2 ou R.
                "
            }
        }
    }
}

#####################################################
# Affiche le sous-menu d'info sur les utilisateurs.
# Auteur : Nico
# 
#####################################################

function User_Menu_info {
    while ($true) {
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
        Write-Host "R. Retour au menu precedent
        "
        $choiceUMI = Read-Host "Entrez le numero souhaite"
        # Redirection des choix 
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
                Write-Host "Ce choix n'est pas disponible, merci de saisir un chiffre entre 1 et 8 ou R.
                " 
            }
        }
    }   
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
# Auteur : 
# 
#####################################################



#####################################################
# Fonction A quelle groupe appartient l'utilisateur
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Liste des commandes utiliser par l'utilisateur
# Auteur : Nico
#  !!! a reprendre !!!
#####################################################

Invoke-Command -ScriptBlock { Get-Command } -Session $session

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
# Auteur : 
# 
#####################################################



#####################################################
# Affiche le sous-menu d'action sur les utilisateurs.
# Auteur : Nico
# 
#####################################################

function User_Menu_Action {
    while ($true) {
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
        Write-Host "R. Retour au menu precedent
        "
        $choiceUMA = Read-Host "Entrez le numero souhaite"
        # Redirection des choix 
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
                Write-Host "Ce choix n'est pas disponible, merci de saisir un chiffre entre 1 et 7 ou R.
                " 
            }
        }     
    }

}

#####################################################
# Fonction Création d'un compte local
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Changer le mot de passe d'un compte
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Suppression d'un compte utilisateur
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Désactivation d'un compte utilisateur local
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Ajout a un groupe d'administration
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Ajout a un groupe local
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Sortie d'un groupe local
# Auteur : 
# 
#####################################################



#######################################
# Affiche le sous-menu ordinateur.
# Auteur : Nico
# 
#######################################

function Computer_Menu {
    while ($true) {
        Write-Host "    --------------------------------------------------
    Menu ordinateur, que souhaitez-vous faire ?
    --------------------------------------------------
    "
        Write-Host "1. Je veux des information."
        Write-Host "2. Je veux effectuer une action."
        Write-Host "R. Je veux retourner au menu precedent.
        "
        $choiceCM = Read-Host "Entrez le numero souhaite"
        # Redirection des choix 
        switch ($choiceCM) {
            '1' {
                #Choix information
                Write-Host " "
                Computer_Menu_Info
            }
            '2' {
                #Choix Action
                Write-Host " "
                Computer_Menu_Action
            }
            'r' {
                #Retour au menu précédent
                Write-Host "Back to the futur."
                return
            }
            default {
                Write-Host "Ce choix n'est pas disponible, merci de saisir 1, 2 ou R.
                "
            }
        }
    }
}

#####################################################
# Affiche le sous-menu d'info sur les ordinateurs.
# Auteur : Nico
# 
#####################################################

function Computer_Menu_Info {
    
    Write-Host "    --------------------------------------------------------------
    Menu action de l'utilisateur, que souhaitez-vous faire ?
    --------------------------------------------------------------
    "
    Write-Host "1. Version de l'OS"
    Write-Host "2. Nombre de disque"
    Write-Host "3. Partition(nombres,nom,FS,taille)"
    Write-Host "4. Espace disque restant sur par partitions"
    Write-Host "5. Nom et espace disque d'un dossier(nom de dossier demande)"
    Write-Host "6. Liste des lecteurs monte (disque,CD,etc...)"
    Write-Host "7. Liste des applications/paquets installees"
    Write-Host "8. Liste des services en cours d'execution"
    Write-Host "9. Liste des utilisateurs locaux"
    Write-Host "10. Memoire RAM total"
    Write-Host "11. Utilisation de la RAM"
    Write-Host "12. Recherche des événements dans le fichier log_evt.log pour la machine"
    Write-Host "R. Retour au menu precedent
    "

    $choiceCMI = Read-Host "Entrez le numero souhaite"
    # Redirection des choix 
    switch ($choiceCMI) {
        '1' {
            #Fonction Version de l'OS
            Write-Host "TODO faire fonction Version de l'OS"
        }
        '2' {
            #Fonction Nombre de disque
            Write-Host "TODO faire fonction Nombre de disque"
        }
        '3' {
            #Fonction 
            Write-Host "TODO faire fonction "
        }
        '4' {
            #Fonction Partition(nombres,nom,FS,taille)
            Write-Host "TODO faire fonction Partition(nombres,nom,FS,taille)"
        }
        '5' {
            #Fonction Espace disque restant sur par partitions
            Write-Host "TODO faire fonction Espace disque restant sur par partitions"
        }
        '6' {
            #Fonction Nom et espace disque d'un dossier(nom de dossier demande)
            Write-Host "TODO faire fonction Nom et espace disque d'un dossier(nom de dossier demande)"
        }
        '7' {
            #Fonction Liste des lecteurs monte (disque,CD,etc...)
            Write-Host "TODO faire fonction Liste des lecteurs monte (disque,CD,etc...)"
        }
        '8' {
            #Fonction Liste des applications/paquets installees
            Write-Host "TODO faire fonction Liste des applications/paquets installees"
        }
        '9' {
            #Fonction Liste des services en cours d'execution
            Write-Host "TODO faire fonction Liste des services en cours d'execution"
        }
        '10' {
            #Fonction Liste des utilisateurs locaux
            Write-Host "TODO faire fonction Liste des utilisateurs locaux"
        }
        '11' {
            #Fonction Memoire RAM total
            Write-Host "TODO faire fonction Memoire RAM total"
        }
        '12' {
            #Fonction Utilisation de la RAM
            Write-Host "TODO faire fonction Utilisation de la RAM"
        }
        '13' {
            #Fonction Recherche des événements dans le fichier log_evt.log pour la machine
            Write-Host "TODO faire fonction Recherche des événements dans le fichier log_evt.log pour la machine"
        }
        'R' {
            #Fonction Retour au menu precedent
            Write-Host "Back to the futur."
            return
        }
        Default { 
            Write-Host "Ce choix n'est pas disponible, merci de saisir un chiffre entre 1 et 12 ou R.
            "
        }
    }
}

#####################################################
# Fonction Version de l'OS
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Nombre de disque
# Auteur : 
# 
#####################################################

Invoke-Command -ScriptBlock { Get-Disk } -Session $session

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

Invoke-Command -ScriptBlock { Get-WmiObject -Class Win32_LogicalDisk | 
    Select-Object -Property DeviceID, VolumeName, @{
        label      = 'FreeSpace'
        expression = { ($_.FreeSpace / 1GB).ToString('F2') }
    } } -Session $session

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
# Auteur :  
# 
#####################################################



#####################################################
# Fonction Utilisation de la RAM
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Recherche des événements dans le fichier log_evt.log pour la machine
# Auteur : 
# 
#####################################################



#####################################################
# Affiche le sous-menu d'action sur les ordinateurs.
# Auteur : Nico
# 
#####################################################

function Computer_Menu_Action {
    while ($true) {
        #Affichage du menu Action Ordinateur
        Write-Host "    -------------------------------------------------------
        Menu action de l'ordinateur, que souhaitez-vous faire ?
        -------------------------------------------------------
        "
        Write-Host "1. Arret"
        Write-Host "2. Redemarrage"
        Write-Host "3. Verrouillage"
        Write-Host "4. Mise a jour du systeme"
        Write-Host "5. Creation de repertoire"
        Write-Host "6. Modification de repertoire"
        Write-Host "7. Suppression d'un repertoire"
        Write-Host "8. Prise de main a distance"
        Write-Host "9. Activation du pare-feu"
        Write-Host "10. Désactivation du pare-feu"
        Write-Host "11. Installation de logiciel"
        Write-Host "12. Désinstallation de logiciel"
        Write-Host "13. Execution de script sur la machine distante"
        Write-Host "R. Retour au menu précédent
        "

        $choiceCMA = Read-Host "Entrez le numero souhaite"
        # Redirection des choix 
        switch ($choiceCMA) {
            '1' {
                #Fonction Arret
                Write-Host "TODO faire la fonction Arret"
            }
            '2' {
                #Fonction Redemarrage
                Write-Host "TODO faire la fonction Redemarrage"
            }
            '3' {
                #Fonction Verrouillage
                Write-Host "TODO faire la fonction Verrouillage"
            }
            '4' {
                #Fonction Mise a jour du systeme
                Write-Host "TODO faire la fonction Mise a jour du systeme"
            }
            '5' {
                #Fonction Creation de repertoire
                Write-Host "TODO faire la fonction Creation de repertoire"
            }
            '6' {
                #Fonction Modification de repertoire
                Write-Host "TODO faire la fonction Modification de repertoire"
            }
            '7' {
                #Fonction Suppression d'un repertoire
                Write-Host "TODO faire la fonction Suppression d'un repertoire"
            }
            '8' {
                #Fonction Prise de main a distance
                Write-Host "TODO faire la fonction Prise de main a distance"
            }
            '9' {
                #Fonction Activation du pare-feu
                Set-NetFirewallProfile -profile * -Enabled true
            }
            '10' {
                #Fonction Désactivation du pare-feu
                Set-NetFirewallProfile -profile * -Enabled False
            }
            '11' {
                #Fonction Installation de logiciel
                Write-Host "TODO faire la fonction Installation de logiciel"
            }
            '12' {
                #Fonction Désinstallation de logiciel
                Write-Host "TODO faire la fonction Désinstallation de logiciel"
            }
            '13' {
                #Fonction Execution de script sur la machine distante
                Write-Host "TODO faire la fonction Execution de script sur la machine distante"
            }
            'R' {
                #Fonction Retour au menu precedent
                Write-Host "Back to the futur."
                return
            }
            Default { 
                Write-Host "Ce choix n'est pas disponible, merci de saisir un chiffre entre 1 et 13 ou R.
                "
            }
        }
    }
}

#####################################################
# Fonction Arrêt
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Redémarrage
# Auteur : 
# 
#####################################################

Invoke-Command -ScriptBlock { Restart-Computer -force } -Session $session

#####################################################
# Fonction Verrouillage
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Mise a jour du système
# Auteur :  
#  !!! Faire des conditions pour l'installation de pswindowsupdate !!!
#####################################################

Invoke-Command -ScriptBlock { Install-WindowsUpdate } -Session $session

#####################################################
# Fonction Creation de repertoire
# Auteur : 
# 
#####################################################

Invoke-Command -ScriptBlock { New-Item -ItemType Directory "titi" } -Session $session

#####################################################
# Fonction Modification de repertoire
# Auteur : 
# 
#####################################################



#####################################################
# Fonction Suppression d'un repertoire
# Auteur : 
# 
#####################################################

Invoke-Command -ScriptBlock { Remove-Item "toto" } -Session $session

#####################################################
# Fonction Prise de main a distance
# Auteur : 
# 
#####################################################

Enter-PSSession $session

#####################################################
# Fonction Activation du pare-feu
# Auteur : 
# 
#####################################################

Invoke-Command -ScriptBlock { Set-NetFirewallProfile -profile * -Enabled True } -Session $session

#####################################################
# Fonction Désactivation du par-feu
# Auteur : 
# 
#####################################################

Invoke-Command -ScriptBlock { Set-NetFirewallProfile -profile * -Enabled False } -Session $session

#####################################################
# Fonction Installation de logiciel
# Auteur : 
# 
#####################################################

Invoke-Command -ScriptBlock { Install-Package -name pswindowsupdate -source psgallery } -Session $session

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


$session = New-PSSession -ComputerName 172.16.10.20 -Credential "wilder\Azerty1*"


Menu
