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

# Hash input password dengan static salt
salt="arcaea_secure_salt"
hashed_input=$(echo -n "$salt$login_pass" | sha256sum | awk '{print $1}')

# Cek apakah email dan hash cocok di database
if grep -q "^.*, $login_email, $hashed_input" "data/player.csv"
then
  echo "Login successful!"
  echo "System unlocked!"
  ./scripts/manager.sh
else
  echo "Login failed..."
fi
