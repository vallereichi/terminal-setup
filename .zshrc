# sync bare git repository
alias config='/usr/bin/git  --git-dir=$HOME/utils/terminal-setup.git --work-tree=$HOME'

# activate prompt substitutions to use functions
setopt prompt_subst

# activate vi mode for vim navigation
bindkey -v
KEYTIMEOUT=5                     # remove key switching delay

function zle-line-init zle-keymap-select {
  case ${KEYMAP} in
      (vicmd)      RPS1=' %F{250}[%T %D{%d.%m.%Y}]%f %F{202}[NORMAL]%f' ;;
      (main|viins) RPS1=' %F{250}[%T %D{%d.%m.%Y}]%f %F{74}[INSERT]%f' ;;
      (*)          RPS1=' %F{250}[%T %D{%d.%m.%Y}]%f' ;;
  esac
  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# configure input line
format_git_branch() {
  local BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  [[ -n $BRANCH ]] && echo "($BRANCH)"
}
export PS1='%F{97}%n@%m%f %F{100}$(format_git_branch)%f %F{69}%1d%f %F{200}➜%f '
export RPS1=' %F{250}[%T %D{%d.%m.%Y}]%f'

# add color support to ls
alias ls='ls -G --color=auto'

# add color support to grep
alias grep='grep -G --color=auto'

# aliases
alias ll='ls -l'
alias la='ls -la'
alias gs='git status'
alias ga='git add .'
alias gm='git commit'
alias ba='cd ~/Desktop/Studium/Physik/BA'

# exports
export PATH="/Users/v.reichi/Library/Python/3.9/bin:$PATH"
export PATH="/opt/homebrew/opt/hdf5@1.10/bin:$PATH"
export PATH="/usr/local/bin/python3:$PATH"

