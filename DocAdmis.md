# Documentation Administrateur - Projet 2

## Prérequis Techniques


- **Serveur Windows :**
  - Système d'exploitation : Windows Server 2022
  - PowerShell Core version 7.4 installé

- **Serveur Debian :**
  - Système d'exploitation : Debian 12
  - Accès en tant que root

- **Machines distantes :**
  - Machines Windows 10
  - Machines Ubuntu 22.04 LTS

## Étapes d'Installation et de Configuration
### Sur le Serveur Debian :

1. Connectez-vous en tant que root sur le serveur Debian.
2. Téléchargez et installez les modules SSH sur le serveur Debian et Ubuntu en exécutant la commande suivante :
   
   ```bash
   sudo apt-get install openssh-server
   ```
3. Générez une paire de clés SSH sur le serveur Debian en exécutant la commande suivante :
```bash
ssh-keygen
```
Suivez les instructions à l'écran pour configurer les paramètres de la clé SSH.

4. Copiez la clé publique générée vers le serveur Ubuntu en utilisant la commande ssh-copy-id. Assurez-vous de remplacer user par le nom d'utilisateur approprié sur le serveur Ubuntu et server par l'adresse IP ou le nom d'hôte du serveur Ubuntu :
```bash
ssh-copy-id user@server
```
Vous serez invité à saisir le mot de passe de l'utilisateur sur le serveur Ubuntu pour finaliser la copie de la clé SSH.

Une fois la clé copiée avec succès, vous devriez pouvoir vous connecter au serveur Ubuntu depuis le serveur Debian sans être invité à saisir un mot de passe.

### Sur le Serveur Windows :



### Sur le Serveur Debian :



## FAQ

Voici quelques solutions aux problèmes courants rencontrés lors de l'installation et de la configuration du projet :
