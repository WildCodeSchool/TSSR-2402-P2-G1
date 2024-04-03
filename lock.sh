#!/bin/bash

# Fonction pour verrouiller un ordinateur client
function verrouiller_client() {
    # Adresse IP ou nom d'hôte de l'ordinateur client
    client_address="adresse_ip_ou_nom_hote"

    # Nom d'utilisateur sur l'ordinateur client
    username="utilisateur"

    # Utilisation de la commande ssh pour se connecter à l'ordinateur client et verrouiller l'écran
    ssh "$username@$client_address" "xlock"
}

# Appel de la fonction pour verrouiller l'ordinateur client
verrouiller_client
