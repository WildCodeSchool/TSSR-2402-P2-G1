#!/bin/bash

# Fonction pour créer un répertoire 
creer_repertoire_a_distance() {
    # Adresse IP ou nom d'hôte de l'ordinateur distant
    distant_address="172.16.10.30"

    # Nom d'utilisateur sur l'ordinateur distant
    username="wilder"

    # Nom du répertoire à créer
    repertoire="nouveau_repertoire"

    # Utilisation de la commande ssh pour créer le répertoire à distance avec mkdir
    ssh "$username@$distant_address" "mkdir -p $repertoire"

    # Vérification si la commande mkdir a réussi sur l'ordinateur distant
    if [ $? -eq 0 ]; then
        echo "Répertoire '$repertoire' créé avec succès sur l'ordinateur distant."
    else
        echo "Échec de la création du répertoire '$repertoire' sur l'ordinateur distant."
    fi
}

# Appel de la fonction pour créer le répertoire à distance
creer_repertoire_a_distance
