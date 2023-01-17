#¬/bin/bash
# get words from: https://www.polishpod101.com/polish-word-lists/?list=1
# get cases from: https://www.polonista.pl/jutro
LOOP=""
PREVIOUS=0
FILE="flashCards.csv"
ORDER="${1:-r}"

while  [ "$LOOP" == "" ]
  do for i in $(shuf $FILE)
  do POLISH=$(echo $i | cut -d ',' -f1)
  ENGLISH=$(echo $i | cut -d ',' -f2)
    printf '\n%.0s' $(seq 1 $(tput lines))
    if [ $ORDER = "e" ]; then
      printf $ENGLISH
      read
      printf $POLISH
      read
    elif [ $ORDER = "p" ]; then
      printf $POLISH
      read
      printf $ENGLISH
      read
    elif [ $ORDER = "r" ]; then
      CHOICE=$((1 + $RANDOM % 100))
      if [ $CHOICE -gt 50 ]; then
        printf $ENGLISH
        read
        printf $POLISH
        read
      else
        printf $POLISH
        read
        printf $ENGLISH
        read
      fi
    fi
  done
done
