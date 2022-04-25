
points1=50
points2=50
arr=("|" "|" "O" "|" "|" )
player_1_guess=0
player_2_guess=0
game_on=true
print_board() {
echo " Player 1: ${points1}         Player 2: ${points2} "
echo " --------------------------------- "
echo " |       |       #       |       | "
echo " |       |       #       |       | "
echo " ${arr[0]}       ${arr[1]}       ${arr[2]}       ${arr[3]}       ${arr[4]} "
echo " |       |       #       |       | "
echo " |       |       #       |       | "
echo " --------------------------------- "
}
print_board     

player_pick(){

read -p "PLAYER 1 PICK A NUMBER: " -s player_1_guess
echo ""
read -p "PLAYER 2 PICK A NUMBER: " -s player_2_guess
echo ""

if [[ ! $player_1_guess =~ ^-?[0-9]+$ ]] || [[ ! $player_2_guess =~ ^[0-9]+$  ]]
  then 
    echo "NOT A VALID MOVE !"
    enterNumbers
fi

}
enterNumbers

show_picks(){
    echo "       Player 1 played: ${player_1_guess}"       
    echo "       Player 2 played: ${player_2_guess}"
    echo ""
    points1=points1-player_1_guess
    points2=points2-player_2_guess

}

checkWinner(){

}
playersPicks

print_board
while $game_on
do
  player_pick
  print_board
  show_picks
  checkWinner
done
