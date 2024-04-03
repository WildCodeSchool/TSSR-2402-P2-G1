#!/bin/bash

# Fonction pour redémarrer un ordinateur client
redemarrer_client() {
    # Adresse IP ou nom d'hôte de l'ordinateur client
    client_address="adresse_ip_ou_nom_hote"

    # Nom d'utilisateur sur l'ordinateur client
    username="utilisateur"

    # Utilisation de la commande ssh pour se connecter à l'ordinateur client et le redémarrer
    ssh "$username@$client_address" "sudo reboot"
}

# Appel de la fonction pour redémarrer l'ordinateur client
redemarrer_client
