#!/bin/sh

# Install Brew and Cask
echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo "Installing Cask..."
brew tap homebrew/cask

# needs
brew install trash-cli
brew install git
brew install node
brew install node@10
brew install docker

brew install zsh-autosuggestions zsh-syntax-highlighting

brew install zsh
brew install z
brew install ag
brew install fzf
brew install bat

brew install vim
brew link vim # link to override the systems installed vim
brew install neovim

brew install kubectl
brew install k9s
brew install jesseduffield/lazydocker/lazydocker

brew install koekeishiya/formulae/skhd
brew install yabai

brew install gh

brew cask install iterm2
brew cask install google-chrome
brew cask install slack
brew cask install spotify
brew cask install alfred
brew cask install 1password
brew cask install hazel
brew cask install dash

# Clone dot files?

