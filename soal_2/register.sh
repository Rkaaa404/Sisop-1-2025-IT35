#!/bin/bash

# Input Username
echo "Enter username:"
read uname
  
while [ 1 ] # Cek email input (Radiant Genesis / B)
do
  # Input Email
  echo "Enter email:"
  read email
  if [[ ! "$email" =~ @.*\. ]] # cek email apakah memiliki pola @<terserah>.
  then
    echo "Invalid email!"
  else
    break # keluar dari loop
  fi  
done
  
# Cek apakah email sudah ada
if grep -q ".*, $email, .*" data/player.csv; then
  echo "Email sudah digunakan! Registrasi gagal."
  exit 1
fi

while  [ 1 ] # Cek password input (Radiant Genesis / B)
do
  echo "Enter password:"
  read -s pass
  if  [[ ${#pass} -lt 8 ]] # Cek apakah jumlah angka (len)  dalam pass kurang dari 8
  then
    echo "Password length min. 8 letters"
  elif  [[ ! "$pass" =~ [a-z] ]] # Cek apakah password mengandung huruf alphabet [a-z] (kecil)
  then
    echo "Password min. 1 small letter"
  elif [[ !  "$pass" =~ [A-Z] ]]  # Cek apakah password mengandung huruf alphabet [A-Z] (besar)
  then
    echo "Password min. 1 capitalized letter"
  elif [[ ! "$pass" =~ [0-9] ]] # Cek apakah password mengandung angka [0-9]
  then
    echo "Password min. 1 number"
  else
    break # keluar dari loop
  fi
done
# Hash password dengan static salt
salt="arcaea_secure_salt"
hashed_pass=$(echo -n "$salt$pass" | sha256sum | awk '{print $1}')
  
echo ""
    
# Cek udh ada belum filenya
if  [[ ! -f data/player.csv ]]
then
  mkdir -p data
  echo "username, email, password" > data/player.csv
fi  
  
#kalau udh ada ya append aja
echo "${uname}, ${email}, ${hashed_pass}" >> data/player.csv
echo -e "Data saved successfully..."
