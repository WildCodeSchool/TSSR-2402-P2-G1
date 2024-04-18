function Lastconnexion {

    $message = "Vérification de la derniere connexion de l'utilisateur $lastuser"
    Write-log

    # Demande le nom de l'utilisateur à rechercher
    $lastuser = Read-Host "NomUtilisateur"
    
    # Obtenir les événements de connexion réussie depuis le journal de sécurité
    $loginEvents = Get-WinEvent -FilterHashtable @{LogName='Security'; ID=4624} -MaxEvents 1000
    
    # Recherche la derniere connexion de l'utilisateur
    $lastLogin = $loginEvents | Where-Object { $_.Properties[5].Value -eq $lastuser } | Sort-Object TimeCreated -Descending | Select-Object -First 1
    
    if ($lastLogin) {
    # Affiche la dernière date de connexion
    Write-Output "Dernière connexion de l'utilisateur `$userName`: $($lastLogin.TimeCreated)"
    } else {
    Write-Output "Aucune connexion trouvé pour l'utilisateur `$userName`."
    }

}


# explication du code

#$loginEvents = Get-WinEvent -FilterHashtable @{LogName='Security'; ID=4624} -MaxEvents 1000

# on va chercher sur la machine distante via un filtre dans le journal des evenement de securiter
# l'evenement de type 4624 qui correspond aux connexion reussi on limite la taille à 1000 ligne car le fichier est consequent


#$lastLogin = $loginEvents | Where-Object { $_.Properties[5].Value -eq $userName } | Sort-Object TimeCreated -Descending | Select-Object -First 1


# on passe les donnes de la variable dans le filtre qui va recuperer dans les evenements actuel la valeur de la propriété 5
# qui correspond dans le cas des evenements de type 4624 au nom d'utilisateur associé à l'evenement de connexion
# verifie si la la valeur de cette propriete est egale au nom d'utilisateur indiquer ensuite trie les evenements filtre par date et heures en decroissant
# puis selectionne le premier objet de la liste trier precedement