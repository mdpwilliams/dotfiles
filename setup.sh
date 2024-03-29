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
  if [ "$1" == ".gitmodules" ] || [ "$1" == "setup.sh" ] || [ "$1" == "." ] || [ "$1" == ".." ] || [ "$1" == ".git" ]; then
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
fi

for package in "${packages[@]}"; do
  install_package "$package"
done

for filename in .*; do
  link_file "$filename"
done

# # Install latest neovim
# echo "Installing latest neovim"
# sudo apt purge neovim
# sudo add-apt-repository -y ppa:neovim-ppa/unstable
# sudo apt update
# sudo apt install -y neovim

if [ $SPIN ]; then
  # nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
  yarn global add neovim tree-sitter
  npm i -g typescript typescript-language-server
  pip3 install neovim
fi

sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mv "$HOME/.zshrc" "$HOME/.zshrc-ohmyzsh"
mv "$HOME/.zshrc.pre-oh-my-zsh" "$HOME/.zshrc"

# theme installation here
mkdir -p "$HOME/.oh-my-zsh/custom/themes"
curl https://raw.githubusercontent.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme > \
  "$HOME/.oh-my-zsh/custom/themes/bullet-train.zsh-theme"

if $mac_os; then
  brew install zsh-autosuggestions
else
  mkdir -p "$HOME/.oh-my-zsh/custom/plugins"
  git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.oh-my-zsh/plugins/zsh-autosuggestions"
fi

# enable github in spin if the file is present
if [ -f /etc/spin/secrets/copilot_hosts.json ]; then
  mkdir -p "${HOME}/.config/github-copilot"
  cp /etc/spin/secrets/copilot_hosts.json "${HOME}/.config/github-copilot/hosts.json"
fi
