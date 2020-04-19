[[ $- == *i* ]] && source /Users/dbarnard/Code/dev-tools/ble.sh/out/ble.sh --noattach

[[ $- == *i* ]] || return 0 # If this is not interactive session, then exit here

alias dockerkill='docker container rm -f $(docker container ls -aq)'
alias editprofile='vim ~/.bash_profile && source ~/.bash_profile'
alias viewprofile='vim ~/.bash_profile'
alias editrc='vim ~/.bashrc && source ~/.bashrc'
alias viewrc='vim ~/.bashrc'

alias dotfiles='/usr/local/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias rm='rm -i'
# alias chmod='chmod --preserve-root' # invalid in macos

source <(kubectl completion bash)
alias k=kubectl
complete -F __start_kubectl k

alias g=git
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
# Bash completion with git g alias
__git_complete g __git_main

alias 'gg'="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

# Add this line at the end of .bashrc:
((_ble_bash)) && ble-attach
