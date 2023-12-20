
# ~/.zshrc
source ~/.zshenv
source ~/antigen.zsh

# ALIASES
alias ls='ls -G -1 -a'
alias reload_zsh='exec zsh'
alias profile='code ~/.zshrc'
alias vim='nvim'
alias pip='pip3'
alias python3='python3.9'
alias python='python3.9'
alias cheat='cat ~/.cheat | grep -i '
alias lg='lazygit'
alias dev='sh dev.sh'
alias chown_to_me='sudo chown -R $(whoami) .'
alias killport='f() { lsof -i tcp:$1 | awk '"'"'NR>1 {print $2}'"'"' | xargs kill -9; unset -f f; }; f'
alias cb='git rev-parse --abbrev-ref HEAD | pbcopy'

# ALIAS GIT
alias git='LC_ALL=en_US git'
alias gi="git init"
alias status="git status -sbu"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gp="git push"
alias gm="git merge"
alias ga="git add ."
alias gcm="git commit -m"
alias gpl="git pull"
alias gst="git stash"
alias gstl="git stash list"
alias glg='git log --graph --oneline --decorate --all'
alias gs='git standup'
alias gc='commit'
alias gr='git_browse'
alias reset='git reset --hard'

# PLUGINS 
antigen bundle "MichaelAquilina/zsh-autoswitch-virtualenv"
antigen bundle djui/alias-tips
antigen bundle agkozak/zsh-z
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

# PLUGINS MORE
# git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.nvm/nvm.sh

#PROMPT
setopt prompt_subst
prompt='%F{green}$%2/ %F{red}$(git_branch_name)%F{default}> '

# AUTOCOMPLETE
autoload -Uz compinit && compinit
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

# KEYBINDINGS with arrow keys LS
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A'  up-line-or-beginning-search    # Arrow up
bindkey '^[OA'  up-line-or-beginning-search
bindkey '^[[B'  down-line-or-beginning-search  # Arrow down
bindkey '^[OB'  down-line-or-beginning-search


# EXPORTS
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export VISUAL=nvim
export EDITOR=nvim
export PATH="$HOME/go/bin:$PATH"
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
