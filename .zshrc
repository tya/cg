# -*- mode: sh -*-
################################################################################
#
# ZSH Setup
#
################################################################################
setup-zsh() {
   export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
   export ZSH_THEME=risto
   export COMPLETION_WAITING_DOTS="true"
   export DISABLE_AUTO_TITLE="true"
   export DISABLE_CORRECTION="true"
   if [ -d /opt/homebrew/share/zsh-completions ]; then
      fpath=(/opt/homebrew/share/zsh-completions $fpath)
   fi
}

# NOTE: zsh-syntax-highlighting must be last
setup-zsh-plugins() {
   plugins=(
     personalize
     colorize
     cp
     fzf
     kubectl
     sudo
     tmux
     urltools
     zsh-fast-syntax-highlighting
   )
   if [[ "$(uname)" == "Darwin" ]]; then
     plugins+=(brew)
   fi
}

setup-tynet-omz() {
   ZSH_CUSTOM="${HOME}"/.tynet-omz
   if [ ! -d "${ZSH_CUSTOM}" ]; then
      git clone https://github.com/tya/tynet-omz "${ZSH_CUSTOM}"
   fi
}

setup-oh-my-zsh() {
   ZSH="${HOME}"/.oh-my-zsh
   if [ ! -d "${ZSH}" ]; then
      git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh "${ZSH}"
   fi

   source $ZSH/oh-my-zsh.sh
}

setup-displays() {
  displayplacer "id:0CD51158-24CC-E8D1-C2B9-EE9B35FBD29F res:1792x1120 hz:59 color_depth:4 scaling:on origin:(0,0) degree:0" "id:A0662C74-8FE0-0445-FE47-AA33F77E11AC res:3840x2160 hz:60 color_depth:8 scaling:off origin:(-1053,-2160) degree:0" "id:9F475783-A21A-8B91-9990-F672E07C3D34 res:1692x3008 hz:60 color_depth:8 scaling:on origin:(2787,-2095) degree:270" "id:5B3D37D8-7F31-60EB-BB18-349C8FBC7406 res:1692x3008 hz:60 color_depth:8 scaling:on origin:(-2745,-2097) degree:90"
}

setup-path() {
   [[ -d "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"
}

setup() {
   setup-path
   setup-zsh
   setup-zsh-plugins
   setup-tynet-omz
   setup-oh-my-zsh
}

setup

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
