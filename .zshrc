# -*- mode: sh -*-
################################################################################
#
# ZSH Setup
#
################################################################################
setup-zsh() {
   export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
   export ZSH_THEME=risto
}

# NOTE: zsh-syntax-highlighting must be last
setup-zsh-plugins() {
   plugins=(
     personalize
     brew
     colorize
     cp
     docker
     fzf
     gem
     golang
     history
     jsontools
     kubectl
     osx
     osx
     pip
     pylint
     python
     rsync
     ruby
     sudo
     thor
     tmux
     urltools
     virtualenv
     web-search
     zsh-completions
     zsh-syntax-highlighting
   )
}

setup-oh-my-zsh-custom() {
   ZSH_CUSTOM="${HOME}"/.oh-my-zsh-custom
   if [ ! -d "${ZSH_CUSTOM}" ]; then
      git clone https://github.com/tya/oh-my-zsh-custom "${ZSH_CUSTOM}"
   fi
}

setup-oh-my-zsh() {
   ZSH="${HOME}"/.oh-my-zsh
   if [ ! -d "${ZSH}" ]; then
      git clone https://github.com/robbyrussell/oh-my-zsh "${ZSH}"
   fi

   source $ZSH/oh-my-zsh.sh
}

setup() {
   setup-zsh
   setup-zsh-plugins
   setup-oh-my-zsh-custom
   setup-oh-my-zsh
}

setup
