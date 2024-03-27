# TSSR-2402-P2-G1
Groupe 1 du projet 2 des TSSR 2024-02


# Documentation générale 
### Présentation du projet et objectif finaux 
 **Objectif principal :**  
Création d'un script permettant l'automatisation de la gestion de postes et d'utilisateurs client.

  **Objectif secondaire :**  
Depuis un serveur, cibler une machine cliente avec un type d’OS différent. 

### Introduction mise en contexte 


### Membres du groupe de projet (rôles par sprint) 
***Semaine 1:***

|        Nom         |     Rôles     |                         Tâche                         |
| :----------------: | :-----------: | :---------------------------------------------------: |
|  Ahmed Ben Rebai   |    Membre     |        Installation et config réseau vm Ubuntu        |
| Alexandre Peyronie |    Membre     |      Installation et config réseau vm Debian 12       |
|    Luca Pouilly    | Scrum Master  |      Installation et config réseau vm Windows 10      |
|  Nicolas Claverie  |    Membre     | Installation et config réseau vm Windows Server / Doc |
|   Pierre Girard    | Product Owner |                 Squelette/pseudo-code                 |


### Choix techniques 

Environment imposé par le client :

|   Nom    | Fonction |  Operating System   |    Compte     | Mot de passe |  Adresse IP  | CIDR  |
| :------: | :------: | :-----------------: | :-----------: | :----------: | :----------: | :---: |
| SRVWIN01 | Serveur  | Windows Server 2022 | Administrator |   Azerty1*   | 172.16.10.5  |  /24  |
| SRVLX01  | Serveur  |      Debian 12      |     root      |   Azerty1*   | 172.16.10.10 |  /24  |
| CLIWIN01 |  Client  |     Windows 10      |    wilder     |   Azerty1*   | 172.16.10.20 |  /24  |
| CLILIN01 |  Client  |  Ubuntu 22.04 LTS   |    wilder     |   Azerty1*   | 172.16.10.30 |  /24  |

### Difficultés rencontrées : problèmes techniques rencontrés

PowerShell's SUCKS !

### Solutions trouvées : Solutions et alternatives trouvées

BURN PowerShell BURN !

### Améliorations possibles : suggestions d’améliorations futures



### Next step

Utiliser les scripts Bash dans un environment Microsoft.
Utiliser les scripts PowerShell dans un environment Linux.
