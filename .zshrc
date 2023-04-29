# ~/.zshrc
source ~/.zshenv
source ~/antigen.zsh
# Find and set branch name var if in git repository.

# PLUGINS 
antigen bundle git

# ALIASES
alias ls='ls -G -1 -a'
alias reload='exec zsh'
alias profile='code ~/.zshrc'
alias vim='nvim'

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