# sync bare git repository
alias config='/usr/bin/git  --git-dir=$HOME/utils/terminal-setup --work-tree=$HOME'


# configure input line
parse_git_branch() {
    branch=$(git branch 2> /dev/null | grep '*' | sed 's/* //')
    if [ -n "$branch" ]; then
        echo -e "\e[32m($branch)"
    fi
}
PS1='\[\e[90m\][\t] \[\e[38;5;202m\]\u@\h $(parse_git_branch) \[\e[36m\]\W\[\e[35m\] ➜ \[\e[0m\]'


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

# exports
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"



