#!/bin/bash

# Tabel Terminal
printf "%-1s%-33s%-1s %s\n" "+" "---------------------------------" "+"
printf "%-1s%-9s%-15s%-9s%-1s %s\n" "|" " " "Arcaea Terminal" " " "|"
printf "%-1s%-33s%-1s %s\n" "+" "---------------------------------" "+"
printf "%-1s%-33s%-1s %s\n" "|" "Option (ID)" "|"
printf "%-1s%-33s%-1s %s\n" "+" "---------------------------------" "+"
printf "%-1s%-33s%-1s %s\n" "|" "Register New Account (1)" "|"
printf "%-1s%-33s%-1s %s\n" "|" "Login to Existing Account (2)" "|"
printf "%-1s%-33s%-1s %s\n" "|" "Exit Terminal (3)" "|"
printf "%-1s%-33s%-1s %s\n" "+" "---------------------------------" "+"

# Meminta user input opsi
echo "Enter option [1-3]: "
read option
echo ""

# switch case pilihan user
case $option in
  1)
    echo "Loading registration page..."
    ./register.sh
    ;;
  2)
    echo "Loading login page..."
    ./login.sh
    ;;
  3)
    echo "Exiting the terminal..."
    exit
    ;;
  *)
    echo "Error, option not found"
    ;;
esac
