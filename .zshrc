DEFAULT_USER=pdegeus

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

autoload -U compinit && compinit

zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zdharma-continuum/fast-syntax-highlighting


# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# preview content
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'lsd --color always $realpath'
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'

# zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

zinit cdreplay -q

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{exports,path,aliases,functions,extra,motd}; do
	[ -r "$file" ] && source "$file"
done
unset file

eval "$(fzf --zsh)"
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/custom.toml)"

