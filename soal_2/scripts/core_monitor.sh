#!/bin/bash

# Membuat variable path
logPath="../logs/core.log" # menyimpan path core.log

# Membuat variable timestamp
timestamp=$(date +"%Y-%m-%d %H:%M:%S") # menyimpan waktu dengan fromat tahun-bulan-hari jam:menit:detik

# Membuat direktori ../logs terlebih dahulu, jika sudah ada tidak apa apa
mkdir -p "../logs"

# Membuar variable untu CPU Usage dan Model
CPU_Usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}') # mengambil data CPU Usage
CPU_Model=$(grep name /proc/cpuinfo | uniq | awk -F ': ' '{print $2}') # mengambil kolom ke dua yang dipisahkan oleh ": ", dimana berisi nama CPU

# Memasukkan data ke log file
echo "[$timestamp] - Core Usage [$CPU_Usage%] - Terminal Model [$CPU_Model]" >> "$logPath"

