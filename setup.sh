#!/bin/sh
#this script will setup bash specifics using the configs in this repo


cd ~/
if [ -d ~/bash_profile/ ]; then
   echo self relocating to ~/.bash_profile_source >&2
   mv ~/bash_profile/ ~/.bash_profile_source
   cd ~/.bash_profile_source
fi

files="bash bash_profile bash_login bash_aliases bashrc profile bash_completion bash_logout profile.d"
date=`date +"%Y%m%d"`

for file in $files; do
    if [ -h ~/.$file ]; then
        unlink ~/.$file
    else
        if [ -f ~/.$file ]; then
      if [ ! -d ~/.bash_profile_backup/$date ]; then
               mkdir -p ~/.bash_profile_backup/$date
            fi
      if [ ! -d ~/.bash_profile/ ]; then
          mkdir -p ~/.bash_profile/
            fi
            echo "backing up ~/.$file to ~/.bash_profile_backup/$date/$file" >&2
            mv ~/.$file ~/.bash_profile_backup/$date/$file
        fi
    fi
    echo "symlinking $PWD/$file to ~/.$file" >&2
    ln -s ~/.bash_profile_source/$file ~/.$file
done

if [ -d ~/.profile.d/ ]; then
   if [ ! -d ~/.bash_profile_backup/$date ]; then
      mkdir -p ~/.bash_profile_backup/$date
   fi
   echo "backing up ~/.profile.d to ~/.bash_profile_backup/$date/profile.d" >&2
   mv ~/.profile.d ~/.bash_profile_backup/$date/profile.d
   ln -s ~/.bash_profile_source/profile.d ~/.profile.d
fi

if [ -d ~/bin ]
  then cp -d ~/.bash_profile_source/bin/* ~/bin
else cp -rd ~/.bash_profile_source/bin ~/bin
fi

