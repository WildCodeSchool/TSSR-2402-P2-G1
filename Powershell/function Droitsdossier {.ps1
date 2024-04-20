function Droitsdossier {
    
    $droituser = Read-Host "de quel utilisateur verifier les doits sur un dossier "
    $droitdoss = Read-Host "de quel dossier verifier les droits d'un utilisateur chemin complet "

    Write-Output "Droits de l'utilisateur $droituser sur le dossier $droitdoss " >> $info_log
    
    Invoke-Command -ScriptBlock { param ($droitdoss,$droituser) Get-Acl -Path $droitdoss | Select-Object -ExpandProperty Access | Where-Object { $_.IdentityReference -match "$droituser" } } -argumentlist $droitdoss,$droituser -Session $session | Tee-Object $info_log -Append

}
Droitsdossier