function lecteur_list {
    [System.IO.DriveInfo]::GetDrives()
    Select-Object Name,DriveType
    Format-Table -AutoSize
}