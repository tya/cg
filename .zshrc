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
     ansible
     brew
     colorize
     cp
     docker
     fzf
     golang
     history
     jsontools
     kubectl
     macos
     pip
     pylint
     python
     rsync
     sudo
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

setup-displays() {
  displayplacer "id:0CD51158-24CC-E8D1-C2B9-EE9B35FBD29F res:1792x1120 hz:59 color_depth:4 scaling:on origin:(0,0) degree:0" "id:A0662C74-8FE0-0445-FE47-AA33F77E11AC res:3840x2160 hz:60 color_depth:8 scaling:off origin:(-1053,-2160) degree:0" "id:9F475783-A21A-8B91-9990-F672E07C3D34 res:1692x3008 hz:60 color_depth:8 scaling:on origin:(2787,-2095) degree:270" "id:5B3D37D8-7F31-60EB-BB18-349C8FBC7406 res:1692x3008 hz:60 color_depth:8 scaling:on origin:(-2745,-2097) degree:90"
}

setup() {
   setup-zsh
   setup-zsh-plugins
   setup-oh-my-zsh-custom
   setup-oh-my-zsh
}

setup

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
