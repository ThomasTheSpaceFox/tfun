#!/bin/bash
WHEREAMI="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd && echo)"
cd $WHEREAMI
PIXVIEW=$(sed '1q;d' $WHEREAMI/config.txt)
MEDIAPLAY=$(sed '2q;d' $WHEREAMI/config.txt)
URLCALL=$(sed '4q;d' $WHEREAMI/config.txt)
FNAME1=$1
SOURCEDIR=$(dirname "$1")
MEDIADIR=$SOURCEDIR/$(sed '4q;d' $FNAME1)
echo $1 > bangdebug.txt
echo $FNAME1 >> bangdebug.txt
echo $SOURCEDIR >> bangdebug.txt
echo $MEDIADIR >> bangdebug.txt
echo "Thomas's Text Function System"
echo "(c) 2015 Thomas Leathers"
echo "___________________________________________________"
QCOUNT=5
echo "these text-fun .txt programs were found:"
echo "___________________________________________________"
echo ""
WHEREAMI="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd && echo)"
cd $WHEREAMI
echo "enter name of valid text-fun .txt file"
echo "text-fun .txt files and their media directories, should be under"
echo "the games directory under text-fun's directory."
echo "___________________________________________________"
echo "$FNAME1" > $MEDIADIR/debug.txt
tput clear
GAMENAME=$(sed '2q;d' $FNAME1)
echo "$GAMENAME"
GAMEAUTH=$(sed '3q;d' $FNAME1)
echo "$GAMEAUTH"
echo "resetting score tables" >> $MEDIADIR/debug.txt
SCORE=0
SCOREOF=0
until [ "$(sed ''$QCOUNT'q;d' $FNAME1)" = "END" ]
do
  if [ "$(sed ''$QCOUNT'q;d' $FNAME1)" = "TXT-ART" ]; then
    CNT1=$(echo "$QCOUNT+1" | bc)
    QCOUNT=$CNT1
    echo "draw TEXT-ART" >> $MEDIADIR/debug.txt
    until [ "$(sed ''$QCOUNT'q;d' $FNAME1)" = "END-TXT-ART" ]
    do
      echo "$(sed ''$QCOUNT'q;d' $FNAME1)"
      CNT1=$(echo "$QCOUNT+1" | bc)
      QCOUNT=$CNT1
    done
    CNT1=$(echo "$QCOUNT+1" | bc)
    QCOUNT=$CNT1
  fi
  if [ "$(sed ''$QCOUNT'q;d' $FNAME1)" = "TEXT" ]; then
    CNT1=$(echo "$QCOUNT+1" | bc)
    QCOUNT=$CNT1
    echo "issue TEXT" >> $MEDIADIR/debug.txt
    until [ "$(sed ''$QCOUNT'q;d' $FNAME1)" = "END-TEXT" ]
    do
      echo "$(sed ''$QCOUNT'q;d' $FNAME1)"
      CNT1=$(echo "$QCOUNT+1" | bc)
      QCOUNT=$CNT1
    done
    CNT1=$(echo "$QCOUNT+1" | bc)
    QCOUNT=$CNT1
  fi
  if [ "$(sed ''$QCOUNT'q;d' $FNAME1)" = "PIXMAP" ]; then
    CNT1=$(echo "$QCOUNT+1" | bc)
    QCOUNT=$CNT1
    until [ "$(sed ''$QCOUNT'q;d' $FNAME1)" = "END-PIXMAP" ]
    do
      echo "call pixmap $(sed ''$QCOUNT'q;d' $FNAME1)" >> $MEDIADIR/debug.txt
      $PIXVIEW "$MEDIADIR/$(sed ''$QCOUNT'q;d' $FNAME1)" >> $MEDIADIR/debug.txt
      CNT1=$(echo "$QCOUNT+1" | bc)
      QCOUNT=$CNT1
    done
    CNT1=$(echo "$QCOUNT+1" | bc)
    QCOUNT=$CNT1
  fi
  if [ "$(sed ''$QCOUNT'q;d' $FNAME1)" = "MEDIAPLAY" ]; then
    CNT1=$(echo "$QCOUNT+1" | bc)
    QCOUNT=$CNT1
    until [ "$(sed ''$QCOUNT'q;d' $FNAME1)" = "END-MEDIAPLAY" ]
    do
      echo "call media $(sed ''$QCOUNT'q;d' $FNAME1)" >> $MEDIADIR/debug.txt
      $MEDIAPLAY "$MEDIADIR/$(sed ''$QCOUNT'q;d' $FNAME1)" >> $MEDIADIR/debug.txt
      CNT1=$(echo "$QCOUNT+1" | bc)
      QCOUNT=$CNT1
    done
    CNT1=$(echo "$QCOUNT+1" | bc)
    QCOUNT=$CNT1
  fi
  if [ "$(sed ''$QCOUNT'q;d' $FNAME1)" = "BASHCALL" ]; then
    CNT1=$(echo "$QCOUNT+1" | bc)
    QCOUNT=$CNT1
    until [ "$(sed ''$QCOUNT'q;d' $FNAME1)" = "END-BASHCALL" ]
    do
      echo "bashcall $(sed ''$QCOUNT'q;d' $FNAME1)" >> $MEDIADIR/debug.txt
      $MEDIADIR/$(sed ''$QCOUNT'q;d' $FNAME1)
      CNT1=$(echo "$QCOUNT+1" | bc)
      QCOUNT=$CNT1
    done
    CNT1=$(echo "$QCOUNT+1" | bc)
    QCOUNT=$CNT1
  fi
  if [ "$(sed ''$QCOUNT'q;d' $FNAME1)" = "WAIT-NULL" ]; then
    CNT1=$(echo "$QCOUNT+1" | bc)
    QCOUNT=$CNT1
    echo "issue wait-null" >> $MEDIADIR/debug.txt
    until [ "$(sed ''$QCOUNT'q;d' $FNAME1)" = "END-WAIT-NULL" ]
    do
      echo $(sed ''$QCOUNT'q;d' $FNAME1)
      CNT1=$(echo "$QCOUNT+1" | bc)
      QCOUNT=$CNT1
      read $(sed ''$QCOUNT'q;d' $FNAME1)
      CNT1=$(echo "$QCOUNT+1" | bc)
      QCOUNT=$CNT1
    done
    CNT1=$(echo "$QCOUNT+1" | bc)
    QCOUNT=$CNT1
  fi
  if [ "$(sed ''$QCOUNT'q;d' $FNAME1)" = "URL-CALL" ]; then
    CNT1=$(echo "$QCOUNT+1" | bc)
    QCOUNT=$CNT1
    until [ "$(sed ''$QCOUNT'q;d' $FNAME1)" = "END-URL-CALL" ]
    do
      echo "call URL $(sed ''$QCOUNT'q;d' $FNAME1)" >> $MEDIADIR/debug.txt
      $URLCALL "$(sed ''$QCOUNT'q;d' $FNAME1)" >> $MEDIADIR/debug.txt
      CNT1=$(echo "$QCOUNT+1" | bc)
      QCOUNT=$CNT1
    done
    CNT1=$(echo "$QCOUNT+1" | bc)
    QCOUNT=$CNT1
  fi
  if [ "$(sed ''$QCOUNT'q;d' $FNAME1)" = "QUIZ-Q" ]; then
    CNT1=$(echo "$QCOUNT+1" | bc)
    QCOUNT=$CNT1
    CNT3=$(echo "$SCOREOF+1" | bc)
    SCOREOF=$CNT3
    echo "issue QUIZ QUESTION" >> $MEDIADIR/debug.txt
    until [ "$(sed ''$QCOUNT'q;d' $FNAME1)" = "END-QUIZ-Q" ]
    do
      until [ "$(sed ''$QCOUNT'q;d' $FNAME1)" = "-A" ]
      do
      echo $(sed ''$QCOUNT'q;d' $FNAME1)
      CNT1=$(echo "$QCOUNT+1" | bc)
      QCOUNT=$CNT1
      done
      CNT1=$(echo "$QCOUNT+1" | bc)
      QCOUNT=$CNT1
      read AWNS
      if [ "$AWNS" = "$(sed ''$QCOUNT'q;d' $FNAME1)" ]; then
        echo "$AWNS is correct"
        CNT2=$(echo "$SCORE+1" | bc)
        SCORE=$CNT2
        CNT1=$(echo "$QCOUNT+1" | bc)
        QCOUNT=$CNT1
      else
        echo "$AWNS is incorrect the Awnser was $(sed ''$QCOUNT'q;d' $FNAME1)"
        CNT1=$(echo "$QCOUNT+1" | bc)
        QCOUNT=$CNT1
      fi
    done
    CNT1=$(echo "$QCOUNT+1" | bc)
    QCOUNT=$CNT1
    AWNS=nullvaliue
  fi
  if [ "$(sed ''$QCOUNT'q;d' $FNAME1)" = "QUIZ-SCORE" ]; then
    CNT1=$(echo "$QCOUNT+1" | bc)
    QCOUNT=$CNT1
    echo "print Quiz score" >> $MEDIADIR/debug.txt
    echo "your score is $SCORE/$SCOREOF"
    until [ "$(sed ''$QCOUNT'q;d' $FNAME1)" = "END-QUIZ-SCORE" ]
    do
      if [ "$(sed ''$QCOUNT'q;d' $FNAME1)" = "-C" ]; then
        echo "resetting score tables" >> $MEDIADIR/debug.txt
        SCORE=0
        SCOREOF=0
        CNT1=$(echo "$QCOUNT+1" | bc)
        QCOUNT=$CNT1
      else
        echo "$(sed ''$QCOUNT'q;d' $FNAME1)"
        CNT1=$(echo "$QCOUNT+1" | bc)
        QCOUNT=$CNT1
      fi
      if [ "$(sed ''$QCOUNT'q;d' $FNAME1)" = "-P" ]; then
        echo "print score to $MEDIADIR/score.txt" >> $MEDIADIR/debug.txt
        echo -e "score for $GAMENAME \n $SCORE/$SCOREOF" > $MEDIADIR/score.txt
        CNT1=$(echo "$QCOUNT+1" | bc)
        QCOUNT=$CNT1
      fi
    done
    CNT1=$(echo "$QCOUNT+1" | bc)
    QCOUNT=$CNT1
  fi
  if [ "$(sed ''$QCOUNT'q;d' $FNAME1)" = "TIMGCALL" ]; then
    CNT1=$(echo "$QCOUNT+1" | bc)
    QCOUNT=$CNT1
    if test -e "$MEDIADIR/$(sed ''$QCOUNT'q;d' $FNAME1)"; then
      echo "draw T-IMG terminal image. $(sed ''$QCOUNT'q;d' $FNAME1)" >> $MEDIADIR/debug.txt
      $WHEREAMI/T-IMG.sh "$MEDIADIR/$(sed ''$QCOUNT'q;d' $FNAME1)"
      CNT1=$(echo "$QCOUNT+1" | bc)
      QCOUNT=$CNT1
    else
      echo "NONEXIST ERROR: the T-IMG image file $MEDIADIR/$(sed ''$QCOUNT'q;d' $FNAME1) is NON-EXISTANT!"
      echo "NONEXIST ERROR: the T-IMG image file $MEDIADIR/$(sed ''$QCOUNT'q;d' $FNAME1) is NON-EXISTANT!" >> $MEDIADIR/debug.txt
    fi
    CNT1=$(echo "$QCOUNT+1" | bc)
    QCOUNT=$CNT1
  fi
  if [ "$(sed ''$QCOUNT'q;d' $FNAME1)" = "CLEAR" ]; then
    CNT1=$(echo "$QCOUNT+1" | bc)
    QCOUNT=$CNT1
    echo "clear screen" >> $MEDIADIR/debug.txt
    tput clear
  fi
  if [ "$(sed ''$QCOUNT'q;d' $FNAME1)" = "BELL" ]; then
    CNT1=$(echo "$QCOUNT+1" | bc)
    QCOUNT=$CNT1
    echo "BELL" >> $MEDIADIR/debug.txt
    echo -e -n "\a"
  fi
  if [ "$(sed ''$QCOUNT'q;d' $FNAME1)" = "SKIP" ]; then
    CNT1=$(echo "$QCOUNT+1" | bc)
    QCOUNT=$CNT1
    echo "Skip section:" >> $MEDIADIR/debug.txt
    until [ "$(sed ''$QCOUNT'q;d' $FNAME1)" = "END-SKIP" ]
    do
      echo "$(sed ''$QCOUNT'q;d' $FNAME1)" >> $MEDIADIR/debug.txt
      CNT1=$(echo "$QCOUNT+1" | bc)
      QCOUNT=$CNT1
    done
    echo "end of skiped scection" >> $MEDIADIR/debug.txt
    CNT1=$(echo "$QCOUNT+1" | bc)
    QCOUNT=$CNT1
  fi
done
echo "issue END (END-OF-PROGRAM)" >> $MEDIADIR/debug.txt