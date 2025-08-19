#!/usr/bin/env bash

#Error 1 = No arguments present
if (( $# == 0 )); then
  echo "$0 You did not enter any <Month><Days> pair as an argument."
  exit 1
fi

#Error 2 = Number of arguments are not even
if (( $# % 2 != 0 )); then
  echo "Error in $0: Arguments must come in pairs of <Month><Days>!"
  echo "Example = $0 Sept 30 Oct 31"
  exit 2
fi

#Error 3 = Number of days are not positive
i=1
while (( i <= $# )); do
  #Parse arguments in pairs of months, days. 
  month_argument=$i
  days_argument=$((i+1))
  month="${!month_argument}"   
  days="${!days_argument}"     
  # echo "PAIR: month=$month  days=$days"

  if ! [[ "$days" =~ ^[0-9]+$ ]] || (( days < 1 )); then
    echo "Skipping '$month $days' — days can be positive integers only."
  else
    #Create a directory for each month
    mkdir -p -- "$month"
    #Lopping from 1 to days, for each month(i) create file named i_Month.txt
    for (( n=1; n<=days; n++ )); do
      filename="${n}_${month}.txt"
      # If the file already exists, we will skip that step to avoid overwriting.
      if [[ -f "$month/$filename" ]]; then
        echo "[$0] Skipping existing file: $month/$filename"
        continue
      fi
      # Create file first with echo, add the heading, then move it into the directory
      echo "$n $month" > "$month/$filename"
    done
    echo "Created $days files in directory '$month'."
  fi

  i=$((i+2))
done
