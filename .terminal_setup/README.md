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
echo 'alias config="$(which git) --git-dir=$HOME/.terminal_setup --work-tree=$HOME"' >> ~/.bash_local
```
```
echo 'alias config="$(which git) --git-dir=$HOME/.terminal_setup --work-tree=$HOME"' >> ~/.zsh_local
```


finally supress untracked files

```
config config --local status.showUntrackedFiles no
```

## install tmux

```
mkdir -p ~/.config/tmux/plugins/catppuccin
git clone -b v2.1.3 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux
```

## install neovim

prerequisits:

```
sudo apt-get install ninja-build gettext cmake curl build-essential
```

clone the git repository

```
git clone https://github.com/neovim/neovim.git
```

run the following command from the cloned repository. This will build and install neovim in the ```$HOME/neovim``` folder and add it to ```PATH```

```
rm -r build/  
make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/neovim -DCMAKE_BUILD_TYPE=Release"
make install
export PATH="$HOME/neovim/bin:$PATH"
```

