#! /bin/bash

echo "Welcome to Password Generator!"

echo -n "Desired character length: "
read length

echo -n "Include uppercase letters? "
read upper

echo -n "Include numbers? "
read num

echo -n "Include special characters? "
read specChar

charArray=({a..z})

if [ "$upper" = "y" ]; then
    upperArray=({A..Z})
    charArray+=("${upperArray[@]}")
fi

if [ "$num" = "y" ]; then
    numArray=({0..9})
    charArray+=("${numArray[@]}")
fi

if [ "$specChar" = "y" ]; then
    charArray+=("!" "@" "#" "$" "%" "&" "?") 
fi

password=""
charArrayLen=${#charArray[@]}

for ((i=0 ; i < length ; i++)); do
    idx=$(($RANDOM % ($charArrayLen - 1 - 0 + 1) + 0))
    password+=${charArray[$idx]}
done

echo $password