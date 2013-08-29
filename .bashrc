#############################################################################
# FILE: .bashrc
#
# This file loads Ty's session settings.  This file is sourced for each
# new session.
#
#############################################################################

#echo "INFO: loading .bashrc"

#############################################################################
# source /etc/bashrc
#############################################################################
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi


#############################################################################
# source ~/.bash_exports
#############################################################################
# source exports
if [ -f ${HOME}/.bash_exports ]; then
    source ${HOME}/.bash_exports
fi


#############################################################################
# source ~/.bash_functions
#############################################################################
# source aliases
if [ -f ${HOME}/.bash_functions ]; then
    source ${HOME}/.bash_functions
fi


#############################################################################
# source ~/.bash_aliases
#############################################################################
# source aliases
if [ -f ${HOME}/.bash_aliases ]; then
    source ${HOME}/.bash_aliases
fi

#############################################################################
# source ~/.bash_alias_wayinhub
#############################################################################
# source aliases
if [ -f ${HOME}/.bash_wayinhub ]; then
    source ${HOME}/.bash_wayinhub
fi

#############################################################################
# color command terminal
# see https://wiki.archlinux.org/index.php/Color_Bash_Prompt
#############################################################################
#export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="verbose"

#                [                    username              @                    hostname               pwd                     git-status                rest
export PS1='\[\e[0;32m\][\[\e[m\]\[\e[1;34m\]\u\[\e[m\]\[\e[0;36m\]@\[\e[m\]\[\e[0;31m\]\h\[\e[m\] \[\e[1;34m\]\w\[\e[m\] $(__git_ps1 " (%s)")\[\e[m\]\[\e[0;32m\] \[\e[0;31m\]\$\[\e[0;32m\]] '

#############################################################################
# Bash completion settings 
#############################################################################
bind "set completion-ignore-case on"

if [ -f ${HOME}/.bash_completion ]; then
    . ${HOME}/.bash_completion
fi

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

if [ -f `brew --prefix git`/etc/bash_completion.d/git-completion.bash ]; then
    . `brew --prefix git`/etc/bash_completion.d/git-completion.bash
fi


#############################################################################
# Call personal functions
#############################################################################
setjavadefault
nodebug
cleanpath

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
