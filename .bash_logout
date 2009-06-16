#############################################################################
# FILE: .bash_logout
#
# This file loads Ty's logout settings.  This file is sourced for each
# session logout.
#
#############################################################################

#############################################################################
# Store $DISPLAY in /home/${HOME}/.display 
#############################################################################
if [ $DISPLAY ]; then
    if [ -f /home/${HOME}/.display ]; then
	rm -f /home/${HOME}/.display
    fi
    echo $DISPLAY > /home/${HOME}/.display
fi
