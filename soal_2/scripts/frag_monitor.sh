#!/bin/bash

# Membuat variable path
logPath="../logs/fragment.log" # menyimpan path core.log

# Membuat variable timestamp
timestamp=$(date +"%Y-%m-%d %H:%M:%S") # menyimpan waktu dengan fromat tahun-bulan-hari jam:menit:detik

# Membuat direktori ../logs terlebih dahulu, jika sudah ada tidak apa apa
mkdir -p "../logs"

# Menghitung RAM_Total
RAM_Total=$(cat /proc/meminfo | grep MemTotal | awk '{print $2}')
RAM_Total=$(echo "scale=0; $RAM_Total / 1000" | bc)

# Menghitung RAM_Available
RAM_Available=$(cat /proc/meminfo | grep MemAvailable | awk '{print $2}')
RAM_Available=$(echo "scale=0; $RAM_Available / 1000" | bc)

# Menghitung RAM_Count
RAM_Count=$(($RAM_Total - $RAM_Available))

# Menghitung persentase RAM_Usage
RAM_Usage=$(echo "scale=1; ($RAM_Available / $RAM_Total) * 100" | bc)

# Append ke file fragment.log
echo "[$timestamp] - Fragment Usage [$RAM_Usage%] - Fragment Count [$RAM_Count MB] - Details [Total: $RAM_Total MB, Available: $RAM_Available MB]" >> "$logPath"


