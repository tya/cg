#############################################################################
# FILE: .bash_profile
#
# This file loads Ty's login in session settings.  This file is sourced 
# for each login in session.
#
#############################################################################

#############################################################################
# source other files
#############################################################################
# get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi


#############################################################################
# general shell settings
#############################################################################
shopt -s checkwinsize     # check the window size after each command
set -o noclobber          # don't overwrite existing files with >
set -o ignoreeof          # don't terminate session on ^D input
set -o emacs              # set shell to use emacs key bindings

if [ -f /usr/bin/xset ]; then
    xset b off            # turn bell off
fi


#############################################################################
# history settings
#############################################################################
# append shell history when shell exit
shopt -s histappend

# whenever displaying the prompt, write the previous line to disk:
PROMPT_COMMAND='history -a'


#############################################################################
# Bash completion settings 
#############################################################################
bind "set completion-ignore-case on"

if [ -f ${HOME}/.bash_completion ]; then
    . ${HOME}/.bash_completion
fi

if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi


#############################################################################
# path settings
#############################################################################
# ~/bin
if [ -d ${HOME}/bin ]; then
    export PATH=${PATH}:${HOME}/bin
fi

# ~/.local/bin
if [ -d ${HOME}/.local/bin ]; then
    export PATH=${PATH}:${HOME}/.local/bin
fi

# ~/scripts
if [ -d ${HOME}/scripts ]; then
    export PATH=${PATH}:${HOME}/scripts
fi

# /usr/local/mysql/bin (mysql)
if [ -d /usr/local/mysql/bin ]; then
    export PATH=${PATH}:/usr/local/mysql/bin
fi

# /opt/local/bin (macports)
if [ -d /opt/local/bin ]; then
    export PATH=/opt/local/bin:${PATH}
fi

# /opt/local/sbin (macports)
if [ -d /opt/local/bin ]; then
    export PATH=/opt/local/sbin:${PATH}
fi

# sbin
if [ -d /sbin ]; then
    export PATH=${PATH}:/sbin
fi

# /usr/sbin
if [ -d /usr/sbin ]; then
    export PATH=${PATH}:/usr/sbin
fi

# /usr/local/sbin
if [ -d /usr/local/sbin ]; then
    export PATH=${PATH}:/usr/local/sbin
fi

#############################################################################
# fink setup
#############################################################################
# /usr/local/sbin
if [ -f /sw/bin/init.sh ]; then
    . /sw/bin/init.sh
fi

cleanpath

