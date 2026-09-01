# -*- mode: sh -*-
################################################################################
#
# ZSH setup — bootstrap tynet-omz
#
# tynet-omz is now framework-free (no oh-my-zsh). All shell config — prompt,
# completion, aliases, exports, per-domain files — lives in ~/.tynet-omz/.
# See https://github.com/tya/tynet-omz  (README).
#
# Homebrew's environment is set in ~/.zprofile (login shells), so it is
# available before this file runs.
#
################################################################################

if [[ ! -d "$HOME/.tynet-omz" ]]; then
   git clone https://github.com/tya/tynet-omz "$HOME/.tynet-omz"
fi

source "$HOME/.tynet-omz/init.zsh"
