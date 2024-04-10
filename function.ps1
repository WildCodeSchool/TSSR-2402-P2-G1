function update_system()
{
    Update-Help
}

function ram_total()
{
    Get-WmiObject Win32_PhysicalMemory | Format-Table capacity
}

function os_version()
{
    Get-WmiObject Win32_OperatingSystem | Format-Table Version
}

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

function list_user_local()
{
    Get-LocalUser
}
#update_system
#ram_total
#os_version
#add_user
list_user_local
