#!/usr/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align 
-c"

function PRINT() {
    ATOMIC_NUMBER=$1
    NAME=$($PSQL "SELECT name FROM elements WHERE 
atomic_number=$ATOMIC_NUMBER")
    SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE 
atomic_number=$ATOMIC_NUMBER")
    TYPE_ID=$($PSQL "SELECT type_id FROM properties WHERE 
atomic_number=$ATOMIC_NUMBER")
    TYPE=$($PSQL "SELECT type FROM types WHERE type_id=$TYPE_ID")
    ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE 
atomic_number=$ATOMIC_NUMBER")
    MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties 
WHERE atomic_number=$ATOMIC_NUMBER")
    BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties 
WHERE atomic_number=$ATOMIC_NUMBER")

    echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME 
($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a 
melting point of $MELTING_POINT celsius and a boiling point of 
$BOILING_POINT celsius."
}

if [[ -z $1 ]]
then
  echo -e "Please provide an element as an argument.";
else
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    PRINT $1
  else
      ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE 
name='$1'")
      if [[ $ATOMIC_NUMBER =~ ^[0-9]+$ ]]
      then
       PRINT $ATOMIC_NUMBER
      else
        ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE 
symbol='$1'")
        if [[ $ATOMIC_NUMBER =~ ^[0-9]+$ ]]
        then
          PRINT $ATOMIC_NUMBER
        else
          echo "I could not find that element in the database."
        fi
      fi
    fi
fi


