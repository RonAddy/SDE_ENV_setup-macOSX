# =================
# History
# =================
# http://jorge.fbarr.net/2011/03/24/making-your-bash-history-more-efficient/

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE

# don't put duplicate lines in the history.
export HISTCONTROL=ignoredups

# ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# Make some commands not show up in history
export HISTIGNORE="h"

#Need this for NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
# ====================
# Aliases
# ====================

## 'ls' lists information about files.
# By default, show slashes for directories.
alias ls='ls -F -G'

# Enhanced ls, grouping directories and using colors.
alias lf='ls -a -G'

# Long list format including hidden files and file information.
alias ll='ls -G -a -l'

# List ACLs (finer-grained permissions that can be inherited).
# ACLs are a necessary part of OSX fs since 10.6; see
# - ACLs on OSX: https://goo.gl/PhkcA2
# - OSX chmod manpage: https://goo.gl/vJqgZ9
#
# Note: The default ls on 10.7+ OSX is the GNU coreutils version at:
# /usr/local/opt/coreutils/libexec/gnubin/ls; in order to see the
# ACL permissions, we must use the BSD version available at: /bin/ls
alias lacl='/bin/ls -GFlae'

# Go back one directory
alias b='cd ..'

# History lists your previously entered commands
alias h='history'

# If we make a change to our bash profile we need to reload it
alias reload="clear; source ~/.bash_profile"

# Execute verbosely
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias mkdir='mkdir -pv'

# ================
#Git shortcuts

#NOTE: To alias git specific commands, edit the git config file like so...
# git config --global alias.co checkout
# Aliases 'checkout' to 'co'

#REF: https://stackoverflow.com/questions/14489109/how-to-alias-git-checkout-to-git-co

# ================
alias gp='git push' 
alias gpf='git push -f'
alias gpom='git push origin master'

alias ga='git add'
alias ga.='git add .'
alias gcm='git commit -m'

alias gfrm='git fetch --all --prune && git rebase origin/master'

# Rebase current branch on tip of provided branch 
function gfr() {
  branch=$1
  # color="\033[1;33m" fix this
  
  echo $'Rebasing on branch: '"${branch}"$'\n' 
  
  git fetch --all --prune && git rebase origin/${branch}
}

alias grv='git remote -v'
alias gs='clear && git status'
alias gd='git diff'
alias gdm='git diff origin/master'
alias gcb='git co -b'
alias gco='git co'
alias gck='git checkout --'
alias gcka='git checkout -- .'
alias gsta='git stash'
alias gpsu='git push --set-upstream origin'
alias gsl='git stash list'
alias gsc='git stash clear'
alias gba='git branch --all'

alias grc='git rebase —continue'
alias grom='git rebase -i —onto origin/master' # commit~1 
alias gch='git cherry -v origin/master'
alias gdf='git diff master --'

#Bash prompt and profile shortcuts
alias bprof='code ~/.bash_profile'
alias bprom='code ~/.bash_prompt.sh'

#Node inspector
alias debug='node --inspect-brk'

#Blink Aliases
alias web='cd ~/Desktop/rx-web'
alias pwa='cd ~/Desktop/mobile-web'
alias oms='cd ~/Desktop/order-service'
alias dcup='docker-compose up'
alias resetaws='eval $(blink aws session dev)'

    #RXOS
    alias rxosbe='cd ~/Desktop/rx-os-backend'
    alias rxosfe='cd ~/Desktop/rx-os-frontend'
    alias rungrx='pipenv run grx-db'
    alias rxos-be='rungrx && SERVER_URLS_MODE=all pipenv run server'

    #BACKEND
    alias ecom='cd ~/Desktop/backend'
    alias dcb='docker-compose exec develop bash'
    alias ecomserv='python manage runserver -h 0.0.0.0 -p 5000'

    #Node Package Managment/Yarn
    alias yrd='yarn run dev'
    alias yrp='yarn run precommit'
    alias npmg='npm install -g'

    #PIP Package managenment
    alias pir='pip install -r requirements.txt'

# ================
# Application Aliases
# ================
alias chrome='open -a "Google Chrome"'

# =================
# Tab Improvements
# =================
bind 'set completion-ignore-case on'

# # make completions appear immediately after pressing TAB once
bind 'set show-all-if-ambiguous on'
bind 'TAB: menu-complete'

# =================
# Functions
# =================

# Get symlink for provided package
function getsym() {
  binary=$1

  python -c "import os; print(os.path.realpath('/usr/local/bin/$binary'))"
}

# =================
# Sourced Scripts
# =================

# Builds the prompt with git branch notifications.
if [ -f ~/.bash_prompt.sh ]; then
  source ~/.bash_prompt.sh
fi

# # A welcome prompt with stats for sanity checks
# if [ -f ~/.welcome_prompt.sh ]; then
#   source ~/.welcome_prompt.sh
# fi

# bash/zsh completion support for core Git.
if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi

# function _update_ps1() {
#     PS1=$(powerline-shell $?)
# }

# if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
#     PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
# fi

# Setting PATH for Python 3.8
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:${PATH}"
export PATH