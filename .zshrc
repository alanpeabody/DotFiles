# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

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

# Sentalis
export QUEUE=csv_importer,pre_calculator,alarms,csv_importer_backlogged,pre_calculator_backlogged,alarms_backlogged,data_export,setup
alias wip='bundle exec cucumber -p wip'
alias dbreset='bundle && thor import_from_prod:stale --app && rake migrate:all && RAILS_ENV=cucumber rake db:schema:load'
alias fullcuke='bundle && bundle exec rake db:schema:load RAILS_ENV=cucumber && bundle exec cucumber -t ~@slow'
alias guardr='bundle exec guard -c -g rspec -n f'
alias guardc='bundle exec rake db:schema:load RAILS_ENV=cucumber && bundle exec guard -c -g cucumber -n f'

# Vim Clojure
export VIMCLOJURE_SERVER_JAR="$HOME/.vim/vim-clojure/server-2.3.1.jar"

# Cassandra
export CASSANDRA_HOME="$HOME/cassandra"
export PATH=$PATH:$CASSANDRA_HOME/bin

# On OSX...
if [ $(uname) = "Darwin" ] ; then
  # Use mvim in terminal mode with better clipboard support
  alias vim='mvim -v'

  # Add sbin to path (for homebrew/rabbitmq)
  export PATH=$PATH:/usr/local/sbin
fi

# On Ubuntu...
if [ $(uname -a | grep Ubuntu | wc -l) = 1 ] ; then
  alias ack='ack-grep'
fi

# Tmux
alias tmux='tmux -2'
alias topen='tmuxinator open'
alias tstart='tmuxinator start'
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# RVM
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
