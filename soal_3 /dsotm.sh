#!/bin/bash

WoA(){ # Words of Affirmation (Speak to Me)
  while [ 1 ]
  do
    curl -s -H "Accept: application/json" "https://www.affirmations.dev" | jq -r '.affirmation' # manggil API yang bakal ngerespon JSON dengan bentuk "Affirmation" : "kata kata" terus dipipe ke jq -r yang bakal remove bagian "affirmation"
    sleep 1
  done
}

ProgBar(){ # Progress Bar (On the Run)
  echo "Loading..." #taruh atas biar ga loop
  # for loop progress bar
  for ((i=1; i<=25; i=i+1))
  do
    # sleep time randomizer (0.1 - 1 second)
    num=$((RANDOM % 11)) # Random 0-10, karena RANDOM hanya bisa ngerandom 0-32767 https://www.geeksforgeeks.org/random-shell-variable-in-linux-with-examples/
    num=$(echo "scale=1; $num / 10" | bc) # melakukan pembagian 10 dengan angka di belakang koma 1, menggunakan bc (basic calculator)

    # itung itungan wak
    belum=$((25 - $i))
    persen=$(($i * 100 / 25 | bc)) # knp kok 100? kan % jadinya dikali seratus

    # menyiapkan  bar bagian selesai dan belum
    sub_bar_selesai=$(printf "%${i}s" | tr " " "#") # printf s (spaces) sebanyak variabel, terus spacenya itu dituker sama char
    sub_bar_belum=$(printf "%${belum}s" | tr " " "-")

    echo -ne "\r[${sub_bar_selesai}${sub_bar_belum}] ${persen}%"
    sleep $num
  done

  clear && echo "Task Completed"
}

# Why don’t clocks ever get invited to parties? Because they’re always ticking people off! xixixi

LiveClock(){ # Clock (Time)
  while [ 1 ]
  do
    waktu=$(date +'%x (%H:%M:%S)')
    echo  -n -e "$waktu\r"
    sleep 1
  done
}


MatrixMoney(){ # Matrix-like effect but using money signs (Money)
  chars=($ € £ ¥ ¢ ₹ ₩ ₿ ₣)
  count=${#chars[@]} #menghitung elemen dari array chars
  screenlines=$(expr `tput lines`) #mengambil jumlah baris
  screencols=$(expr `tput cols`) #mengambil jumlah kolom

  #Nyiapin layar
  clear
  tput cup 0 0 # posisiin kursor ke pojok kiri atas

  # Infinity loop
  while [ 1 ]
  do for ((i=1; i<=$screenlines; i+=1))
    do for ((j=1; j<=$screencols; j+=1))
      do rand=$(($RANDOM%77)) #mengambil angka acak 0-76
        case $rand in
          0) # ketika hasil randomnya 0 bakal ngeprint character uang secara acak
            printf "${chars[$RANDOM%$count]}"
            ;;
          1) # ketika hasil randomnya 1 bakal ngeprint spasi
            printf "  "
            ;;
          *) # selain itu semua, bakal ngelakuin geser 1 kolom
            printf "\033[1C" # \033 merupakan escape character yang memungkinkan manipulasi terminal, lalu diikuti [1C yang berarti geser 1 kolom, cmiiw
            ;;
        esac
      done
      printf "\n"
    done
    tput cup 0 0 
  done
}

TaskManager(){ # Task Manager wanna be but ps aux but not ps aux (Brain Damage)
  while [ 1 ]
  do
    clear
    printf "%-2s %-6s %-10s %-6s %-6s %-6s %s\n" " " "PID" "USER" "%CPU" "%MEM" "TIME" "COMMAND" # header tabel
    ps aux --sort=pid | awk 'NR>1 {printf "%-2s %-6s %-10s %-6s %-6s %-6s %s\n"," ", $2, $1, $3, $4, $10, $11}' # ps aux disort berdasarkan pid, terus diambil isi kolom 1,2,3,4,10,1 pada baris > 1
    sleep 1
  done
}
case $1 in
  '--play=Speak to Me')
    WoA
    ;;
  '--play=On the Run')
    ProgBar
    ;;
  '--play=Time')
    LiveClock
    ;;
  '--play=Money')
    MatrixMoney
    ;;
  '--play=Brain Damage')
    TaskManager
    ;;
  *)
    echo "ga salah ta?"
    ;;
esac
