#
# ~/.bashrc
#

# Quit if not interactive (no cli)
[ -z "$PS1" ] && return

# general environment
export TERM=xterm-256color

# xsecurelock settings
export XSECURELOCK_NO_COMPOSITE=1
export XSECURELOCK_AUTH_TIMEOUT=10
export XSECURELOCK_BLANK_TIMEOUT=10
export XSECURELOCK_BURNIN_MITIGATION=350

# enable less to view non-text files (pdf, directories, compressed, etc.)
[ -x /usr/bin/lesspipe.sh ] && eval "$(SHELL=/bin/sh lesspipe.sh)"

# source conda
#[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

# import aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# add go bin to path
[ -d ~/go/bin/ ] && export PATH=$PATH:~/go/bin/

# load pywal colorscheme
#(cat ~/.cache/wal/sequences &)

# source bash-completion
if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

function echo_branch() {
    BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/' | tr -d '()'`
    if [ ! "${BRANCH}" == "" ]; then
        echo -n "${BRANCH}"
    fi
}

function echo_conda_env() {
    if [ ! "${CONDA_PREFIX}" == "" ]; then
        echo "($(basename $CONDA_PREFIX)) "
    fi
}

# ANSI color codes
RESET="\[\033[0m\]"
WHITE="\[\033[00;37m\]"
RED="\[\033[00;31m\]"
GREEN="\[\033[00;32m\]"
YELLOW="\[\033[00;33m\]"
BLUE="\[\033[00;34m\]"
MAGENTA="\[\033[00;35m\]"
PURPLE="\[\033[00;35m\]"
CYAN="\[\033[00;36m\]"
LIGHTGRAY="\[\033[00;37m\]"
B_RED="\[\033[01;31m\]"
B_GREEN="\[\033[01;32m\]"
B_YELLOW="\[\033[01;33m\]"
B_BLUE="\[\033[01;34m\]"
B_MAGENTA="\[\033[01;35m\]"
B_PURPLE="\[\033[01;35m\]"
B_CYAN="\[\033[01;36m\]"
B_WHITE="\[\033[01;37m\]"

# basic prompt
#if [[ "$(whoami)" == "root" ]]; then
#    PS1="${PURPLE}[${RED}\u${PURPLE}@\h \w]${RESET}\`parse_git_branch\`${PURPLE}\$${RESET} "
#else
#    PS1="${PURPLE}[\u@\h \w]${RESET}\`parse_git_branch\`${PURPLE}\$${RESET} "
#fi

# fancy prompt w/ color (Parrot OS template)
# NOTE: command expansion must be escaped, e.g. `\$()` rather than `$()`, so
#       that the command runs each time the prompt prints. Otherwise, commands
#       will only execute when this file is sourced.
prompt_cmd () {
    # Save current working directory
    pwd > "${HOME}/.cwd"
   PS1=""
    # Add "┌─["
    PS1+="${LIGHTGRAY}\342\224\214\342\224\200["
    # Add username and hostname - if root, make username red
    if [[ $EUID == 0 ]]; then
        PS1+="${B_RED}root${GREEN}@\h"
        END_CHR="#"
    else
        PS1+="${GREEN}\u@\h"
        END_CHR="$"
    fi
    # Add "]─["
    PS1+="${LIGHTGRAY}]\342\224\200["
    # Add directory
    PS1+="${GREEN}\w"
    # Add "]-[branch]\n" if in git repo, otherwise just "]\n"
    if [ ! $(echo_branch) == "" ]; then
        PS1+="${LIGHTGRAY}]\342\224\200["
        PS1+="${B_WHITE}$(echo_branch)"
        PS1+="${LIGHTGRAY}]\n"
    else
        PS1+="${LIGHTGRAY}]\n"
    fi
    # Add "└─╼ $ "
    PS1+="${LIGHTGRAY}\342\224\224\342\224\200\342\225\274 ${END_CHR}${RESET} "
}

# PROMPT_COMMAND runs before displaying prompt
PROMPT_COMMAND="prompt_cmd"

# New terminals cd into PWD, rather than at home dir
[[ -f "${HOME}/.cwd" ]] && cd "$(< ${HOME}/.cwd)"
