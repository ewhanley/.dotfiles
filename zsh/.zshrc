# ~/.zshrc

# Define a function for grepping history
function gh() {
	# Check if a search pattern is provided
	if [ -z "$1" ]; then
		echo "Usage: gh <search_pattern> [additional_grep_options]"
		echo ""
		echo " Searches your zsh history for the given pattern."
		echo " - Case-insensitive search by default."
		echo " - Output is colored for better readability."
		echo " - You can pass additional 'grep' options after the search pattern."
		echo ""
		echo "Examples:"
		echo " gh 'ls -l'"	# Basic case-insensitive search for 'ls -l'
		echo " gh -E '^(git|ssh)'" # Search using extended regex for lines starting with 'git' or 'ssh'
		return 1 # Exit with an error code
	fi

	# The first argument is always the search pattern
	local search_pattern="$1"
	shift # Remove the search_pattern from the argument list

	# Remaining arguments are passed as additional grep options
	local additional_grep_options="$@"

	# Perform the search with improvements:
	# --color=auto: Enables colored ouput for matches (if supported by terminal).
	# -i: Makes the search case-insenstive by default.
	# ${additional_grep_options): Inserts any extra grep options provided by the user.
	# --: Standard convention to signify the end of options,
	#     ensuring "$search_pattern" is treated as a pattern even if it starts with a hyphen.
	history | grep --color=auto -i ${additional_grep_options} -- "$search_pattern"
}

# aliases
alias c="clear"
alias ls="eza --group-directories-first --icons"
alias ll="eza -la --git --group-directories-first --icons"
alias gh="gh"

# vi mode
bindkey -v

# prompt
eval "$(starship init zsh)"

# Source Electio configuration
source ~/.electio.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# env vars
if [ -f "$HOME/.env" ]; then
    source "$HOME/.env"
fi

