
points1=50
points2=50

a='|'
b='|'
c='#'
d='|'
e='|'
player_1_guess=0
player_2_guess=0
space='       '
print_board() {
echo " Player 1: ${points1}         Player 2: ${points2} "
echo " --------------------------------- "
echo " |       |       #       |       | "
echo " |       |       #       |       | "
echo " $a$space$b$space$c$space$d$space$e"
echo " |       |       #       |       | "
echo " |       |       #       |       | "
echo " --------------------------------- "
}
print_board     

enterNumbers(){

read -p "PLAYER 1 PICK A NUMBER: " player_1_guess
if [[ $player_1_guess !=~ [0-9] ]]; then
    echo "NOT A VALID MOVE !"
fi

read -p "PLAYER 2 PICK A NUMBER: " player_2_guess

}
enterNumbers

playersPicks(){
    printf "       Player 1 played: ${player_1_guess}\n       Player 2 played: ${player_2_guess}\n\n"
}
playersPicks