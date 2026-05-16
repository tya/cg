# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

A **dotfiles repository** using the bare git repo pattern (see [Atlassian writeup](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)). The deployed bare repo lives at `$HOME/.cg` with `$HOME` as the working tree, so tracked files live directly at `~/.zshrc`, `~/.gitconfig`, etc.

A normal (non-bare) clone also exists at `$HOME/src/cg` for editing in tools that don't cope with the bare-repo layout — that's the directory Claude Code is usually invoked from. **Edits there do not deploy until pushed and pulled into `$HOME/.cg`** (or copied across). Don't assume an edit in `src/cg` is live on the user's machine.

## Working With This Repo

The repo uses a `cg` alias instead of `git` directly:

```bash
alias cg='/usr/bin/git --git-dir=$HOME/.cg/ --work-tree=$HOME'
```

`status.showUntrackedFiles no` is set on the bare repo so `cg status` only shows tracked files. To add a new dotfile:

```bash
cg add .newDotFile
cg ci -m 'Added .newDotFile'
cg push
```

## Cross-Platform Design

The repo runs on **macOS and Linux**. Don't introduce macOS-only code without a guard. Existing OS-switching patterns:

- **git** — `.gitconfig` uses `includeIf "gitdir:/Users/"` → `.gitconfig.macos` (osxkeychain) and `includeIf "gitdir:/home/"` → `.gitconfig.linux` (cache helper).
- **tmux** — `if-shell "uname | grep -q Darwin"` picks the prefix (`C-a` on macOS, `C-b` on Linux) and gates `iterm` continuum boot.
- **zsh** — `.zshrc` `setup-zsh-plugins` conditionally appends the `brew` plugin on Darwin; `setup-tynet-omz` auto-clones `tya/tynet-omz` into `~/.tynet-omz` on first run.
- **ssh** — `.ssh/config` includes `config.d/*` modularly; `config.d/1password` uses `Match exec` to select the right agent socket per OS.
- **packages** — `.Brewfile` (macOS, `brew bundle --file=.Brewfile`) and `.Aptfile` (Debian/Ubuntu, `bash ~/.Aptfile`) are kept loosely in parallel.

## Things That Are Easy to Miss

- **`zsh-fast-syntax-highlighting` must remain last** in the `plugins=(…)` list in `.zshrc` — oh-my-zsh syntax highlighters require it.
- **`.git-hooks/prepare-commit-msg`** prepends a JIRA-style ticket ID parsed from the branch name. It's tracked but not auto-installed — it only runs if symlinked into a repo's `.git/hooks/` or pointed at via `core.hooksPath`.
- **`.gitignore`** here is the bare-repo's own ignore list (private keys, history files, `Library/`, `.Trash`); the global ignore for other repos is `.gitignore_global`.
- **`.tmux.conf` depends on `.tmux.defaults.conf`** being present — both are tracked.
