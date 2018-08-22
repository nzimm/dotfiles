#
# ~/.bashrc
#

#########################################################
# Import aliases
#########################################################
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#########################################################
# Look for bash-completion
#########################################################
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

#########################################################
# Setup BASH prompt
#########################################################
function parse_git_branch() {
    BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    if [ ! "${BRANCH}" == "" ]
    then
        echo " [${BRANCH}]"
    else
        echo ""
    fi
}

GREEN="\[$(tput setaf 2)\]"
BLUE="\[$(tput setaf 27)\]"
PURPLE="\[$(tput setaf 57)\]"
RED="\[$(tput setaf 1)\]"
RESET="\[$(tput sgr0)\]"

# User bash prompt
export PS1="${GREEN}[\u@\h \w]${RESET}\`parse_git_branch\`${GREEN}\$${RESET} "

# Root prompt (color user RED)
#export PS1="${GREEN}[${RED}\u${GREEN}@\h \w]${RESET}\`parse_git_branch\`${GREEN}\$${RESET} "
