#!/bin/bash

function check {
    read answer;
    if [ "$1" = "$answer" ]; then
      echo "✓"
      return 0
    else
     echo -e "\a ❌ "
     return 1
    fi
}

for f in $(cat words.txt ); do
    say --voice=Yuri   $f && check $f && continue
    say --voice=Milena $f && check $f && continue
    echo "= $f (press to continue)"
    read wait
done
