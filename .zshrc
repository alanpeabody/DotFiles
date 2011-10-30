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
# export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails3 ruby vi-mode rvm)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# Node.js/npm path
#export PATH=$HOME/local/bin:$PATH

# Make ZSH vi mode behave more like vim mode
bindkey -M viins "jj" vi-cmd-mode
bindkey -M viins '^r' history-incremental-search-backward
bindkey -M vicmd '^r' history-incremental-search-backward
bindkey -M viins '^?' backward-delete-char

export EDITOR=vim
alias ack=ack-grep
export QUEUE=csv_importer,pre_calculator,alarms,csv_importer_backlogged,pre_calculator_backlogged,alarms_backlogged,data_export,setup
alias wip='cucumber -p wip'
alias dbreset='bundle && thor import_from_prod:stale --app && rake migrate:all && RAILS_ENV=cucumber rake db:schema:load'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
