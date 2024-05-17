# Oh-my-zsh installation path.
export ZSH="$HOME/.oh-my-zsh"

# History
histfile=$HOME/.zsh_history
histup=erase
histsize=1000
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

autoload -U compinit; compinit

source $ZSH/oh-my-zsh.sh

# Aliases
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias subl='open -a "Sublime Text.app"'

# ZSH plugins
# plugins=(git)
source /opt/homebrew/share/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

eval "$(starship init zsh)"
eval "$(rbenv init - zsh)"
