function ram_use {

    $message = "Affichage de la RAM utiliser "
    Write-Log
    Write-Output "Vérification le l'utilisation de la RAM en cours" >> $info_log
    Invoke-Command -ScriptBlock { Get-ComputerInfo | Select-Object @{Name="RAM utilisé en GB"; Expression={("{0:F2}" -f ($_.OsFreePhysicalMemory / 1MB))}}} -Session $session | Tee-Object $info_log -Append
    
}




