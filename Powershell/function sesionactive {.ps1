function sesionactive {

    $session = New-PSSession -ComputerName "172.16.10.20" -Credential "wilder"
    Write-Output "Liste des session actives" >> $info_log
    Invoke-Command { query session } -Session $session | Tee-Object $info_log -Append
    
}
