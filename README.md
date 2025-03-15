# Sisop-1-2025-IT35
### Anggota Kelompok:  
- Rayka Dharma Pranandita (*5027241039*)
- Bima Aria Perthama (*5027241060*)
- Gemilang Ananda Lingua (*5027241072*)  

### Table of Contents :
- [Nomor 1](#nomor-1-gilang)   
       a. Menunjukkan buku-buku yang dibaca oleh Chris Hemsworth   
       b. Rata-rata durasi membaca  
       c. Pembaca dengan rating tertinggi  
       d. Genre paling populer di Asia setelah 2023  
- [Nomor 2](#nomor-2)  
       a. First Step in a New World  
       b. Radiant Genesis  
       c. Unceasing Spirit  
       d. The Eternal Realm of Light  
- [Nomor 3](#nomor-3-rayka)  
       a. Speak to Me  
       b. On the Run  
       c. Time  
       d. Money  
       e. Brain Damage   
- [Nomor 4](#nomor-4-aria)  
       a. Melihat summary dari data  
       b. Mengurutkan Pokemon berdasarkan data kolom  
       c. Mencari nama Pokemon tertentu  
       d. Mencari Pokemon berdasarkan filter nama type  
       e. Error handling
       f. Help screen yang menarik

### Nomor 1 (Gilang)  
a. Menunjukkan buku-buku yang dibaca oleh Chris Hemsworth   
- Membuat file poppo_siroyo.sh menggunakan command “touch poppo_siroyo.sh” untuk membuat file bash
- Membuat program untuk Menghitung jumlah buku yang dibaca oleh Chris Hemsworth
```
BEGIN {
    FS=","
    count_chris = 0
}

{
    if ($2 == "Chris Hemsworth") {
        count_chris++
    }
}

END {
    if (count_chris > 0) {
        print "Chris Hemsworth membaca " count_chris " buku."
    } else {
        print "Chris Hemsworth tidak membaca buku."
    }
}
```

- Save program dan melakukan uji, untuk memeriksa apakah output dari program tersebut sesuai dengan kriteria yang sudah ditentukan. Disini, saya menggunakan command “awk -f poppo_siroyo.sh reading_data.csv” agar program berjalan dan membaca isi dari file yang sudah diberikan

b. Rata-rata durasi membaca  
- Setelah berhasil mendapatkan output yang sesuai pada soal “Menunjukkan buku-buku yang dibaca oleh Chris Hemsworth” Langkahselanjutnya yaitu membuat program untuk menghitung rata rata durasi membaca dengan Tablet.
- Membuat program untuk Menghitung rata-rata durasi membaca dengan Tablet
```
BEGIN { FS=","; total = 0; count = 0 }
        
{
    if ($8 == "Tablet") {
        total += $6
        count++
    }
}
        
END {
    if (count > 0)
        print "Rata-rata durasi membaca dengan Tablet adalah", total/count, "menit."
    else
        print "Tidak ada data membaca dengan Tablet."
}
```
- Save program dan melakukan uji, untuk memeriksa apakah output dari program tersebut sesuai dengan kriteria yang sudah ditentukan. Disini, saya menggunakan command “awk -f poppo_siroyo.sh reading_data.csv” agar program berjalan dan membaca isi dari file yang sudah diberikan

 c. Pembaca dengan rating tertinggi  
- Setelah berhasil mendapatkan output yang sesuai pada soal “Rata-rata durasi membaca ” Langkah selanjutnya yaitu membuat program untuk Mencari pembaca dengan rating tertinggi.
- Membuat program untuk Mencari pembaca dengan rating tertinggi
``` bash
BEGIN { FS=",";max_rating=0;name="";book="";}
NR > 1 {
        if ($7 > max_rating) {
        max_rating=$7;
        name = $2;
        book = $3 
        }
}    
    
END {
    if (max_rating > 0) {
        print "Pembaca dengan rating tertinggi: " name " - " book " - " max_rating;
    } else {
        print "Tidak ada rating tertinggi."
    }
}
```
- Save program dan melakukan uji, untuk memeriksa apakah output dari program tersebut sesuai dengan kriteria yang sudah ditentukan. Disini, saya menggunakan command “awk -f poppo_siroyo.sh reading_data.csv” agar program berjalan dan membaca isi dari file yang sudah diberikan

d. Genre paling populer di Asia setelah 2023
- Setelah berhasil mendapatkan output yang sesuai pada soal “Pembaca dengan rating tertinggi ” Langkah selanjutnya yaitu membuat program untuk Mencari genre paling populer di Asia setelah 2023
- Membuat program untuk Mencari genre paling populer di Asia setelah 2023
``` bash
BEGIN { FS="," }

$9 ~ /Asia/ && $5 > "2023-12-31" {
    genre[$4]++
}
        
END {
    max_genre = ""
    max_count = 0
     
    for (g in genre) {
        if (genre[g] > max_count) {
            max_count = genre[g]
            max_genre = g
        }
    }   
 
    if (max_count > 0)
        print "Genre paling populer di Asia setelah 2023 adalah " max_genre " dengan " max_count " buku."  
else
        print "Tidak ada buku yang dibaca di Asia setelah 2023."
}
```

- Save program dan melakukan uji, untuk memeriksa apakah output dari program tersebut sesuai dengan kriteria yang sudah ditentukan. Disini, saya menggunakan command “awk -f poppo_siroyo.sh reading_data.csv” agar program berjalan dan membaca isi dari file yang sudah diberikan

### Nomor 2
sdf

### Nomor 3 (Rayka)
Dalam pengerjaan menggunakan fungsi untuk tiap section agar lebih mudah dalam mengerjakan  

*a. Speak to Me*  
Membuat program yang menggunakan API "https://www.affirmations.dev" untuk menampilkan kata kata afirmasi setiap 1 detik (terus menerus dengan delay 1 detik), maka bisa dituliskan:  

```bash  
while [ 1 ]  
do  
  curl -s -H "Accept: application/json" "https://www.affirmations.dev" | jq -r '.affirmation'  
  sleep 1  
done  
```
Jadi akan melakukan infinity loop, yang berisikan proses pemanggilan API ___https://www.affirmations.dev___ yang menghasilkan output berupa JSON, output ini kita pipe ke command jq yang kemudian kita gunakan -r untuk remove string "affirmation". Selanjutnya dilakukan sleep 1 detik atau berhenti selama satu detik sebelum proses melakukan perulangan kembali.

*b. On the Run*  
Membuat program yang menunjukkan progress bar atau loading dengan ketentuan memiliki kotak fix, persentase selesai, dan sleep time 0.1-1 detik.
```bash
echo "Loading..."
for ((i=1; i<=25; i=i+1))
do
  num=$((RANDOM % 11))
  num=$(echo "scale=1; $num / 10" | bc)

  belum=$((25 - $i))
  persen=$(($i * 100 / 25 | bc))

  sub_bar_selesai=$(printf "%${i}s" | tr " " "#")
  sub_bar_belum=$(printf "%${belum}s" | tr " " "-")
  echo -ne "\r[${sub_bar_selesai}${sub_bar_belum}] ${persen}%"
  sleep $num
done
```
Jadi pertama akan menampilkan teks ___loading...___ yang lalu ada for loops hingga 25 iterasi. Pemilihan angka 25 inin dikarenakan merupakan 1/4 dari 100 sehingga dalam perhitungan persen akan menjadi lebih mudah. Pertama dilakukan random untuk mendapatkan angka antara 0-10, hasilnya akan dipipe dan dibagi sepuluh, angka inilah yang nanti digunakan sebagai waktu sleep. Kedua ada perhitungan belum dan persen dimana belum merupakan 25 (total iterasi) dikurangi $i (iterasi saat ini) dan persen merupakan persentasi selesainya progress bar. Ketiga ada sub_bar, sub_bar ini pecahan yang menjadi penyusun bar nanti, dimana dibagi menjadi 2 yaitu "#" untuk menggambarkan selesai dan "-" untuk menggambarkan belum selesai. Cara kerja sub_bar adalah melakukan print space atau " " sebanyak variabel yang menentukan jumlah mereka ($i untuk selesai dan $belum untuk belum selesai), nanti print tersebut di pipe ke command ___tr___ yang memungkinkan untuk menukar " " menjadi karakter yang kita mau yaitu "#" dan "-". Terakhir melakukan echo -ne yang dimana memungkinkan echo untuk tidak print newline dan mengeksekusi seperti \r yang menjadikan teks bisa terefresh atau terisi kembali dengan iterasi berikutnya 

*c. Time*  
Membuat program jam yang refresh tiap satu detik dengan format tanggal dan jam
``` bash
while [ 1 ]
do
  waktu=$(date +'%x (%H:%M:%S)')
  echo  -n -e "$waktu\r"
  sleep 1
done
```
Infinity loop dan melakukan pemanggilan command date yang mengahsilkan tanggal dan jam, dimana %x untuk tanggal dan %H:%M:%S untuk jam:menit:sekon. Selanjutnya diprint  dengan echo -ne dengan \r agar tiap loop merefresh yang sebelumnya dan tidak melakukan newline, tidak lupa sleep 1 agar updatenya tiap 1 detik.

*d. Money*  
Membuat program serupa dengan cmatrix namun dengan menampilkan tanda mata uang
```bash
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
```
*e. Brain Damage*  
Membuat program serupa ps aux namun update tiap 1 detik
``` bash
while [ 1 ]
  do
    clear
    printf "%-2s %-6s %-10s %-6s %-6s %-6s %s\n" " " "PID" "USER" "%CPU" "%MEM" "TIME" "COMMAND" # header tabel
    ps aux --sort=pid | awk 'NR>1 {printf "%-2s %-6s %-10s %-6s %-6s %-6s %s\n"," ", $2, $1, $3, $4, $10, $11}' # ps aux disort berdasarkan pid, terus diambil isi kolom 1,2,3,4,10,1 pada baris > 1
    sleep 1
  done
```
### Nomor 4 (Aria)    
./pokemon.sh pokemon_usage.csv --help  
./pokemon.sh pokemon_usage.csv --info  
./pokemon.sh pokemon_usage.csv --sort Usage%  
./pokemon.sh pokemon_usage.csv --grep Pincurchin  
./pokemon.sh pokemon_usage.csv --filter Electric  

