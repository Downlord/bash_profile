#!/bin/bash

export HOSTSTAGE=${INFLUXDB_HOST/*\./}

case $TERM in
  screen*)
    SCREENTITLE='\[\ek\e\\\]\[\ek\u@\h\w\e\\\]'
    ;;
  *)
    SCREENTITLE=''
    ;;
esac
if [ -z "$HOSTSTAGE" ]; then
        export PS1="${SCREENTITLE}\[\e[1;34m\][\[\e[0;34m\]\h\[\e[1;34m\]]\[\e[1;34m\][\[\e[0;32m\]\w\[\e[1;34m\]]> \[\e[0m\]"
else
	green=$(tput setaf 2)
	red=$(tput setaf 2)
	blue=$(tput setaf 4)
	bold=$(tput bold)
	reset=$(tput sgr0)
	export SHORTSTAGE=${HOSTSTAGE/uction/}
        export PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME}-${HOSTSTAGE}\007"'
        if [ "$HOSTSTAGE" = "preproduction" ]; then
		#export PS1='\[$blue$bold\][\h][\[$green$bold\]${SHORTSTAGE}\[$blue$bold\]]> \[$reset\]'
                export PS1="\e[1;34m[\e[0;34m\h\e[1;34m]\e[1;34m[\e[0;32m'${SHORTSTAGE}'\e[1;34m]> \e[0m"
        else
		#export PS1='\[$blue$bold\][\h][\[$red$bold\]${SHORTSTAGE}\[$blue$bold\]]> \[$reset\]'
                export PS1="\e[1;34m[\e[0;34m\h\e[1;34m]\e[1;34m[\e[0;31m'${SHORTSTAGE}'\e[1;34m]> \e[0m"
        fi
fi
shopt -s checkwinsize
