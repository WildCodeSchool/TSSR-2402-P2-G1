function sesionactive {
    
    Write-Output "Liste des session actives" >> $info_log
    Invoke-Command query session Session $seesion | Tee-Object $info_log -Append
    
}