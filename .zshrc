# -*- mode: sh -*-
################################################################################
#
# ZSH Setup
#
################################################################################
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.oh-my-zsh-custom
ZSH_THEME=risto

# Use red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Disable auto correction
DISABLE_CORRECTION="true"

# Disable autosetting terminal title for itab/ititle/iboth
DISABLE_AUTO_TITLE="true"

# activate highlighters
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

fpath=(/usr/local/share/zsh-completions $fpath)

# Load plugings (see  ~/.oh-my-zsh/plugins/* and ${ZSH_CUSTOM}/plugins/)
#plugins=(personalize ant brew brew-cask colorize cp docker docker-compose fabric fzf golang gem history jsontools knife osx perl pip pylint python rails rake redis-cli rsync ruby ssh-agent sudo urltools thor vagrant virtualenv web-search sendgrid zsh-syntax-highlighting)
plugins=(personalize ant brew colorize cp docker docker-compose fzf golang gem history jsontools osx perl pip pylint python rsync ruby sudo urltools thor vagrant virtualenv web-search zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
autoload -U compinit && compinit

PATH="/Users/tyalexander/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/tyalexander/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/tyalexander/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/tyalexander/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/tyalexander/perl5"; export PERL_MM_OPT;

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
