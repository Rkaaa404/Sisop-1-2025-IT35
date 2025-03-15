#!/bin/bash


# if condition buat negcheck data dah ada atau belum
if  [[ ! -f data/player.csv ]]
then
  echo "Belum ada data player"
fi

# Input
echo "Enter email:"
read login_email
echo "Enter password:"
read -s login_pass
echo ""

# if condition check di data/player.csv
if grep -q ".*, ${login_email}, ${login_pass}" "data/player.csv"
then
  echo "Login successful!"
else
  echo "Login failed..."
fi



