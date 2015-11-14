#allow users to specify their own ~/.profile
if [ -f ~/.profile.`whoami` ]; then
    source ~/.profile.`whoami`
fi

#allow users to specify additional profiles from ~/.profile.d
if [ -d ~/.profile.d/ ]; then
   source ~/.profile.d/*
fi

#ensure our ssh-agent is running and that our keys are added
eval `ssh-agent` > /dev/null
keys=`ssh-add -l > /dev/null ; echo $?`
if [[ $keys != "0" ]]; then
    ssh-add
fi

#move on to .bashrc
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
