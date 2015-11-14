#!/bin/bash

shopt -u hostcomplete
shopt -s cdspell
shopt -s nocasematch

if [ "$PS1" ]; then
  if [ "$BASH" ] && [ "$BASH" != "/bin/sh" ]; then
		bind '" ":magic-space'
		bind 'set completion-ignore-case on'
	fi
fi

# Don't keep useless history commands. Note the last pattern is to not
# keep dangerous commands in the history file.  Who really needs to
# repeat the shutdown(8) command accidentally from your command
# history?
HISTIGNORE='\&:fg:bg:ls:pwd:cd ..:cd ~-:cd -:cd:jobs:set -x:ls -l:ls -l'
export HISTIGNORE

# Disk is cheap. Memory is cheap. My memory isn't! Keep a lot of
# history by default. 10K lines seems to go back about 6 months, and
# captures all of the wacky one-off shell scripts that I might want
# again later.
export HISTSIZE=10000
export HISTFILESIZE=${HISTSIZE}

# Reduce redundancy in the history file
export HISTCONTROL=ignoredups

# Do not delete your precious history file before writing the new one
shopt -s histappend

# This is useful for embedded newlines in commands and quoted arguments
shopt -s lithist

unset MAILCHECK
set -P
set completion-ignore-case on
shopt -s cdspell
shopt -s extglob

set show-all-if-ambiguous on # single tab for autocomplete
set completion-ignore-case on

export HISTCONTROL=ignoreboth

export HISTTIMEFORMAT="[%H:%m:%S %d.%m.%Y] - "
