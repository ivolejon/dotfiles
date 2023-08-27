# ~/.zshrc
source ~/.zshenv
source ~/antigen.zsh
# Find and set branch name var if in git repository.

# PLUGINS 
antigen bundle git
antigen bundle "MichaelAquilina/zsh-autoswitch-virtualenv"
antigen bundle djui/alias-tips

# KEYBINDINGS
bindkey '\t' end-of-line

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

# if [ -f "~/.nvm/nvm.sh" ]; then
    source ~/.nvm/nvm.sh
# fi
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

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
alias git='LC_ALL=en_US git'
alias dev='sh dev.sh'
alias gp='git pull'
alias gpa='git pull --all'
alias chown_to_me='sudo chown -R $(whoami) .'
alias gs='git standup'

function git_since() {
    git log --merges --since=$1 --pretty=format:"%h - %s (%cd)" --date=short
}

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/go/bin:$PATH"