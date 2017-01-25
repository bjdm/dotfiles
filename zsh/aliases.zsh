# => Meta-Configuration {{{
alias reload!='source ~/.zshrc'


# => General {{{
# Filesystem aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias ls="ls --color"
alias l="ls -lah --color"
alias la="ls -AF --color"
alias ll="ls -lFh --color"
alias lld="ls -l | grep ^d"
alias rmf="rm -rf"

# Empty the Trash (files deleted from Dolphin/GUI etc.)
alias emptytrash="sudo rm -rfv ~/.local/share/Trash"

# Helpers
alias grep='grep --color=auto'
alias df='df -h' # disk free, in Gigabytes, not bytes
alias du='du -h -c' # calculate disk usage for a folder
# TODO fix fs
alias fs="stat -f \"%z bytes\""


# }}}

# => Productivity {{{
alias vim="nvim"


# }}}


# => Networking {{{
# IP addresses
alias ip="ip addr"
alias localip="ip addr"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# }}}


# Random {{{
# ROT13-encode text. Works for decoding, too! ;)
alias rot13='tr a-zA-Z n-za-mN-ZA-M'

# One of @janmoesen’s ProTip™s
# TODO findout linux alternative for lwp
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
    alias "$method"="lwp-request -m '$method'"
done

# }}}
