# cg
talexander config files

Follow approach documented here: https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/

# Setup
```bash
git init --bare $HOME/.cg
alias cg='/usr/bin/git --git-dir=$HOME/.cg/ --work-tree=$HOME'
cg config --local status.showUntrackedFiles no
```

# Add file to cg
```bash
cg add .newDotFile
cg ci -m'Added .newDotFile'
cgs
cg push
```
