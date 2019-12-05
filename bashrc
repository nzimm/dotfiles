#
# ~/.bashrc
#

# Quit if not interactive (no cli)
[ -z "$PS1" ] && return

# general environment
export TERM=xterm-256color

# xsecurelock settings
export XSECURELOCK_AUTH_TIMEOUT=10
export XSECURELOCK_BLANK_TIMEOUT=10
export XSECURELOCK_BURNIN_MITIGATION=350

# enable less to view non-text files (pdf, directories, compressed, etc.)
[ -x /usr/bin/lesspipe.sh ] && eval "$(SHELL=/bin/sh lesspipe.sh)"

# import aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# load pywal colorscheme
#(cat ~/.cache/wal/sequences &)

# source bash-completion
if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

function echo_branch() {
    BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    if [ ! "${BRANCH}" == "" ]
    then
        echo "[${BRANCH}]"
    else
        echo ""
    fi
}

# ANSI color codes
RESET='\001\033[0m\002'
WHITE='\001\033[01;37m\002'
RED='\001\033[00;31m\002'
GREEN='\001\033[00;32m\002'
YELLOW='\001\033[00;33m\002'
BLUE='\001\033[00;34m\002'
MAGENTA='\001\033[00;35m\002'
PURPLE='\001\033[00;35m\002'
CYAN='\001\033[00;36m\002'
LIGHTGRAY='\001\033[00;37m\002'
B_LRED='\001\033[01;31m\002'
B_LGREEN='\001\033[01;32m\002'
B_YELLOW='\001\033[01;33m\002'
B_BLUE='\001\033[01;34m\002'
B_MAGENTA='\001\033[01;35m\002'
B_PURPLE='\001\033[01;35m\002'
B_CYAN='\001\033[01;36m\002'
B_WHITE='\001\033[01;37m\002'

# basic prompt
#if [[ "$(whoami)" == "root" ]]; then
#    PS1="${PURPLE}[${RED}\u${PURPLE}@\h \w]${RESET}\`parse_git_branch\`${PURPLE}\$${RESET} "
#else
#    PS1="${PURPLE}[\u@\h \w]${RESET}\`parse_git_branch\`${PURPLE}\$${RESET} "
#fi

# fancy w/ code on output code
#PS1="\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\342\234\227]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo 'root@\h'; else echo '\u@\h'; fi)]\342\224\200[\w]\n\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]\$ "

# fancy prompt w/ color (Parrot OS template)
#PS1="\342\224\214\342\224\200\$([[ \$(git_branch) != 0 ]] && echo \"\$(echo_branch)\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo 'root@\h'; else echo '\u@\h'; fi)]\342\224\200[\w]\n\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]\$ "
PS1="\342\224\214\342\224\200[$(if [[ ${EUID} == 0 ]]; then echo 'root@\h'; else echo '\u@\h'; fi)]\342\224\200[\w]\$([ \$(echo_branch) ] && echo \"\342\224\200\$(echo_branch)\")\n\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]\$ "

# PROMPT_COMMAND runs before displaying prompt
#   Save current working directory to volatile storage
PROMPT_COMMAND='pwd > "${XDG_RUNTIME_DIR}/.cwd"'

# New terminals cd into PWD, rather than at home dir
[[ -f "${XDG_RUNTIME_DIR}/.cwd" ]] && cd "$(< ${XDG_RUNTIME_DIR}/.cwd)"
