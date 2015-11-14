# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.
#ensure our ssh-agent is running and that our keys are added

#move on to .bashrc
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi


#allow users to specify their own ~/.profile
if [ -f ~/.profile.`whoami` ]; then
    source ~/.profile.`whoami`
fi

#allow users to specify additional profiles from ~/.profile.d
ls -1 ~/.profile.d/* | while read myProfile
do
   source $myProfile
done


