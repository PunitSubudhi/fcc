#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~"
echo -e "\nWelcome to My Salon, how can I help you?\n"


MAIN_MENU(){
  #Check if argument is passed
  if [[ $1 ]]
  then
    #Print argumnent
    echo -e "\n$1"
  fi

  #Fetch services from db
  SERVICES=$($PSQL "SELECT service_id,name FROM services")
  #print services
  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
  echo "$SERVICE_ID) $SERVICE_NAME"
  done

  #read service
  read SERVICE_ID_SELECTED

  #check if service exists
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")

  #if service doesnt exist
  if [[ -z $SERVICE_NAME ]]
  then
    #send to main menu
    MAIN_MENU "I could not find that service. What would you like today?"
  else
    #ask for phone of customer
    echo -e "\nWhat's your phone number?"
    #read phone number
    read CUSTOMER_PHONE

    #check if customer exist
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

    #if phone number doesnt exist
    if [[ -z $CUSTOMER_ID ]]
    then

      echo -e "\nI don't have a record for that phone number, what's your name?"
      #Read Customer Name
      read CUSTOMER_NAME

      #Add Customer to db
      ADD_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name,phone) VALUES ('$CUSTOMER_NAME','$CUSTOMER_PHONE')")

      #Get customer ID
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    fi
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

      #ask time
      echo -e "\nWhat time would you like your $(echo $SERVICE_NAME | sed -E 's/^ *| *$//'), $(echo $CUSTOMER_NAME | sed -E 's/^ *| 
*$//')?"
      #read time
      read SERVICE_TIME

      #book appointment
      APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) 
VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")

      echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed -E 's/^ *| *$//') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -E 
's/^ *| *$//')."
    
  fi
}

MAIN_MENU
