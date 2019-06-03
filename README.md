# Dotfiles
Repository aimed at maintaining continuity between multiple machines

## Bash
My shell of choice. These files should be sufficient to setup a familiar bash
environment on any Linux host.

#### bashrc
Sources `bash_aliases`, and sets up my bash prompt -- complete with git branch!

#### bash_profile
Executed for login shells, sets up important environment variables

#### bash_aliases
Bash aliases have proven to be less universal than I had hoped, so maybe this
file isn't worth the trouble of centralizing.

#### Xmodmap
I use a 60% keyboard on desktops, but it seems a little redundant on a laptop.
Luckily, I can mirror certain keymappings that I've grown accustomed to with
xmodmap.

## config/
This is where the files that live under ~/.config/ are stored.

## systemd/
Custom systemd scripts/targets. These should be placed into the directory
/etc/systemd/system/ followed by enabling the service and reloading systemd:
  # systemctl enable lock-on-suspend
  # systemctl daemon-reload

## etc/
Various other files that I want to have easy access to between various machines.

