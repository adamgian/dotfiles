#
# History
# ----------------------------------------------------------

HISTFILE=$HOME/.zsh_history
HISTUP=erase
HISTSIZE=1000
SAVEHIST=1000

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# Adjust up/down arrows to step through zsh_history filtered by
# commands that also match the text to the left of the cursor.
bindkey "$key[Up]" history-beginning-search-backward
bindkey "$key[Down]" history-beginning-search-forward


#
# Aliases
# ----------------------------------------------------------

alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"


#
# Plugins
# ----------------------------------------------------------

# Compile ZSH script into ZWC
function zcompile-all() {
	local f
	for f; do zcompile -R -- "$f".zwc "$f"; done
}

# zsh-autosuggestions (compiled to ZWC)
if [[ ! -e "$HOME/.zsh/zsh-autosuggestions" ]]; then
	git clone --depth=1 \
		"https://github.com/zsh-users/zsh-autosuggestions.git" \
		"$HOME/.zsh/zsh-autosuggestions"
	zcompile-all \
		"$HOME/.zsh/zsh-autosuggestions/"{zsh-autosuggestions.zsh,src/**/*.zsh}
fi

# zsh-syntax-highlighting (compiled to ZWC)
if [[ ! -e "$HOME/.zsh/zsh-syntax-highlighting" ]]; then
	git clone --depth=1 \
		"https://github.com/zsh-users/zsh-syntax-highlighting.git" \
		"$HOME/.zsh/zsh-syntax-highlighting"
	zcompile-all \
		"$HOME/.zsh/zsh-syntax-highlighting/"{zsh-syntax-highlighting.zsh,highlighters/*/*.zsh}
fi

# Use modern completion system
autoload -U compinit && compinit
zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"

# Load in compiled plugins
source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"


#
# Initialise
# ----------------------------------------------------------

# NVM
export NVM_DIR="$HOME/.nvm"
# This loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Starship
eval "$(starship init zsh)"
