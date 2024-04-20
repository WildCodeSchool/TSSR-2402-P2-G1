function Filedroit {

    $fileuser = Read-Host "de quel utilisateur verifier les doits sur un fichier "
    $droitfile = Read-Host "de quel fichier verifier les droits d'un utilisateur chemin complet "
    
    Write-Output "Droits de l'utilisateur $fileuser sur le dossier $droitfile " >> $info_log

    Invoke-Command -ScriptBlock { param ($droitfile,$fileuser) Get-Acl -Path $droitfile | Where-Object { $_.IdentityReference -like "*$droitfile*" } } -argumentlist $droitfile,$fileuser -Session $session | Tee-Object $info_log -Append
    
}
