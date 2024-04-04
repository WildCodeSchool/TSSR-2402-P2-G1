#!/bin/bash

#fonction pour se connecter au ssh

function call_ssh()
{
    ssh -t $1@$2 $3
}

#fonction pour se connecter au ssh avec EOF
function call_ssh_EOF
{
    ssh -t $1@$2
}

#fonction pour mettre a jour le systeme

function update_system()
{
    call_ssh $1 $2 "sudo apt update && sudo apt upgrade -y"
}

function ram_total()
{
    call_ssh_EOF $1 $2 <<-"EOF"
    ram=$(free)
    ram=$(echo $ram | cut -d' ' -f8)
    echo $ram
    EOF
}

read -p "quelle ordinateur voulez vous cibler? " choix_ordinateur
read -p "quelle utilisateur voulez vous cibler? " choix_user

#apelle de la fonction update_system
update_system $choix_user $choix_ordinateur 
