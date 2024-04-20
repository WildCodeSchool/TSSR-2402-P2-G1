function lecteur_list {

    Write-Output "Liste des lecteurs monter " >> $info_log
    [System.IO.DriveInfo]::GetDrives() Select-Object Name,DriveType | Format-Table -AutoSize Session $session | Tee-Object $info_log -Append

}