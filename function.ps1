#fonction pour avoir la ram total

function ram_total()
{
    Get-WmiObject Win32_PhysicalMemory | Format-Table capacity
}
#fonction pour avoir la version de l'OS
function os_version()
{
    Get-WmiObject Win32_OperatingSystem | Format-Table Version
}
#Fonction pour ajouter un utilisateur

function add_user()
{
    
    $username_user = Read-Host "quelle utilisateur voulez vous ajouter? "
    if(Get-LocalUser -Name $username_user 2> $null)  
    {
        write-host "l'utilisateur existe deja"
    }
    else
    {
        $password_user = Read-Host -AsSecureString "choisissez un mot de passe pour le compte? "
        New-LocalUser -Name $username_user -Password $password_user
        if(Get-LocalUser -Name $username_user 2> $null)
        {
            write-host "l'utilisateur a bien été creer"
        }
    }

}
#fonction pour lister les utilisateurs local

function list_user_local()
{
    Get-LocalUser | Select-Object Name
}
#fonction pour afficher les services en cours

function service_run()
{
    Get-Service | Where-Object {$_.Status -eq "running"} | Select-Object Name
}
#fonction pour afficher la liste des paquet installer

function list_install()
{
   Get-AppxPackage | Select Name 
}
#fonction pour savoir a quelle groupe appartient l'utilisateur

function user_group()
{
    $user = Read-Host "quelle utilisateur voulez vous cibler? "
    if(Get-LocalUser -Name $user 2> $null)  
    {
        $group = net user $user  
        write-host $group[22]
    }
    else
    {
        write-host "L'utilisateur n'existe pas"
    }
}

function ChangePassword {
    $nomUtilisateur = Read-Host "Nommez l'utilisateur"
    $nouveauMotDePasse = Read-Host "Veuillez entrer le nouveaux mot de passe" -AsSecureString
    }

function last_change_password()
{
    $user = Read-Host "De quelle utilisateur voulez vous savoir a quelle date a eus lieux le dernier changement de mot passe"
     if(Get-LocalUser -Name $user 2> $null)  
    {
        (Get-LocalUser -Name $user).PasswordLastSet
    }
    else
    {
        write-host "L'utilisateur n'existe pas"
    }
    
}

function info_disk {
    # récupérer les lecteurs montés
$drives = Get-PSDrive -PSProvider 'FileSystem'

#inspecte chaque lecteur et afficher les détails
foreach ($drive in $drives) {
    if ($drive.Root -and (Test-Path $drive.Root)) {
        try { # récupérer les informations pour chaque lecteur
        $driveInfo = Get-Volume -DriveLetter $drive.Name[0]2>$null

        # Afficher les informations
        Write-Host "Nom du lecteur: $($drive.Name)"
        Write-Host "Type de lecteur: $($driveInfo.FileSystemType)"
        Write-Host "Espace libre: $($driveInfo.SizeRemaining / 1GB -as [int]) GB"
        Write-Host "Espace total: $($driveInfo.Size / 1GB -as [int]) GB"

    } 
    catch {
        Write-Host "Impossible de récupérer les informations pour le lecteur $($drive.Name)"
    }
} 
else {
    Write-Host "Le lecteur $($drive.Name) n'est pas accessible ou n'existe pas."
    }
}
}

#update_system
#ram_total
#os_version
#add_user
#list_user_local
#service_run
#user_group
#ChangePassword
#last_change_password
#info_disk
