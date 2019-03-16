# ZSH
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="fishy"
plugins=(git command-not-found vi-mode z httpie emoji)

source $ZSH/oh-my-zsh.sh
export PS1='%{$fg[$user_color]%}$(_fishy_collapsed_wd)%{$reset_color%}%(!.#.>) '

#################### CUSTOM ######################

if [ -f "$HOME/.env" ]; then
  source "$HOME/.env"
fi


export DOTFILES_PATH=$(cd "$(dirname $(readlink -m ~/.zshrc))" && git rev-parse --show-toplevel)

export NVM_DIR=$(readlink -m "$HOME/.nvm")
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

alias ls="ls -G --color=auto -F"
alias stow="stow -v"
alias mm="xmodmap ~/.xmodmap"
alias ssh="TERM=xterm ssh"
function git_root() {
    cd $(git rev-parse --show-toplevel)
}

BASE16_SHELL="$DOTFILES_PATH/misc/shell/base16-shell/"
LIQUID_PROMPT="$DOTFILES_PATH/misc/shell/liquidprompt/"
[ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ] && eval "$($BASE16_SHELL/profile_helper.sh)"
#[ -n "$PS1" ] && [ -s "$LIQUID_PROMPT/liquidprompt" ] && source "$LIQUID_PROMPT/liquidprompt"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
