#############################################################################
# FILE: .bash_profile
#
# This file loads Ty's login in session settings.  This file is sourced 
# for each login in session.
#
#############################################################################

#echo "INFO: loading .bash_profile"

#############################################################################
# source other files
#############################################################################
# get the aliases and functions
if [ -f ${HOME}/.bashrc ]; then
    . ${HOME}/.bashrc
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
# path settings
#############################################################################
# /usr/local/bin
if [ -d /usr/local/bin ]; then
    export PATH=/usr/local/bin:${PATH}
fi

# ${HOME}/.local/bin
if [ -d ${HOME}/.local/bin ]; then
    export PATH=${HOME}/.local/bin:${PATH}
fi

# ${HOME}/.rvm/bin
if [ -d ${HOME}/.rvm/bin ]; then
    export PATH=${HOME}/.rvm/bin:${PATH}
fi

# ${HOME}/bin
if [ -d ${HOME}/bin ]; then
    export PATH=${HOME}/bin:${PATH}
fi

# /usr/local/share/npm/bin
if [ -d /usr/local/share/npm/bin ]; then
    export PATH=/usr/local/share/npm/bin:${PATH}
fi

# cassandra
if [ -d ${CASSANDRA_HOME}/bin ]; then
    export PATH=${CASSANDRA_HOME}/bin:${PATH}
fi

# /usr/local/mysql/bin (mysql)
if [ -d /usr/local/mysql/bin ]; then
    export PATH=${PATH}:/usr/local/mysql/bin
fi

# /usr/local/sbin
if [ -d /usr/local/sbin ]; then
    export PATH=${PATH}:/usr/local/sbin
fi

# /usr/sbin
if [ -d /usr/sbin ]; then
    export PATH=${PATH}:/usr/sbin
fi

# sbin
if [ -d /sbin ]; then
    export PATH=${PATH}:/sbin
fi

cleanpath


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
