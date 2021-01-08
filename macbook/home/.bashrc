# .bashrc

echo 'Hello from .bashrc'

# User specific aliases and functions
# NB. Always append to path in .bash_profile to avoid duplication.

# Java environment
# Environment variables are set in .bash_profile
alias java8='export JAVA_HOME=$JAVA_8_HOME'
alias java11='export JAVA_HOME=$JAVA_11_HOME'
alias java15='export JAVA_HOME=$JAVA_15_HOME'
alias corretto11='export JAVA_HOME=$CORRETTO_11_HOME'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# set default to Java SDK version
corretto11

alias la='ls -A'
alias lal='ls -Alh'
alias ..='cd ../'
#shopt -s autocd
alias d-c='docker-compose'
alias grep='grep --color=auto'
alias vimcode='nvim $(fd --hidden --color auto --type f | fzf)'
alias vimjava='nvim $(fd --color auto --type f --extension java | fzf)'
alias ideajava='idea $(fd --color auto --type f --extension java | fzf)'
alias gs='git status'
alias gb='git branch'
alias gba='git branch --all'
alias gl='git log'

shopt -s expand_aliases
shopt -s histappend
shopt -s checkwinsize

# use vi editing mode, rather than the default emacs mode
set -o vi

# fuzzy find and keyboard shortcuts for FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

