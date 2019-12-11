#!/bin/bash

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# ignore commands that are repetative and useless in history
HISTIGNORE='ls:ll'

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

ENV_FILE=$HOME/.env
if [ -f "$ENV_FILE" ]; then
  source "$ENV_FILE"
fi

source ~/.nvmstuff

# New prompt with git information
export GITAWAREPROMPT=~/.bash/git-aware-prompt

PS1="\n[\[\033[0;32m\]\h\[\033[0m\]:\[\033[0;37m\]\u\[\033[0m\] \[$txtcyn\]\$git_branch \[$txtred\]\$git_dirty\[$txtylw\]\$git_ahead_behind\[$txtrst\] \w]\n$ "


# Add colors to ls
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

function zpdiff
{
  icdiff -r "$@" | less -r
}

function gitcof
{
  git checkout feature/GDPR-$1
}

[[ $- == *i* ]] || return 0

npm() {
  if [[ $1 == "install" ]]; then
    if [[ -z $2 ]]; then
      command yarn install
    else
      command yarn add $2
    fi
  else
    command npm "$@"
  fi
}

#Add bin to path
export PATH="$HOME/bin:$PATH"
