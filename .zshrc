# ~/.zshrc
source ~/.zshenv
source ~/antigen.zsh
# Find and set branch name var if in git repository.

# PLUGINS 
# antigen bundle zsh-users/zsh-autosuggestions

# ALIASES
alias gp='git pull'
alias gs='git status'
alias gb='git branch'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gd='git diff'
alias ga='git add'
alias gc='git commit'
alias gcm='git commit -m'

alias ls='ls -G -1 -a'
alias reload='exec zsh'
alias profile='code ~/.zshrc'

# THEME
# antigen theme Eastwood

# LOAD
antigen apply

# Enable substitution in the prompt.
setopt prompt_subst

# Config for prompt. PS1 synonym.
prompt='%F{green}$%2/ %F{red}$(git_branch_name)%F{default}> '

# MISC
# git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh