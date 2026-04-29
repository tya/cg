# cg (config git)
talexander config files

Follow approach documented here: https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/

# Setup
```bash
git init --bare $HOME/.cg
alias cg='/usr/bin/git --git-dir=$HOME/.cg/ --work-tree=$HOME'
cg config --local status.showUntrackedFiles no
```

# Clone to a new machine
```bash
git clone --bare git@github.com:tya/cg.git $HOME/.cg
alias cg='/usr/bin/git --git-dir=$HOME/.cg/ --work-tree=$HOME'
cg checkout
cg config --local status.showUntrackedFiles no
```

# Add file to cg
```bash
cg add .newDotFile
cg ci -m'Added .newDotFile'
cg push
```

# Cross-platform
Works on macOS and Linux. OS-specific config is handled inline:
- **git** — `includeIf` loads `~/.gitconfig.macos` or `~/.gitconfig.linux`
- **tmux** — `if-shell` guards macOS-only commands
- **vim** — auto-detects fzf install path
- **zsh** — conditionally loads brew plugin on macOS
- **ssh** — `Match exec` selects the correct 1Password agent socket
