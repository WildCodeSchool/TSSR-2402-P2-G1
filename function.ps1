#fonction pour avoir la ram total

function ram_total()
{
     Invoke-Command -ScriptBlock { Get-WmiObject Win32_PhysicalMemory | Format-Table capacity } -Session $session | Tee-Object $info_log -Append

     $message = "affichage de la ram total"
     Write-Log $mesage
}
#fonction pour avoir la version de l'OS
function os_version()
{
    Invoke-Command -ScriptBlock { Get-WmiObject Win32_OperatingSystem | Format-Table Version } -Session $session | Tee-Object $info_log -Append
    $message = "affichage de la version de l'OS"
    Write-Log $mesage
}
#Fonction pour ajouter un utilisateur

function add_user {
    $username_user = Read-Host "Quel utilisateur voulez-vous ajouter?"
    if (Invoke-Command -ScriptBlock {param($username) Get-LocalUser -Name $username 2> $null} -ArgumentList $username_user -Session $session) {
        Write-Host "L'utilisateur existe déjà."
        $message = "l'utilisateur $username_user ne peut pas etre creer car il exite deja"
        Write-Log $mesage
    }
    else {
        $password_user = Read-Host -AsSecureString "Choisissez un mot de passe pour le compte"
        Invoke-Command -ScriptBlock {param($username, $password) New-LocalUser -Name $username -Password $password 2> $null} -ArgumentList $username_user, $password_user -Session $session
        if (Invoke-Command -ScriptBlock {param($username) Get-LocalUser -Name $username} -ArgumentList $username_user -Session $session) {
            Write-Host "L'utilisateur a bien été créé."
            $message = "l'Utilisateur $username_user a été creer"
            Write-Log $mesage
        }
    }
}
#fonction pour lister les utilisateurs local

function list_user_local()
{
    Invoke-Command -ScriptBlock { Get-LocalUser | Select-Object Name } -Session $session | Tee-Object $info_log -Append
    $message = "affichage de la liste des utilisateurs local"
    Write-Log $mesage
}
#fonction pour afficher les services en cours

function service_run()
{
    Invoke-Command -ScriptBlock { Get-Service | Where-Object {$_.Status -eq "running"} | Select-Object Name } | Tee-Object $info_log -Append
    $message = "affichage de services en cours d'execution"
    Write-Log $mesage
}
#fonction pour afficher la liste des paquet installer

function list_install()
{
   Invoke-Command -ScriptBlock { Get-AppxPackage | Select Name } | Tee-Object $info_log -Append
   $message = "affichage des paquets installé"
    Write-Log $mesage
}
#fonction pour savoir a quelle groupe appartient l'utilisateur

function user_group()
{
    $username_user = Read-Host "quelle utilisateur voulez vous cibler? "
    if (Invoke-Command -ScriptBlock { param($username) Get-LocalUser -Name $username 2> $null } -ArgumentList $username_user -Session $session)  
    {
        Invoke-Command -ScriptBlock { param($username) (net user $username)[22,23] } -ArgumentList $username_user -Session $session | Tee-Object $info_log -Append
        $message = "affichage a quelle groupe appaartient l'utilisateur"
        Write-Log $mesage  
    }
    else
    {
        write-host "L'utilisateur n'existe pas"
        $message = "impossible de savoir a quelle groupe appartient l'utilisateur"
        Write-Log $mesage
    }
}

function change_password()
{
    $nomUtilisateur = Read-Host "Nommez l'utilisateur: "
    $nouveauMotDePasse = Read-Host "Veuillez entrer le nouveaux mot de passe" -AsSecureString
    Invoke-Command -scriptBlock { param($nomUtilisateur, $nouveauMotDePasse) Get-LocalUser -Name $nomUtilisateur | Set-LocalUser -Password $nouveauMotDePasse } -ArgumentList $nomUtilisateur, $nouveauMotDePasse -Session $session
    $message = "changement de mot de passe de l'utilisateur $nomUtilisateur"
    Write-Log $mesage
}

function last_change_password()
{
    $user = Read-Host "De quelle utilisateur voulez vous savoir a quelle date a eus lieux le dernier changement de mot passe"
     if(Invoke-Command -scriptBlock { param($user) Get-LocalUser -Name $user 2> $null } -ArgumentList $user -Session $session)  
    {
        Invoke-Command -scriptBlock { param($user) (Get-LocalUser -Name $user).PasswordLastSet } -ArgumentList $user -Session $session | Tee-Object $info_log -Append
        $message = "affichage de la derniere fois que $nomUtilisateur a changer de mot de passe"
        Write-Log $mesage
    }
    else
    {
        write-host "L'utilisateur n'existe pas"
         $message = "affichage de la derniere fois que $nomUtilisateur a changer de mot de passe ECHEC car l'utilisateur n'existe pas"
         Write-Log $mesage
    }
    
}



#$choix_users = Read-Host "Utilisateur a joindre"
#$choix_ordinateur = Read-Host "Ordinateur a joindre"
$session = New-PSSession -ComputerName "172.16.10.20" -Credential "wilder"

# Fonction pour la sauvegarde des actions fait avec le script
function Write-Log {
    Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log -Value "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - $env:USERNAME - $choix_users - $choix_ordinateur - $message"
}


#Variables pour le Fichier Log des demandes d'information

$Dates = Get-Date -Format "yyyyMMdd"
$info_log = "C:\Users\Administrator\Documents\info_wilder_$choix_users_$dates.txt"


#ram_total
#os_version
#add_user
#list_user_local
#service_run
#list_install
#user_group
#change_password
#last_change_password

