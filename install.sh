#!/bin/bash

which brew &>/dev/null && {
	brew update
	brew install zsh maven git
}

which apt-get &>/dev/null && {
	sudo apt-get update
	sudo apt-get -y install zsh git
}

if [[ -e ~/.zprezto ]]; then
	pushd ~/.zprezto
	git pull && git submodule update --init --recursive
	popd
else 
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

