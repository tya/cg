#############################################################################
# FILE: .bashrc
#
# This file loads Ty's session settings.  This file is sourced for each
# new session.
#
#############################################################################

#############################################################################
# source /etc/bashrc
#############################################################################
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#############################################################################
# source ~/.alias
#############################################################################
# source aliases
if [ -f ${HOME}/.bash_aliases ]; then
    source ${HOME}/.bash_aliases
fi

#############################################################################
# set display
#############################################################################
if [ -f ${HOME}/.display ]; then
    export DISPLAY=`cat ${HOME}/.display`
    #echo DISPLAY=$DISPLAY
else
    # parse the ssh client ip out of $SSH_CLIENT and assign to $DISPLAY
    if [[ $SSH_CLIENT =~ '(.*)\s.*\s.*' ]]; then
	export DISPLAY=${BASH_REMATCH[1]}:0.0
	#echo DISPLAY=$DISPLAY
    fi
fi
