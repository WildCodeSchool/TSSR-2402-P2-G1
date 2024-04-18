function Droitsdossier {
    
    $message = "Vérification des droits du dossier $droitdoss pour l'utilisateur $droituser"
    Write-log

    $droituser = Read-Host "de quel utilisateur verifier les doits sur un dossier "
    $droitdoss = Read-Host "de quel dossier verifier les droits d'un utilisateur chemin complet "
    $acl = Get-Acl -Path $droitdoss
    $acl.Access | Where-Object { $_.IdentityReference -like "*$droituser*" }
}