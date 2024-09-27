function dossSize_use {

    $message = "Affichege de la taille du dossier $doss_name"
    Write-Log
    $session = New-PSSession -ComputerName "172.16.10.20" -Credential "wilder1"
    # Demander à l'utilisateur le chemin du dossier
    $doss_name = Read-Host "Entrez le chemin complet du dossier"
    
        # Vérifier si le dossier existe
        if (Test-Path $doss_name) {
        # Calculer la taille totale du dossier
        Invoke-Command -ScriptBlock { param ($doss_name) Get-ChildItem $doss_name -Recurse | Measure-Object -Property Length -Sum } -argumentlist $doss_name -Session $session
        $dossSizeMB = [math]::Round($dossSize / 1MB, 2) | Tee-Object $info_log -Append# Convertir en Megabytes et arrondir à deux décimales
        Write-Output "Taille du dossier $doss_name " >> $info_log

        # Afficher les résultat
        Write-Host "Espace utilisé: $dossSizeMB MB"
        } 
        else {
            # Message si le chemin n'est pas valide
            Write-Host "Le chemin spécifié n'est pas valide ou n'existe pas."
        }
    }
    