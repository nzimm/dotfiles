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

export PS1="\[\e[32m\][\[\e[m\]\[\e[32m\]\u\[\e[m\]\[\e[32m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]\[\e[32m\]\[\e[m\] \[\e[32m\]\w\[\e[m\]\[\e[32m\]]\[\e[m\]\`parse_git_branch\`\[\e[32m\]\\$\[\e[m\]\[\e[32m\] \[\e[m\]"
