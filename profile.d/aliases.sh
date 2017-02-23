#!/bin/bash

alias ..='cd ..'
alias cd..='cd ..'
alias grep='egrep'
alias grep='grep -i'
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;34'
alias grepr='grep -r'

# -- tail
alias tailf='tail -1000f'
alias mtail='multitail -C '

# -- history
alias h='history'
alias hg='history|grep'

# -- ls
alias ls='ls --color=auto'
alias l='ls'
alias ll='ls -l'
alias lla='ls -l -a'

# -- apt
alias a='aptitude'
alias apt='aptitude'
alias agi='apt install'
alias agu='apt update'
alias agU='apt upgrade'
alias agr='apt remove'
alias agp='apt --Purge remove'
alias acS='apt show'
alias acp='apt-cache policy'
function acs
{
	apt-cache search "$@" | grep "$@"
}

aptsearch ()
{
    # Search and highlight keyword  in the restuls
    export GREP_COLOR='1'
    # Remove regexp patterns from the keyword to highlight
    keyword=`echo -n "$1" | sed -e 's/[^[:alnum:]|-]//g'`
    echo_bold "Highlight keyword: $keyword"
    aptitude search "$1" --disable-columns | egrep --color "$keyword" 

    # Use the matching results to complete our install command
    matching=$(aptitude search --disable-columns -F "%p" "$1" | tr '\n' ' ') 
    count=0
    for i in $matching ; do
        count=$((count + 1))
    done
    complete -W '$matching' aptinstall
    echo_bold "(Matching packages: $count)"
    if ! [ -z $2 ] ; then
        echo -e "$matching" | egrep --color=always "$keyword"
    fi
}

# -- ps
alias pss='ps auxww'
alias psg='pss | grep -v grep |grep'

# -- tail
alias ttail='multitail -s 2 -C'

# -- netstat
alias ng='netstat -anp|grep'

# -- wget
alias hget='wget -qO - '

# -- logs
alias logs='multitail -C -s 2 $(find /var/log/ -type f -cmin -15)'

# -- catx
alias catx='vim --cmd "set t_ti= t_te=" +redraw +q'

# -- http-mem-average
httpmem() {
	ps aux | grep 'httpd' | awk '{print $6/1024;}' | awk '{avg += ($1 - avg) / NR;} END {print "Average HTTPD Memory Usage: " avg " MB";}'
}
# -- haproxy-cli
hapcli()
{
	echo $@ | socat - UNIX-CLIENT:/var/run/haproxy.stats
}
# -- haproxy-cli
haprevcli()
{
	echo $@ | socat - UNIX-CLIENT:/var/run/reverse_haproxy.stats
}

# -- puppet
alias pa='puppet agent'
alias pr='puppet resource'
alias pd='puppet describe'
alias pds='puppet describe -s'
alias ph='puppet help'
alias pc='puppet cert'
alias pcl='puppet cert list'
alias pcs='puppet cert sign'
alias pcr='puppet cert revoke'

alias dpl='dpkg -l | grep'
alias dpL='dpkg -L'
alias dpS='dpkg -s'
alias S='service'

SR(){
	service $1 ${2:-"restart"}
}

# -- dstat
alias ds='dstat -c --top-cpu -d --top-bio --top-latency -ndymlp 5 25'

# strace 

#alias strace='strace -s1000 -q -a -f -e open,close,read,write,socket'

lsnap ()
{
  if [ -d $(readlink -f "$1") ]; then
    ls -latrd /.SNAPSHOT/*$(readlink -f "$1")
  else
    ls -latr /.SNAPSHOT/*$(readlink -f "$1")
  fi
}
function settitle() { echo -ne "\e]2;$@\a\e]1;$@\a"; }
function cd() { command cd "$@"; settitle $(hostname -s|tr a-z A-Z)":"$(pwd -P); }
function ssh() { settitle "$(echo $@|tr a-z A-Z)"; command ssh "$@"; settitle $(hostname -s|tr a-z A-Z)":"$(pwd -P); }
alias git_pushit="git add $@; git commit -m 'minor updates'; git push -u origin "
alias git_pushall="git add --all; git commit -m 'minor updates'; git push -u origin "
alias git_clone_branch_push_pr="git clone $1; git checkout -b $2; git status; echo;echo; echo now do git_pushall; git push -u origin "
alias git_pullall="git pull --rebase --prune; git submodule update --init --recursive"
