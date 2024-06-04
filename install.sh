#!/bin/bash

which brew &>/dev/null && {
	brew update
	brew upgrade
	brew install zsh maven git svn wget ruby watch zopfli sqlite bat prettyping htop diff-so-fancy ncdu fzf jq lsd neofetch
	$(brew --prefix)/opt/fzf/install --all
}

which diff-so-fancy &>/dev/null && git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"

which apt-get &>/dev/null && {
	sudo apt-get update
	sudo apt-get -y install zsh git wget curl screen ruby ruby-dev fzf snapd neofetch
	sudo snap install lsd
	cp /usr/share/doc/fzf/examples/key-bindings.zsh ~/.fzf.zsh
}

zprezto-update

which pip &>/dev/null && {
	pip install pygments
}

if [[ ! -e ~/.zprezto ]]; then
	git clone --recursive https://github.com/sorin-ionescu/prezto.git ~/.zprezto
fi

# If this user's login shell is not already "zsh", attempt to switch.
TEST_CURRENT_SHELL=$(expr "$SHELL" : '.*/\(.*\)')
if [ "$TEST_CURRENT_SHELL" != "zsh" ]; then
    # If this platform provides a "chsh" command (not Cygwin), do it, man!
    if hash chsh >/dev/null 2>&1; then
      printf "Time to change your default shell to zsh!\n"
      chsh -s $(grep /zsh$ /etc/shells | tail -1)
    # Else, suggest the user do so manually.
    else
      printf "I can't change your shell automatically because this system does not have chsh.\n"
      printf "Please manually change your default shell to zsh!\n"
    fi
fi

