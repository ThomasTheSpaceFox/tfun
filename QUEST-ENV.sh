#!/bin/bash
WHEREAMI="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd && echo)"
cd $WHEREAMI
QCOUNT=$(cat $WHEREAMI/qcount.txt)
FNAME2=$1
QUESTID=$(sed ''$QCOUNT'q;d' $WHEREAMI/games/$FNAME2)
echo "$QUESTID $FNAME2 $2"
done
until [ "$(sed ''$QCOUNT'q;d' $WHEREAMI/games/$FNAME2)" = "END-QUEST-ENV" ]
do
  until [ "" = "END-QUEST-ENV" ]
done
echo "$QCOUNT+1" | bc > qcount.txt
QCOUNT=$(cat $WHEREAMI/qcount.txt) 