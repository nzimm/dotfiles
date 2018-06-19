#
# ~/.bash_profile
#

#########################################################
# Import aliases
#########################################################
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

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
RESET="\[$(tput sgr0)\]"
export PS1="${GREEN}[\u@\h \w]${RESET}\`parse_git_branch\`${GREEN}\$${RESET} "
