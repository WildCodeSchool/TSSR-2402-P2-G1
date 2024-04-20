function ram_use {
    
    Write-Output "Vérification le l'utilisation de la RAM en cours" >> $info_log
    Get-ComputerInfo | Select-Object OsFreePhysicalMemory Session $session | Tee-Object $info_log -Append

}




