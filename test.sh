function call_ssh() {

    echo " salut $1"

}
read -p "Ton nom ? " choix

call_ssh $choix
