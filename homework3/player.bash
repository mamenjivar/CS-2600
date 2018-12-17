#!/bin/bash

# Miguel Menjivar
# HW 03
# CS 2600
# Unix and Scripting
#
# Guess my Number
# Player.bash

# bounds
min=1
max=100

echo "Player"

# gets middle value from bounds provided above
middle=$(( ( $max+$min )/2 ))
echo $middle > player_response

# sleeps which gives time for dealer to be created
sleep 2

# keeps track of number of guesses
count=0

# infinite loop until correct number guessed
while :
do
  # sleep to keep dealer and player in sync
  sleep 2

  # reads last line of dealer text file
  dealer_Response=$( tail -n 1 dealer_response )

  # dealer == UP
  # then higher number
  if [[ $dealer_Response == "UP" ]]; then
    min=$middle
    count=$(( $count+1 ))
    echo $middle >> player_response
    echo "Try #$count: Action was lower; I guess $middle"
  fi

  # dealer == DOWN
  # then lower number
  if [[ $dealer_Response == "DOWN" ]]; then
    max=$middle
    count=$(( $count+1 ))
    echo $middle >> player_response
    echo "Try #$count: Action was higher; I guess $middle"
  fi

  # dealer == CORRECT
  # game ends
  if [[ $dealer_Response == "CORRECT" ]]; then
    count=$(( $count+1 ))
    echo -e  "try #$count: Action was correct; I guess $middle\n"
    echo "You Guessed the Correct Number!!"
    echo "It took you $count tries"
    break
  fi

  # guesses new number
  middle=$(( ( $max + $min )/2 ))
  echo $middle >> player_response
done
