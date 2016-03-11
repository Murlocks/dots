#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

XDG_CONFIG_HOME="$HOME/.config"

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export PATH="$PATH:$HOME/bin"
