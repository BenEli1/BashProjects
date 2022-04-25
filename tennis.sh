#!/bin/bash
#Ben Eli 319086435

#starting points and line
points1=50
points2=50
line=" |       |       O       |       | "
player_1_guess=0
player_2_guess=0
game_on=true
pos=0

#printing out the board , the middle line switches based on game logic.
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

#letting the players pick numbers from 0 to their current points left, and checking if the input is indeed a number.
player_pick(){
read -p "PLAYER 1 PICK A NUMBER: " -s player_1_guess
echo ""

if [[  $player_1_guess =~ ^-?[0-9]+$ ]] && [ $player_1_guess -le $points1 ] && (("$player_1_guess">=0""))
  then 
    read -p "PLAYER 2 PICK A NUMBER: " -s player_2_guess
    echo ""
  if [[  $player_2_guess =~ ^-?[0-9]+$ ]] && [ $player_2_guess -le $points2 ] && (("$player_2_guess">=0""))
  then
    points1=$((points1 - player_1_guess))
    points2=$((points2 - player_2_guess))
    #switch case based on gamelogic if player 2 won the round so move the ball one spot to the left
#or the first spot on the left side if it was on the right side.
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
#switch case based on gamelogic if player 1 won the round so move the ball one spot to the right 
#or the first spot on the right if it was on the left side.
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
  else  
  echo "NOT A VALID MOVE !"
  player_pick
  fi
  else
  echo "NOT A VALID MOVE !"
  player_pick

fi
}
#printing the players picks
show_picks(){
echo -e "       Player 1 played: $player_1_guess\n       Player 2 played: $player_2_guess\n\n"
}

#checking who won
checkWinner(){
#if players 1 has no points and 2 has so player 2 won or if the ball reached -3 spot
if [ "$points1" -eq "0" ] && (("$points2">"0"))||[ "$pos" -eq "-3" ] && $game_on
then
echo "PLAYER 2 WINS !"
game_on=false
fi
#if players 2 has no points and 1 has so player 1 won or if the ball reached 3 spot
if [ "$points2" -eq "0" ] && (("$points1">"0"))||[ "$pos" -eq "3" ] && $game_on
then
echo "PLAYER 1 WINS !"
game_on=false
fi

#if both are at 0 points so its a draw
if [ "$points1" -eq "0" ] && [ "$points2" -eq "0" ] && $game_on
then
case $pos in

  0)
  echo "IT'S A DRAW !"
    ;;

  1)
echo "PLAYER 1 WINS !"

    ;;

  2)
echo "PLAYER 1 WINS !"

    ;;
  -1)
  echo "PLAYER 2 WINS !"


    ;;

  -2)
 echo "PLAYER 2 WINS !"

    ;;
esac
game_on=false
fi

}
#first printing the board then running the while loop till game is over.
print_board
while $game_on
do
  player_pick
  print_board
  show_picks
  checkWinner
done
