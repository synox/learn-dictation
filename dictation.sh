#!/bin/bash
if [ ! -f $1 ]; then
  echo -e "\a❌  unknown file '$1'";
  exit 1;
fi

for word in $(cat $1 ); do
  say --voice=Yuri $word;
  read answer; [ "$word" = "$answer" ] && echo "✓" && continue
  echo -e "\a ❌ "

  say --voice=Milena $word;
  read answer; [ "$word" = "$answer" ] && echo "✓" && continue

  echo -e "\a ❌  = $word (press to continue)"; read wait
done
