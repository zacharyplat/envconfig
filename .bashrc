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

ENV_FILE=~/.env
if [ -f "$ENV_FILE" ]; then
  source "$ENV_FILE"
fi

source ~/.nvmstuff

# New prompt with git information
export GITAWAREPROMPT=~/.bash/git-aware-prompt

source "${GITAWAREPROMPT}/main.sh"

PS1="\n[\[\033[0;32m\]\h\[\033[0m\]:\[\033[0;37m\]\u\[\033[0m\] \[$txtcyn\]\$git_branch \[$txtred\]\$git_dirty\[$txtylw\]\$git_ahead_behind\[$txtrst\] \w]\n$ "


# Add colors to ls
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

function zpdiff
{
  icdiff -r "$@" | less -r
}

[[ $- == *i* ]] || return 0
