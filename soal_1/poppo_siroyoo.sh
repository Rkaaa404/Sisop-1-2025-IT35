#!/bin/bash

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

