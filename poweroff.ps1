# Fonction pour arrêter un ordinateur client
function Arreter-Client () {
    # Adresse IP ou nom d'hôte de l'ordinateur client
    $clientAddress = "adresse_ip_ou_nom_hote"

    # Nom d'utilisateur sur l'ordinateur client
    $username = "utilisateur"

    $session = New-PSSession -ComputerName $clientAddress -Credential $username

  
    Invoke-Command -Session $session -ScriptBlock {
        
        Stop-Computer -Force
    }

    # Fermeture de la session PowerShell
    Remove-PSSession $session
}
