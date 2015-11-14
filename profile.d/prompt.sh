#!/bin/bash

export HOSTSTAGE=${INFLUXDB_HOST/*\./}
export PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME}-${HOSTSTAGE}\007"'

case $TERM in
  screen*)
    SCREENTITLE='\[\ek\e\\\]\[\ek\u@\h\w\e\\\]'
    ;;
  *)
    SCREENTITLE=''
    ;;
esac
#export PS1="${SCREENTITLE}\[\e[1;34m\][\[\e[0;34m\]\h-${HOSTSTAGE}\[\e[1;34m\]]\[\e[1;34m\][\[\e[0;32m\]\w\[\e[1;34m\]]> \[\e[0m\]"
export PS1='[\[\033[1;31m\]\u\[\033[0m\]@\h'-${HOSTSTAGE}' \W]\$ '


