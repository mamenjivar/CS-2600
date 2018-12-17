#!/bin/bash

# Miguel Menjivar
# HW 03
# CS 2600
# Unix and Scripting
#
# Guess my Number
# Dealer.bash

echo "Dealer"

# random number from 1 to 100
rand=$(( ($RANDOM % 100)+1 ))
count=0

# will get random value and save it to text file
# for player file to read
echo "Number is $rand"
echo $rand > dealer_response

# infinite loop until correct number is guessed
while :
do
  # waits for player file to respond
  sleep 2

  # reads last line of player file after every iteration
  player_Read=$( tail -n 1 player_response )

  echo "Player guesses $player_Read"

  # playerNum < dealerNum
  # Go UP
  if [[ $player_Read  -lt $rand ]]; then
    echo "UP" >> dealer_response
    count=$(( $count+1 ))
  fi

  # playerNum > dealerNum
  # go DOWN
  if [[ $player_Read -gt $rand ]]; then
    echo "DOWN" >> dealer_response
    count=$(( $count+1 ))
  fi

  # playerNum == dealerNum
  # EQUAL (Win game)
  if [[ $player_Read -eq $rand ]]; then
    echo "CORRECT" >> dealer_response
    count=$(( $count+1 ))
    echo "Congrats! That took $count tries"
    break
  fi
done
