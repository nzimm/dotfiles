# Dotfiles
Repository aimed at maintaining continuity between multiple machines

## Bash
My shell of choice. These files should be sufficient to setup a familiar bash
environment on any Linux host.

#### bashrc
Sources `bash\_aliases`, and sets up my bash prompt -- complete with git branch!

#### bash\_profile
Executed for login shells, sets up important environment variables

#### bash\_aliases
Bash aliases have proven to be less universal than I had hoped, so maybe this
file isn't worth the trouble of centralizing.

## i3
Config files for the window manager, i3-gaps.

#### i3-gaps.config
Lives at `~/.config/i3/config` and provides the core config for i3

#### i3blocks-gaps.config
Lives at `~/.config/i3blocks/config`
Custom config file for the i3blocks status line. Custom scripts, even all
relevant scripts, should live in this repo, and be installed to
`/usr/lib/i3blocks/{script\_name}`
