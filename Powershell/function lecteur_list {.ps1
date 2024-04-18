function lecteur_list {

    $message = "Vérification des lecteurs monté"
    Write-log
    [System.IO.DriveInfo]::GetDrives()
    Select-Object Name,DriveType
    Format-Table -AutoSize
}