#¬/bin/bash
# get words from: https://www.polishpod101.com/polish-word-lists/?list=1
# get cases from: https://www.polonista.pl/jutro
LOOP=""
PREVIOUS=0
FILE="flashCards.csv"
while  [ "$LOOP" == "" ]
  do LN=$(( $RANDOM % $(wc -l $FILE | cut -d ' ' -f1) + 1 ))
  if [ $LN != $PREVIOUS ]
  then
    PREVIOUS=$LN
    POLISH=$(sed -n "$LN"p $FILE | cut -d ',' -f1)
    ENGLISH=$(sed -n "$LN"p $FILE | cut -d ',' -f2)
    printf '\n%.0s' $(seq 1 $(tput lines))
    if [ $1 = "r" ]; then
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
