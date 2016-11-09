export NMON=lcmnudto.
alias hg="history|grep"



alias cl='clear'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias l='ls --color -l'
alias la='ls --color -la'
alias lh='ls --color -lh'

# helge.laurisch@ext.gfk.com added this:
alias ..='cd ..'
alias h='history'
alias hg='history | grep'
alias psg='/bin/ps auxwww | grep -v grep | grep'
alias ng='netstat -tulpen|grep -i'
alias kcon="kafka-console-consumer.sh --zookeeper $ZOOKEEPER_URI --topic $@"
alias kprod="kafka-console-producer.sh --broker-list $KAFKA_BROKER_LIST --topic $@"
alias ktopic="kafka-topics.sh --zookeeper $ZOOKEEPER_URI $@"
alias ip_pub="facter -p ec2_public_ipv4"
alias ip_priv="facter -p ipaddress"


if [ -d ~/.profile.d ];then
  for profile_found in ~/.profile.d/*sh
  do
    . $profile_found
  done
fi

