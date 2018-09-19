#
# ~/.bashrc
#

# set env variables
export TERM=xterm-256color

# Import aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Load pywal colorscheme
(cat ~/.cache/wal/sequences &)

# Look for bash-completion
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# Setup BASH prompt
function parse_git_branch() {
    BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    if [ ! "${BRANCH}" == "" ]
    then
        echo " [${BRANCH}]"
    else
        echo ""
    fi
}

# These colors require xterm-256 colors
# TODO we should have a test for 256 colors, and fail-back to standard colors
GREEN="\[$(tput setaf 34)\]"
BLUE="\[$(tput setaf 27)\]"
PURPLE="\[$(tput setaf 57)\]"
RED="\[$(tput setaf 196)\]"
RESET="\[$(tput sgr0)\]"

# User bash prompt
export PS1="${GREEN}[\u@\h \w]${RESET}\`parse_git_branch\`${GREEN}\$${RESET} "

# Root prompt (color user RED)
#export PS1="${GREEN}[${RED}\u${GREEN}@\h \w]${RESET}\`parse_git_branch\`${GREEN}\$${RESET} "
