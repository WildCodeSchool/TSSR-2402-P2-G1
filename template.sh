#!/bin/bash

#fonction pour se connecter au ssh

function call_ssh()
{
    ssh -t $1@$2 $3
}

#fonction pour mettre a jour le systeme

function update_system()
{
    call_ssh $1 $2 "sudo apt update && sudo apt upgrade -y"
}

read -p "quelle ordianteur voulez vous cibler? " choix_ordinateur
read -p "quelle utilisateur voulez vous cibler? " choxi_user

#apelle de la fonction updaate_system
update_system $choix_user $choix_ordinateur 