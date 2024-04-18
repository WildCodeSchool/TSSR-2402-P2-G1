function ram_use {
    
    $message = "Vérification de la RAM en cours d'utilisation"
    Write-log
    Get-ComputerInfo | Select-Object OsFreePhysicalMemory
}




