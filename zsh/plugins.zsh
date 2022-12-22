# Plugins to be loaded by zgenom
zgenom load zsh-users/zsh-autosuggestions
zgenom load zsh-users/zsh-completions
zgenom load agkozak/zsh-z


# load last
zgenom load zsh-users/zsh-syntax-highlighting
zgenom load zsh-users/zsh-history-substring-search

# setup completions
autoload -Uz compinit && compinit
