function Verrouiller-Client () {
    # Adresse IP ou nom d'hôte de l'ordinateur client
    $clientAddress = "adresse_ip_ou_nom_hote"

    # Nom d'utilisateur sur l'ordinateur client
    $username = "utilisateur"

    $session = New-PSSession -ComputerName $clientAddress -Credential $username

    Invoke-Command -Session $session -ScriptBlock {
        # Commande pour verrouiller l'ordinateur
        rundll32.exe user32.dll,LockWorkStation
    }

    # Fermeture de la session PowerShell
    Remove-PSSession $session
}
