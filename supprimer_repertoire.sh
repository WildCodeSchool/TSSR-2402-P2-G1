#!/bin/bash

# Fonction pour supprimer un répertoire 
supprimer_repertoire_a_distance() {
    # Adresse IP ou nom d'hôte de l'ordinateur distant
    distant_address="172.16.10.30"

    # Nom d'utilisateur sur l'ordinateur distant
    username="wilder"

    # Chemin du répertoire à supprimer
    chemin_repertoire="/chemin/vers/le/repertoire"

    # Utilisation de la commande ssh pour supprimer le répertoire à distance avec rm -r
    ssh "$username@$distant_address" "rm -r '$chemin_repertoire'"

    # Vérification si la commande rm a réussi sur l'ordinateur distant
    if [ $? -eq 0 ]; then
        echo "Répertoire '$chemin_repertoire' supprimé avec succès sur l'ordinateur distant."
    else
        echo "Échec de la suppression du répertoire '$chemin_repertoire' sur l'ordinateur distant."
    fi
}

# Appel de la fonction pour supprimer le répertoire à distance
supprimer_repertoire_a_distance
