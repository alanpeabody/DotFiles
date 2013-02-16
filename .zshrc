# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

export TERM=xterm-256color

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="alanpeabody"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails3 ruby vi-mode rvm lein)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# Add ~/bin to path
export PATH=$HOME/bin:$PATH

# Add vagrant to path
export PATH=/opt/vagrant/bin:$PATH

# Add elixir to path
export PATH=$HOME/elixir/elixir-0.8.0/bin:$PATH

# Make ZSH vi mode behave more like vim mode
bindkey -M viins 'jj' vi-cmd-mode
bindkey -M viins '^?' backward-delete-char

# Control r for search
bindkey -M viins '^r' history-incremental-search-backward
bindkey -M vicmd '^r' history-incremental-search-backward

# modify up down behavior to search based on current command
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

export EDITOR=vim

# System shortcuts
alias git='nocorrect git'
alias ll='ls -lth'
alias lla='ls -ltha'
alias be='bundle exec'

# Cassandra
export CASSANDRA_HOME="$HOME/cassandra"
export PATH=$PATH:$CASSANDRA_HOME/bin

# On OSX...
if [ $(uname) = "Darwin" ] ; then
  # Use mvim in terminal mode with better clipboard support
  alias vim='mvim -v'

  # Use tmux OSX config
  alias tmux="TERM=xterm-256color tmux -2 -f $HOME/.tmux.osx.conf"

  # Add sbin to path (for homebrew/rabbitmq)
  export PATH=$PATH:/usr/local/sbin
fi

# On Linux
if [ $(uname) != "Darwin" ] ; then

  # Use tmux linux config
  alias tmux="TERM=xterm-256color tmux -2 -f $HOME/.tmux.linux.conf"
fi

# On Ubuntu...
if [ $(uname -a | grep Ubuntu | wc -l) = 1 ] ; then
  alias ack='ack-grep'
fi

# Tmux
alias topen='tmuxinator open'
alias tstart='tmuxinator start'
alias ttest='tmux new-session -s tests -t'
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# RVM
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
