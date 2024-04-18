function Modifier-NomRepertoireDistant () {
  
    $distantAddress = "adresse_ip_ou_nom_hote"

    $username = "utilisateur"

    # Chemin du répertoire à renommer sur l'ordinateur distant
    $chemin = $args[0]

    # Nouveau nom du répertoire
    $nouveauNom = $args[1]

    $session = New-PSSession -ComputerName $distantAddress -Credential $username

  
    Invoke-Command -Session $session -ScriptBlock {
        Rename-Item -Path $using:chemin -NewName $using:nouveauNom
    }

    # Fermeture de la session PowerShell
    Remove-PSSession $session
}
