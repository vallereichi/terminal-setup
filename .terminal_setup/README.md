## setup new terminal

```
git clone --bare git@github.com:vallereichi/terminal-setup.git ~/.terminal_setup
```

create an alias for ease of use
```
alias config='$(which git) --git-dir=$HOME/.terminal_setup/ --work-tree=$HOME'
```

run the following command for safe checkout. This will backup existing .dotfiles 
```
backup_dir="$HOME/.backup/$(date +%Y-%m-%d_%H-%M-%S)" && mkdir -p "$backup_dir" && config checkout 2>&1 | grep -E "\s+\." | awk '{print $1}' | while read -r file; do mkdir -p "$(dirname "$backup_dir/$file")"; mv "$HOME/$file" "$backup_dir/$file"; done

```
```
config checkout
```

Then source the newly created ```.bashrc``` or ```.zshrc``` file

```
source ~/.bashrc
```

```
source ~/.zshrc
```


it is useful to create a file is not tracked by this repo but will be loaded from the bashrc file. Here you can add exports and other things that are local to a system

```
touch ~/.bash_local
```

```
touch ~/.zsh_local
```

the last step is to create an alias for the git repository

```
echo "alias config='$(which git) --git-dir=<path/to/repository> --work-tree=\$HOME'" >> ~/.bash_local
```

finally supress untracked files

```
config config --local setup.showUntrackedFiles no
```

