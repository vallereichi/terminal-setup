# configure input line
parse_git_branch() {
    branch=$(git branch 2> /dev/null | grep '*' | sed 's/* //')
    if [ -n "$branch" ]; then
        echo -e "\e[32m($branch)"
    fi
}
# select the prompt color for teh username basesd on the user
set_user_color() {
	case "$USER" in
		vreich)
			echo -e "\e[38;5;174m"	# LightPink3
			;;
		*)
			echo -e "\e[38;5;141m"	# MediumPurple1
			;;
	esac
}
PS1='\[\e[90m\][\t] $(set_user_color)\u@\h $(parse_git_branch) \[\e[36m\]\W\[\e[35m\] ➜ \[\e[0m\]'
PS2='>'


# add color support to ls
alias ls='ls --color=auto'

# add color support to grep
alias grep='grep --color=auto'

# choose to use neovim instead of vim
if command -v nvim >/dev/null 2>&1; then
	alias vim='nvim'
fi


# aliases
alias ll='ls -l'
alias la='ls -la'
alias gs='git status'
alias ga='git add .'
alias gm='git commit'
alias gp='git pull'


# directly attach to base tmux session
if command -v tmux >/dev/null 2>&1; then
	if [ "$TMUX" ]; then
		current_session=$(tmux display-message -p '#S' 2>/dev/null)
		if [ "$current_session" = "base" ]; then
			return
		fi
	fi
	if tmux has-session -t base 2>/dev/null; then
		tmux attach-session -t base
	else
		tmux new-session -s base
	fi
fi

# create links to system specific options, e.g. exports
[ -f "$HOME/.bash_local" ] && source "$HOME/.bash_local"


