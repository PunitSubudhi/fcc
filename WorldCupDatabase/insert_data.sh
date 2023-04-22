#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS="," read -r YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  echo -e "\n $YEAR $ROUND $WINNER $OPPONENT $WINNER_GOALS $OPPONENT_GOALS"

  echo -e "\n\n checking if $WINNER already exists in database\n"
  TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

  if [ -z "$TEAM_ID" ]
  then
    echo -e "\n $WINNER doesnt exist in database"
    TEAM_ID=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
  else 
    echo -e "\n $WINNER already exists in database with team_id = $TEAM_ID"
  fi

  echo -e "\n\n checking if $OPPONENT already exists in database"
  TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

  if [ -z "$TEAM_ID" ]
  then
    echo -e "\n $OPPONENT doesnt exist in database"
    TEAM_ID=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
  else 
    echo -e "\n $OPPONENT already exists in database with team_id = $TEAM_ID"
  fi

  echo -e "\n Inserting Game info for row  \n $YEAR | $ROUND | $WINNER | $OPPONENT | $WINNER_GOALS | $OPPONENT_GOALS "
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
  INSERT=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YEAR,'$ROUND',$WINNER_ID,$OPPONENT_ID,$WINNER_GOALS,$OPPONENT_GOALS)")
done < <(tail -n +2 games.csv)