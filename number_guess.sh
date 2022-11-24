#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=postgres -t --no-align --tuples-only -c"
echo -e "Enter your username: "
read USERNAME
USER_ID=$($PSQL "SELECT player_id FROM players WHERE username = '$USERNAME'")
if [[ -z $USER_ID ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  ADD_USER=$($PSQL "INSERT INTO players(username, number_of_games, best_game) VALUES('$USERNAME',0,0)")
  NUMBER_OF_GAMES=0
  BEST_GAME=1000
else
  NUMBER_OF_GAMES=$($PSQL "SELECT number_of_games FROM players WHERE username = '$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM players WHERE username = '$USERNAME'")
  echo "Welcome back, $USERNAME! You have played $NUMBER_OF_GAMES games, and your best game took $BEST_GAME guesses."
fi
SECRET_NUMBER=$(($RANDOM % 1000 + 1))
NUMBER_OF_TRIES=0
GAME(){
(( NUMBER_OF_TRIES=NUMBER_OF_TRIES+1 ))
if [[ $1 ]]
then
  echo -e "\n$1"
else
  echo -e "Guess the secret number between 1 and 1000:"
fi
read NUMBER
if [[ ! $NUMBER =~ ^[0-9]+$ ]]
then
  GAME "That is not an integer, guess again:"
else
  if (( $NUMBER == $SECRET_NUMBER ))
  then
    echo "You guessed it in $NUMBER_OF_TRIES tries. The secret number was $SECRET_NUMBER. Nice job!"
    (( NUMBER_OF_GAMES=NUMBER_OF_GAMES+1 ))
    ADDING_GAME=$($PSQL "UPDATE players set number_of_games = $NUMBER_OF_GAMES WHERE username = '$USERNAME'")
    if (( $BEST_GAME > $NUMBER_OF_TRIES))
    then
      ADDING_BEST_GAME=$($PSQL "UPDATE players SET best_game = $NUMBER_OF_TRIES WHERE username = '$USERNAME'")
    fi
  else 
    if (( $NUMBER > $SECRET_NUMBER ))
    then
      GAME "It's lower than that, guess again:"
    else
      GAME "It's higher than that, guess again:"
    fi
  fi
fi
}
GAME
