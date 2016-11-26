#!/bin/bash

for f in $(cat words.txt ); do
  for try in 1 2 3; do
    if [ $try -eq 1 ]; then
      say --voice=Yuri $f;
    elif [ $try -eq 2 ]; then
      say --voice=Milena $f;
    elif [ $try -eq 3 ]; then
      echo "= $f (press to continue)"
      read wait
      break
    fi
    read answer;
    if [ "$f" = "$answer" ]; then
      echo "✓"
      break
     else
         echo -e "\a ❌ "
      fi
  done
done
