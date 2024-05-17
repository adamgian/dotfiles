#
# History
# ----------------------------------------------------------

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

# Adjust up/down arrows to step through zsh_history filtered by
# commands that also match what may be typed to the left of the cursor.
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward


#
# Aliases
# ----------------------------------------------------------

alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias subl='open -a "Sublime Text.app"'


#
# Plugins
# ----------------------------------------------------------

# Compile ZSH script into btye code
function zcompile-all() {
	local f
	for f; do zcompile -R -- "$f".zwc "$f"; done
}

# zsh-autosuggestions
if [[ ! -e "$HOME/zsh-autosuggestions" ]]; then
	git clone --depth=1 \
		"https://github.com/zsh-users/zsh-autosuggestions.git" \
		"$HOME/zsh-autosuggestions"
	zcompile-all \
		"$HOME/zsh-autosuggestions/{zsh-autosuggestions.zsh, src/**/*.zsh}"
fi

# zsh-syntax-highlighting
if [[ ! -e "$HOME/zsh-syntax-highlighting" ]]; then
	git clone --depth=1 \
		"https://github.com/zsh-users/zsh-syntax-highlighting.git" \
		"$HOME/zsh-syntax-highlighting"
	zcompile-all \
		"$HOME/zsh-syntax-highlighting/{zsh-syntax-highlighting.zsh, highlighters/*/*.zsh}"
fi

autoload -U compinit && compinit
[[ "$HOME/.zcompdump.zwc" -nt "$HOME/.zcompdump" ]] || zcompile-all "$HOME/.zcompdump"
zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"
unfunction zcompile-all

# Load plugins
source "$HOME/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"


#
# Initialise
# ----------------------------------------------------------

eval "$(starship init zsh)"
# eval "$(rbenv init - zsh)"
