# ====================
# Funtions
# ====================

# Rebase current branch on tip of provided branch 
function gfr() {
  branch=$1
  # color="\033[1;33m" fix this
  
  echo $'Rebasing on branch: '"${branch}"$'\n' 
  
  git fetch --all --prune && git rebase origin/${branch}
}

# Get symlink for provided package
function getsym() {
  binary=$1

  python -c "import os; print(os.path.realpath('/usr/local/bin/$binary'))"
}

function tab () {
    local cdto="$PWD"
    local args="$@"

    if [ -d "$1" ]; then
        cdto=`cd "$1"; pwd`
        args="${@:2}"
    fi

  osascript -i <<EOF
        tell application "iTerm2"
                tell current window
                        create tab with default profile
                        tell the current session
                                write text "cd \"$cdto\" && $args"
                        end tell
                end tell
        end tell
EOF
}

# =================
# Tab Improvements
# =================
bind 'set completion-ignore-case on'

# # make completions appear immediately after pressing TAB once
bind 'set show-all-if-ambiguous on'
bind 'TAB: menu-complete'

# =================
# Sourced Scripts
# =================

# Builds the prompt with git branch notifications.
if [ -f ~/.bash_prompt.sh ]; then
  source ~/.bash_prompt.sh
fi

# bash/zsh completion support for core Git.
if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi

# Source aliases
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi