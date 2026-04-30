# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

A **dotfiles repository** using the bare git repo pattern. The actual bare repo lives at `$HOME/.cg`, and this working copy (checked out to `$HOME`) manages personal configuration files for macOS.

The approach is documented at: https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/

## Working With This Repo

The repo uses a `cg` alias instead of `git` directly:

```bash
alias cg='/usr/bin/git --git-dir=$HOME/.cg/ --work-tree=$HOME'
```

Untracked files are hidden by default (`status.showUntrackedFiles no`), so only explicitly added files are tracked. To add a new dotfile:

```bash
cg add .newDotFile
cg ci -m 'Added .newDotFile'
cg push
```

**Important:** When editing files in this repo, remember these are deployed directly to `$HOME`. Changes take effect immediately on the user's machine.

## Key Configuration Files

- **`.zshrc`** - Shell setup using oh-my-zsh with a custom plugin repo (`tya/tynet-omz`). The `zsh-fast-syntax-highlighting` plugin must remain last in the plugin list.
- **`.gitconfig`** - Git config with aliases (`ci`, `co`, `st`, `lg`), pull rebase enabled, SSH URL rewrites for GitHub, and DiffMerge as the merge/diff tool.
- **`.tmux.conf`** - Tmux with `C-a` prefix (not default `C-b`), vi copy mode, TPM plugin manager, and tmux-continuum for auto-restore. Depends on `.tmux.defaults.conf`.
- **`.Brewfile`** - Homebrew bundle for reproducible package installation (`brew bundle --file=.Brewfile`).
- **`.ssh/config`** - Modular SSH config using `Include config.d/*` pattern with 1Password SSH agent integration.
- **`.git-hooks/prepare-commit-msg`** - Prepends JIRA ticket ID from branch name to commit messages.
- **`.macos`** - macOS defaults script for system preferences.
- **`.gitignore`** - Excludes sensitive files (private keys, known_hosts) and transient directories.
