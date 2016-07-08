DEFAULT_USER=pdegeus
ZSH_THEME="agnoster"

AGEN=""
which brew > /dev/null && {
	AGEN="$(brew --prefix)/share/antigen.zsh"
} || {
	AGEN="/usr/share/zsh-antigen/antigen.zsh"
}
[ -f "$AGEN" ] && source "$AGEN"

antigen use oh-my-zsh
antigen theme agnoster
which git > /dev/null && antigen bundle git
which svn > /dev/null && antigen bundle svn-fast-info
which mvn > /dev/null && antigen bundle mvn 
which npm > /dev/null && antigen bundle npm
which gulp > /dev/null && antigen bundle gulp
which grunt > /dev/null && antigen bundle grunt

which brew > /dev/null && {
	antigen bundle osx 
	antigen bundle brew
}

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{exports,path,aliases,functions,extra}; do
	[ -r "$file" ] && source "$file"
done
unset file

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#  plugins=(git mvn npm osx brew svn-fast-info gulp grunt)

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

#  test -e $ZSH/oh-my-zsh.sh && source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"


#ZSH_HL=/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#test -e "${ZSH_HL}" && source "${ZSH_HL}"
