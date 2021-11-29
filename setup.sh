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
  link=$HOME/.$1

  if [ "$1" == ".vim" ]; then
    link=$HOME/$1
  fi

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
  "neovim"
)

if $mac_os; then
  packages+=(
    "bat"
    "glow"
    "the_silver_searcher"
    "zsh-completions"
  )
else
  packages+=(
    "silversearcher-ag"
  )
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

# sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# mv "$HOME/.zshrc" "$HOME/.zshrc-ohmyzsh"
# mv "$HOME/.zshrc.pre-oh-my-zsh" "$HOME/.zshrc"

# theme installation here

if $mac_os; then
  brew install zsh-autosuggestions
else
  # mkdir -p "$HOME/.oh-my-zsh/custom/plugins"
  # git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
fi

if [ $SPIN ]; then
  git config --global --unset-all credential.helper

  for dir in ~/src/github.com/Shopify/*/ ; do
    cd $dir
    git shopify
    cd - >/dev/null
  done
fi
