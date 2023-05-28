#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

ASK_NAME () {
  echo -e "Enter your username:"
  read USER_NAME

  #Check if username exists
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE 
user_name='$USER_NAME'")
  if [[ -z $USER_ID ]]
  then
    # Insert Username into Database
    INSERT_USER_NAME=$($PSQL "INSERT INTO users(user_name) VALUES 
('$USER_NAME');")

    # Retrive User_id
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE 
user_name='$USER_NAME'")

    #Print Welcome message
    echo -e "Welcome, $USER_NAME! It looks like this is your first time 
here."
  else
    # Retrieve games_played
    GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games WHERE 
user_id=$USER_ID")

    # Retrieve best_game
    BEST_GAME=$($PSQL "SELECT MIN(no_guesses) FROM games WHERE 
user_id=$USER_ID")

    # Print Welcome Message
    echo -e "Welcome back, $USER_NAME! You have played $GAMES_PLAYED 
games, and your best game took $BEST_GAME guesses."

  fi
  return $USER_ID
}

GUESS_NUMBER(){
  read GUESS
  NO_GUESSES=$(( $NO_GUESSES + 1 ))
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo -e "That is not an integer, guess again:"
    GUESS_NUMBER
  elif [[ $GUESS = $RANDOM_NUMBER ]]
  then
    return $NO_GUESSES
  elif [[ $GUESS > $RANDOM_NUMBER ]]
  then
    echo -e "It's lower than that, guess again:"
    GUESS_NUMBER
  elif [[ $GUESS < $RANDOM_NUMBER ]]
  then
    echo -e "It's higher than that, guess again:"
    GUESS_NUMBER
  fi
}


MAIN(){
  NO_GUESSES=0
  RANDOM_NUMBER=$(( 1 + $RANDOM % 1000 ))
  ASK_NAME
  echo -e "Guess the secret number between 1 and 1000:"
  GUESS_NUMBER
  INSERT_GAME_RETURN=$($PSQL "INSERT INTO games(user_id,no_guesses) VALUES 
($USER_ID,$NO_GUESSES)")
  echo -e "You guessed it in $NO_GUESSES tries. The secret number was 
$RANDOM_NUMBER. Nice job!"
}

MAIN
