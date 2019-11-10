export GOPATH="$HOME/Code/go"
export GOBIN="$GOPATH/bin"
export PATH="$PATH:$GOPATH/bin"

alias editprofile='vim ~/.bash_profile && source ~/.bash_profile'
alias viewprofile='vim ~/.bash_profile'
alias dockerkill='docker container rm -f $(docker container ls -aq)'
alias dotfiles='/usr/local/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

source <(kubectl completion bash
alias k=kubectl
complete -F __start_kubectl k
alias g=git
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
# Bash completion with git g alias
__git_complete g __git_main

alias 'gg'="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"


