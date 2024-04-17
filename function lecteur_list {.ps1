function lecteur_list {
    # récupérer les lecteurs montés
$drives = Get-PSDrive -PSProvider 'FileSystem'

# inspecte chaque lecteur et afficher les détails
foreach ($drive in $drives) {
    if $drive.Root -and (Test-Path $drive.Root) {
        try { # récupérer les informations pour chaque lecteur
        $driveInfo = Get-Volume -DriveLetter $drive.Name[0] 2>$nul

        # Afficher les informations
        Write-Host "Nom du lecteur: $($drive.Name)"
        Write-Host "Type de lecteur: $($driveInfo.FileSystemType)"
        Write-Host "Espace libre: $($driveInfo.SizeRemaining / 1GB -as [int]) GB"
        Write-Host "Espace total: $($driveInfo.Size / 1GB -as [int]) GB"
    
    } 
    catch {
        Write-Host "Impossible de récupérer les informations pour le lecteur $($drive.Name): $($_.Exception.Message)"
    }
} 
else {
    Write-Host "Le lecteur $($drive.Name) n'est pas accessible ou n'existe pas."
}
}
}


