gccfind.sh - Bash Script which recives 2 to 3 arguments.
1 - a directory path
2 - some word
3 - (optional) -r (recursive)

on file run the program uses a loop to iterate through the files in the specific path and deleting all compiled files ending with .out and compiling all files

that have the given word (arg 2) in the file using gcc(.c ending)

if the third argument is passed so the program iterates recusrivly through the directory path.

example - 
![image](https://user-images.githubusercontent.com/92650578/165935229-11b86ee8-9892-4d8b-ae61-811639b6e187.png)

tennis.sh - paper game 

the game board consists of 7 areas - (-3,-2,-1,0,1,2,3);
if the ball reaches 3 then player 1 wins, if the ball reaches -3 player 2 wins.

each player has 50 points.
on every turn the players choose a number from 0 to their total points remaining.

the one who choose more points on the turn wins the current round and the ball moves one spot to the right or the left according to which player won.
if one of the players doesn't have any more points remaining and the other does than he loses.

if both lost all points so the position of the ball decides the winner.

example - 
![image](https://user-images.githubusercontent.com/92650578/165935146-20babbb0-a3ef-47ad-a43b-5810c2018b19.png)


myshell.c - implemtion of a shell in c , 3 commands added - cd,history and exit(not built in).

you can add in the line arguments additonal paths for using the scripts in them.(using setenv and getenv).

example - 

![image](https://user-images.githubusercontent.com/92650578/165935278-baaea4c7-3d2a-4f82-9cd1-0f751ab2053a.png)
