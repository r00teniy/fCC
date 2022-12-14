#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $WINNER != winner ]]
  then
    WIN_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
  
    if [[ -z $WIN_TEAM_ID ]]
    then
      INSERT_winner_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      WIN_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    fi
  fi    
  if [[ $OPPONENT != opponent ]]
  then
    OPP_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
  
    if [[ -z $OPP_TEAM_ID ]]
    then
      INSERT_opponent_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      OPP_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    fi
  fi
  if [[ $YEAR != year ]]
  then
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES('$YEAR', '$ROUND', $WIN_TEAM_ID, $OPP_TEAM_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
  fi

done
