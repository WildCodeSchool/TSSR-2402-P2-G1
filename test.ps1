#fonction pour mettre a jour le systeme

function update_system()
{
    Update-Help
}
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
        $group = Get-LocalGroup | Select-Object Name
        write-host $group
    }
    else
    {
        write-host "L'utilisateur n'existe pas"
    }
}

#update_system
#ram_total
#os_version
#add_user
#list_user_local
#service_run
user_group

