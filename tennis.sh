
#!/bin/bash
#Ben Eli 319086435
points1=50
points2=50
line=" |       |       O       |       | "
player_1_guess=0
player_2_guess=0
game_on=true
pos=0


print_board() {
echo " Player 1: ${points1}         Player 2: ${points2} "
echo " --------------------------------- "
echo " |       |       #       |       | "
echo " |       |       #       |       | "
echo -e "$line"
echo " |       |       #       |       | "
echo " |       |       #       |       | "
echo " --------------------------------- "
}

player_pick(){
read -p "PLAYER 1 PICK A NUMBER: " -s player_1_guess
echo ""
read -p "PLAYER 2 PICK A NUMBER: " -s player_2_guess
echo ""
if [[ ! $player_1_guess =~ ^-?[0-9]+$ ]] || [[ ! $player_2_guess =~ ^[0-9]+$  ]]
  then 
    echo "NOT A VALID MOVE !"
    player_pick
fi

if [ $player_1_guess -gt $points1 ] || [ $player_2_guess -gt $points2 ]
  then 
    echo "NOT A VALID MOVE !"
    player_pick
fi
if  (("$player_1_guess"<"0")) || (("$player_2_guess"<"0"))
  then 
    echo "NOT A VALID MOVE !"
    player_pick
fi
points1=$((points1 - player_1_guess))
points2=$((points2 - player_2_guess))

if [ $player_2_guess -gt $player_1_guess ]
then
case $pos in
  0)
    pos=$((pos - 1))
line=" |       |   O   #       |       | "
    ;;

  1)
pos=-1
line=" |       |   O   #       |       | "

    ;;

  2)
pos=-1
line=" |       |   O   #       |       | "

    ;;
  -1)
    pos=$((pos - 1))
    line=" |   O   |       #       |       | "

    ;;

  -2)
    pos=$((pos - 1))
    line="O|       |       #       |       | "

    ;;
esac
fi

if [ $player_1_guess -gt $player_2_guess ]
then
case $pos in

  0)
    pos=$((pos + 1))
line=" |       |       #   O   |       | "

    ;;

  1)
    pos=$((pos + 1))
    line=" |       |       #       |   O   | "

    ;;

  2)
    pos=$((pos + 1))
    line=" |       |       #       |       |O"

    ;;
  -1)
    pos=1
    line=" |       |       #   O   |       | "

    ;;

  -2)
    pos=1
    line=" |       |       #   O   |       | "
    ;;
esac
fi

}

show_picks(){
echo -e "       Player 1 played: $player_1_guess\n       Player 2 played: $player_2_guess\n\n"
}

checkWinner(){
if [ "$points1" -eq "0" ] && (("$points2">"0"))||[ "$pos" -eq "-3" ]
then
echo "PLAYER 2 WINS !"
game_on=false
fi

if [ "$points2" -eq "0" ] && (("$points1">"0"))||[ "$pos" -eq "3" ]
then
echo "PLAYER 1 WINS !"
game_on=false
fi


if [ "$points1" -eq "0" ] && [ "$points2" -eq "0" ] 
then
echo "IT'S A DRAW !"
game_on=false
fi

}

print_board
while $game_on
do
  player_pick
  print_board
  show_picks
  checkWinner
done
