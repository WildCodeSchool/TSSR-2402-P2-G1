#!/bin/bash


function supprimer_repertoire() {
    $logs début suppression de répertoire

    # Demande du nom du répertoire à supprimer
    read -p "Entrez le nom du répertoire à supprimer : " nom_repertoire

    
    $sshtarget "rm -r '$nom_repertoire'"

    # Vérification si la suppression du répertoire a réussi
    if ! $sshtarget "[ -d '$nom_repertoire' ]"; then
        echo "Répertoire '$nom_repertoire' supprimé avec succès."
        $logs Répertoire $nom_repertoire supprimé avec succès.
    else
        echo "Échec de la suppression du répertoire '$nom_repertoire'."
        $logs Échec lors de la suppression du répertoire $nom_repertoire
    fi

    $logs Fin suppression de répertoire
}
