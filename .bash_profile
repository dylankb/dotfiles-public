export GOPATH="$HOME/Code/go"
export GOBIN="$GOPATH/bin"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"

alias editprofile='vim ~/.bash_profile && source ~/.bash_profile'
alias viewprofile='vim ~/.bash_profile'
alias dockerkill='docker container rm -f $(docker container ls -aq)'
alias dotfiles='/usr/local/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

###
# ble config
###

# https://github.com/akinomyoga/ble.sh/issues/41
function ble/widget/fzf-git {
  ble/widget/insert-string "$($1)"
  ble/textarea#invalidate
}

####
# fzf config - https://gist.github.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236
#        git - https://github.com/junegunn/fzf/wiki/Examples#git
####

function fbr() {
  local branches branch
  branches=$(git --no-pager branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

### In development (not working) - basically do what gitk is doing but searching/viewing current changes
gd() {
  is_in_git_repo || return
  git -c color.status=always status --short |
  fzf-down -m --ansi --nth 2..,.. \
    --preview '(git diff master --color=always -- {-1} | sed 1,4d; cat {-1}) | head -500' |
  cut -c4- | sed 's/.* -> //'
}

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# https://unix.stackexchange.com/a/124408/147651
NORMAL="\[\033[00m\]"
GREEN="\[\e[0;32m\]"
RED="\[\e[1;31m\]"

# https://github.com/jonmosco/kube-ps1
export PS1="${RED}→ ${NORMAL}\W${GREEN}\$(parse_git_branch)${NORMAL}"
PS1=$PS1'$(kube_ps1) $ '

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

[[ -f ~/.bashrc ]] && source ~/.bashrc
