# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Add colors to ls
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Aliases from bash
alias ..="cd .."
[ -x /usr/local/bin/vim ] && alias vim="/usr/local/bin/vim"
[ -x /usr/local/bin/vim ] && alias vi="/usr/local/bin/vim"
[ -x /usr/local/bin/ggrep ] && alias grep="/usr/local/bin/ggrep"
alias fin="find ."


# some more ls aliases
alias ls='ls -FGh -G'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add additional autocomplete functionality
zstyle ':completion:*:*:git:*' script /usr/local/etc/bash_completion.d/git-completion.bash
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -U compinit && compinit
zmodload -i zsh/complist
zstyle ':completion:*' menu select

# nvm stuff
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -e ~/.crud ] &&  \. ~/.crud
