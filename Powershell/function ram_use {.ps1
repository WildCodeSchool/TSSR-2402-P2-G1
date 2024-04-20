function ram_use {
    
    Write-Output "Vérification le l'utilisation de la RAM en cours" >> $info_log
    Invoke-Command -ScriptBlock { Get-ComputerInfo | Select-Object @{Name="RAM disponnible en GB"; Expression={("{0:F2}" -f ($_.OsFreePhysicalMemory / 1MB))}}} -Session $session | Tee-Object $info_log -Append
    
}




