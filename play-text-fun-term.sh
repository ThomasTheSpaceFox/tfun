#!/bin/bash
WHEREAMI="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd && echo)"
cd $WHEREAMI
GAMENAME=$(sed '2q;d' $1)
TERM="$(sed '3q;d' $WHEREAMI/config.txt)"
$TERM --title "TFUN: $GAMENAME" -e $(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd && echo)/text-fun-term.sh "$1"