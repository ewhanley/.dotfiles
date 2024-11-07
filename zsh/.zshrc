# Starship
eval "$(starship init zsh)"

# aliases
alias python="python3"
alias ll="lsd -Al"
alias llt="lsd --tree -Al"
alias ll.="lsd -d .*"
alias r="source ~/.zshrc"
alias c="clear"
alias ez="nvim ~/.zshrc"
alias vim="nvim"
alias gh="history | grep"
alias editnv="nvim ~/.config/nvim"

# Path things
export PATH=$PATH:/usr/local/go/bin

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/home/eric/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<
