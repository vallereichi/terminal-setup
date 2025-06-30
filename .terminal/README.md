## setup new terminal

'''
git clone git@github.com:vallereichi/terminal-setup.git
'''

run the shell script for safe checkout. This will backup existing .dotfiles 

'''
#!/bin/bash

set -e


# show help
usage() {
  echo "Verwendung: $0 -r <git-dir> -b <branch>"
  exit 1
}

# parse arguments
while getopts ":r:b:" opt; do
  case $opt in
    r) GIT_DIR="$OPTARG" ;;
    b) BRANCH="$OPTARG" ;;
    *) usage ;;
  esac
done



WORK_TREE="$HOME"
BACKUP_DIR="$HOME/.backup/$(date +%Y%m%d_%H%M%S)"

mkdir -p "$BACKUP_DIR"

# check for files to back up
FILES_TO_BACKUP=$(git --git-dir="$GIT_DIR" --work-tree="$WORK_TREE" checkout --dry-run "$1" 2>&1 | \
    grep -E '^\s+' | sed 's/^\s*//')

if [ -z "$FILES_TO_BACKUP" ]; then
    echo "no files to backup"
else
    echo "saving backup files to $BACKUP_DIR:"
    echo "$FILES_TO_BACKUP"
    for file in $FILES_TO_BACKUP; do
        if [ -f "$WORK_TREE/$file" ] || [ -d "$WORK_TREE/$file" ]; then
            mkdir -p "$BACKUP_DIR/$(dirname "$file")"
            mv "$WORK_TREE/$file" "$BACKUP_DIR/$file"
        fi
    done
fi

# perform checkout
git --git-dir="$GIT_DIR" --work-tree="$WORK_TREE" checkout "$1"

Then source the newly created '''.bashrc''' or '''.zshrc''' file

'''
source ~/.bashrc
'''

'''
source ~/.zshrc
'''

finally supress untracked files

'''
config config --local setup.showUntrackedFiles no
'''

