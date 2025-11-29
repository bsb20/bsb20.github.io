#! /bin/bash

for i in $(ls ./*.jpeg | grep -v small)
do 
    base="${i%.*}"
    magick -verbose "${base}.jpeg" -resize 600x448 -gravity center -extent 600x448 "${base}_small.jpeg"
    echo $base
done
