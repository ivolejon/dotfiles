
# ~/.zshrc
source ~/.zshenv
source ~/antigen.zsh

# ALIASES
alias ls='ls -G -1 -a --color'
alias reload_zsh='exec zsh'
alias profile='code ~/.zshrc'
alias vim='nvim'
alias pip='pip3'
alias python='python3'
alias cheat='cat ~/.cheat | grep -i '
alias lg='lazygit'
alias dev='sh dev.sh'
alias chown_to_me='sudo chown -R $(whoami) .'
alias killport='f() { lsof -i tcp:$1 | awk '"'"'NR>1 {print $2}'"'"' | xargs kill -9; unset -f f; }; f'
alias cb='git rev-parse --abbrev-ref HEAD | pbcopy'
alias fzf="fzf --preview 'bat --style=numbers --color=always --line-range=:500 {}'"


# Docker Compose Aliases on local host
# alias krun='docker compose -f docker-compose.dev.yml up -d'
# alias kwat='docker compose -f docker-compose.dev.yml watch'
# alias kdown='docker compose -f docker-compose.dev.yml down'
# alias kapi="docker compose -f docker-compose.dev.yml run api bash"
# alias kgo="docker compose -f docker-compose.dev.yml run be-go bash"
# alias kimport="docker compose --env-file development.env -f docker-compose.dev.yml run api bash ./import-database-dump.sh"

# klogs() {
#   if [ -z "$1" ]; then
#     docker compose --env-file development.env -f docker-compose.dev.yml logs -f
#   else
#     docker compose --env-file development.env -f docker-compose.dev.yml logs -f "$1"
#   fi
# }


alias dozzle="docker run -d -v /var/run/docker.sock:/var/run/docker.sock -p 8090:8080 amir20/dozzle:latest"

# SSH Aliases
# alias ssm-klingit-stage="aws ssm start-session --target i-0ca7b2bcb141f6fe2 --region eu-north-1"
# alias ssm-klingit-prod="aws ssm start-session --target i-054afcb0cfd7d6ae2 --region eu-north-1"
# alias ssm-klingit-prod2="aws ssm start-session --target i-0896e454fb371871d --region eu-north-1"
# alias ssm-klingit-metabase="aws ssm start-session --target i-02c5f67784ff5bf69 --region eu-north-1"
# alias ssh-klingit-stage="ssh -i 'id_ed25519' ubuntu@10.10.43.23"
# alias ssh-klingit-prod="ssh -i 'id_ed25519' ubuntu@10.30.24.85"
# alias ssh-klingit-prod2="ssh -i 'id_ed25519' ubuntu@10.30.61.31"

# # Docker Aliases
# alias docker_in="docker -H private.uat.klingit.com"
# alias docker_pd="docker -H private.production.klingit.com"

# alias ssh_uat="ssh -i ~/.ssh/id_digital_ocean core@private.uat.klingit.com"                # 1pass
# alias ssh_pd="ssh -i ~/.ssh/id_digital_ocean core@private.production.klingit.com" # 1pass

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
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select

# KEYBINDINGS with arrow keys LS
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A'  up-line-or-beginning-search    # Arrow up
bindkey '^[OA'  up-line-or-beginning-search
bindkey '^[[B'  down-line-or-beginning-search  # Arrow down
bindkey '^[OB'  down-line-or-beginning-search

#HISTORY
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# EXPORTS
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export VISUAL=nvim
export EDITOR=nvim
export PATH="$HOME/go/bin:$PATH"
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$HOME/.moon/bin:$PATH"
export ENVIRONMENT=development

# pnpm
export PNPM_HOME="/Users/ivo/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun completions
[ -s "/Users/ivolejon/.bun/_bun" ] && source "/Users/ivolejon/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
