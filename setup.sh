#! /bin/bash

set -eux

install_package() {
  if $mac_os; then
    # Use reinstall so that this is idempotent
    brew reinstall "$1"
  else
    sudo apt-get install -y "$1"
  fi
}

link_file() {
	if [ "$1" == "setup.sh" ] || [ "$1" == "." ] || [ "$1" == ".." ] || [ "$1" == ".git" ]; then
		return
	fi

  source=$link_source/$1
  link=$HOME/$1

  if [ -e "$link" ]; then
    mkdir -p dotfiles-backup
    mv "$link" dotfiles-backup
  fi

  ln -sf "$source" "$link"
}

[[ "$(uname -s)" == "Darwin" ]] && mac_os=true || mac_os=false

set +u
if [ $SPIN ]; then
  # Container in the Spin environment
  link_source="/home/spin/dotfiles"
else
  link_source="$(pwd)"
fi
set -u

declare -a packages=(
  "fzf"
)

if $mac_os; then
  packages+=(
    "bat"
    "glow"
    "the_silver_searcher"
    "zsh-completions"
    "neovim"
  )
else
  packages+=(
    "silversearcher-ag"
  )

  sudo add-apt-repository ppa:neovim-ppa/stable
  sudo apt-get -y update
  sudo apt-get -y install neovim
fi

for package in "${packages[@]}"; do
  install_package "$package"
done

for filename in .*; do
  link_file "$filename"
done

cd "$HOME/.vim/pack/plugins/start"
git submodule update --init --recursive
cd -

cd "$HOME/.vim/pack/plugins/opt"
git submodule update --init --recursive
cd -

sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mv "$HOME/.zshrc" "$HOME/.zshrc-ohmyzsh"
mv "$HOME/.zshrc.pre-oh-my-zsh" "$HOME/.zshrc"

# theme installation here
mkdir -p "$HOME/.oh-my-zsh/custom/themes"
curl https://raw.githubusercontent.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme > \
  "$HOME/.oh-my-zsh/custom/themes/bullet-train.zsh-theme"

# neovim setup
ln -sf $HOME/dotfiles/.config/nvim/init.vim $HOME/.config/nvim/
ln -sf $HOME/dotfiles/.config/nvim/coc-settings.json $HOME/.config/nvim/

if $mac_os; then
  brew install zsh-autosuggestions
else
  mkdir -p "$HOME/.oh-my-zsh/custom/plugins"
  git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
fi

