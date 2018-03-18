#!/bin/bash
# usage: ./dictation.sh words.txt
# change the voice to your desired language (Yuri and Milena speak russian)

test ! -f $1 && echo -e "\a❌  FILE NOT FOUND" && exit 1

# shuffle: http://stackoverflow.com/a/17581317/79461
for word in $(cat $1 | perl -MList::Util=shuffle -e 'print shuffle<STDIN>' ); do
  say --voice=Yuri $word
  read answer; test "$word" = "$answer" && echo "✓" && continue

  echo -e "\a ❌ "

  say --voice=Milena $word
  read answer; test "$word" = "$answer" && echo "✓" && continue

  echo -e "\a → $word        (⏎ to continue)"; read wait
done
