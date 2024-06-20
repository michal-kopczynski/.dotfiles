unalias kcp

#alias c='clear'

alias l='ls -lrt'

# alias k='kubectl'
alias ky='kubectl -o yaml'
alias kj='kubectl -o json'

alias kgan='kubectl get $(kubectl api-resources --namespaced=true --no-headers -o name | egrep -v "events|nodes" | paste -s -d, - ) --no-headers -n'

alias pbcopy="xclip -sel clip"
