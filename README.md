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

## config/
This is where the files that live under ~/.config/ are stored.

## systemd/
Custom systemd scripts/targets. These should be placed into the directory
/etc/systemd/system/ followed by reloading systemd:
  # systemctl daemon-reload
