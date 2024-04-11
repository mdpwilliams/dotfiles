#! /bin/bash

cd "${0%/*}"

echo Linking Dotfiles
echo ----------------

for dotfile in src/**/*; do
  destination=~/.{dotfile:4} # remove src/ and prepend ~/.

  if [ -d "$dotfile" ] && [ ! -d "$destination" ]; then
    mkdir -p "$destination"
  fi

  if [ -f "$dotfile" ]; then
    echo "--- $dotfile -> $destination"
    ln -sf ${dotfile:P} "$destination"
  fi
done

echo Installing Dependencies
echo -----------------------

[[ "$(uname -s)" == "Darwin" ]] && mac_os=true || mac_os=false
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

install_package() {
  if $mac_os; then
    # Use reinstall so that this is idempotent
    brew reinstall "$1"
  else
    sudo apt-get install -y "$1"
  fi
  echo "--- Installed $1"
}

for package in "${packages[@]}"; do
  install_package "$package"
done

# sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# mv "$HOME/.zshrc" "$HOME/.zshrc-ohmyzsh"
# mv "$HOME/.zshrc.pre-oh-my-zsh" "$HOME/.zshrc"

# theme installation here
# mkdir -p "$HOME/.oh-my-zsh/custom/themes"
# curl https://raw.githubusercontent.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme > \
#   "$HOME/.oh-my-zsh/custom/themes/bullet-train.zsh-theme"

# if $mac_os; then
#   brew install zsh-autosuggestions
# else
#   mkdir -p "$HOME/.oh-my-zsh/custom/plugins"
#   git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.oh-my-zsh/plugins/zsh-autosuggestions"
# fi

if [[ $SPIN]]; then
  git config --global user.name "Mitchell Williams"
  git config --global user.email "mitchell.williams@shopify.com"
  git config --global --unset-all credential.helper
fi

# enable github in spin if the file is present
if [ -f /etc/spin/secrets/copilot_hosts.json ]; then
  mkdir -p "${HOME}/.config/github-copilot"
  cp /etc/spin/secrets/copilot_hosts.json "${HOME}/.config/github-copilot/hosts.json"
fi
