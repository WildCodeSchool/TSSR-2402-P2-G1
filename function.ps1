#fonction pour avoir la ram total

function ram_total()
{
     Invoke-Command -ScriptBlock { Get-WmiObject Win32_PhysicalMemory | Format-Table capacity } -Session $session
}
#fonction pour avoir la version de l'OS
function os_version()
{
    Invoke-Command -ScriptBlock { Get-WmiObject Win32_OperatingSystem | Format-Table Version } -Session $session
}
#Fonction pour ajouter un utilisateur
#a revoir pour pas que ca ressemble a chat gpt
function add_user {
    $username_user = Read-Host "Quel utilisateur voulez-vous ajouter?"
    if (Invoke-Command -ScriptBlock {param($username) Get-LocalUser -Name $username 2> $null} -ArgumentList $username_user -Session $session) {
        Write-Host "L'utilisateur existe déjà."
    }
    else {
        $password_user = Read-Host -AsSecureString "Choisissez un mot de passe pour le compte"
        Invoke-Command -ScriptBlock {param($username, $password) New-LocalUser -Name $username -Password $password 2> $null} -ArgumentList $username_user, $password_user -Session $session
        if (Invoke-Command -ScriptBlock {param($username) Get-LocalUser -Name $username} -ArgumentList $username_user -Session $session) {
            Write-Host "L'utilisateur a bien été créé."
        }
    }
}
#fonction pour lister les utilisateurs local

function list_user_local()
{
    Invoke-Command -ScriptBlock { Get-LocalUser | Select-Object Name } -Session $session
}
#fonction pour afficher les services en cours

function service_run()
{
    Invoke-Command -ScriptBlock { Get-Service | Where-Object {$_.Status -eq "running"} | Select-Object Name }
}
#fonction pour afficher la liste des paquet installer

function list_install()
{
   Invoke-Command -ScriptBlock { Get-AppxPackage | Select Name } 
}
#fonction pour savoir a quelle groupe appartient l'utilisateur
#fonction a revoir?
function user_group()
{
    $username_user = Read-Host "quelle utilisateur voulez vous cibler? "
    if (Invoke-Command -ScriptBlock { param($username) Get-LocalUser -Name $username 2> $null } -ArgumentList $username_user -Session $session)  
    {
        Invoke-Command -ScriptBlock { param($username) net user $username | Where { $_ -eq $username} } -ArgumentList $username_user -Session $session  
        #write-host $group[22]
    }
    else
    {
        write-host "L'utilisateur n'existe pas"
    }
}

function change_password()
{
    $nomUtilisateur = Read-Host "Nommez l'utilisateur: "
    $nouveauMotDePasse = Read-Host "Veuillez entrer le nouveaux mot de passe" -AsSecureString
    Invoke-Command -scriptBlock { param($nomUtilisateur, $nouveauMotDePasse) Get-LocalUser -Name $nomUtilisateur | Set-LocalUser -Password $nouveauMotDePasse } -ArgumentList $nomUtilisateur, $nouveauMotDePasse -Session $session
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
change_password
#last_change_password
