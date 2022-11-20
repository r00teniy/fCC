#!/bin/bash
SQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only -c"
FOUND=0
if [[ -z $1 ]]
then
  echo -e "Please provide an element as an argument."
else
  ELEMENTS=$($SQL "select elements.atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, types.type from elements FULL JOIN properties ON elements.atomic_number = properties.atomic_number FULL JOIN types ON properties.type_id = types.type_id;")
  while read -r ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT BAR TYPE
  do
  if [ $1 = $ATOMIC_NUMBER ] || [ $1 = $SYMBOL ] || [ $1 = $NAME ]
  then
    echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    FOUND=1
  fi
  done < <(echo "$ELEMENTS")
  if [ $FOUND == 0 ]
  then
    echo -e "I could not find that element in the database."
  fi
fi
