function Filedroit {
    
    $message = "Vérifie les droits de l'utilisateur $fileuser pour le fichier $droitfile"
    Write-log

    $fileuser = Read-Host "de quel utilisateur verifier les doits sur un fichier "
    $droitfile = Read-Host "de quel fichier verifier les droits d'un utilisateur chemin complet "
    $acl = Get-Acl -Path $droitfile
    $acl.Access | Where-Object { $_.IdentityReference -like "*$droitfile*" }
    
}
