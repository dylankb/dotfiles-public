[[ $- == *i* ]] && source $HOME/Code/dev-tools/ble.sh/out/ble.sh --noattach

[[ $- == *i* ]] || return 0 # If this is not interactive session, then exit here

alias dockerkill='docker container rm -f $(docker container ls -aq)'
alias editprofile='vim ~/.bash_profile && source ~/.bash_profile'
alias viewprofile='vim ~/.bash_profile'
alias editrc='vim ~/.bashrc && source ~/.bashrc'
alias viewrc='vim ~/.bashrc'

alias dotfiles='/usr/local/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias rm='rm -i'
# alias chmod='chmod --preserve-root' # invalid in macos

# https://itnext.io/programmable-completion-for-bash-on-macos-f81a0103080b
# https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-bash-completion
export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# https://kubernetes.io/docs/tasks/tools/install-kubectl/#enable-kubectl-autocompletion
source <(kubectl completion bash)
alias k=kubectl
complete -F __start_kubectl k

alias g=git
# Bash completion with git g alias - https://stackoverflow.com/a/15009611
__git_complete g __git_main

alias 'gg'="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
kubeoff

# Add this line at the end of .bashrc:
((_ble_bash)) && ble-attach
