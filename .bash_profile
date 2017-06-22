ssh-add -A &> /dev/null

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# import the git completion scripts
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
fi
if [ -s "/usr/local/git/contrib/completion/git-prompt.sh" ]; then
    source /usr/local/git/contrib/completion/git-prompt.sh
    GIT_PS1_SHOWDIRTYSTATE=true
    git_completion=yes
fi

# Set terminal PS1
if [ "$git_completion" = yes ]; then
    PS1='\[\033[01;32m\]\u:\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 " (%s)")\$ '
else
    PS1='\[\033[01;32m\]\u:\[\033[01;34m\]\w\[\033[00m\]\$ '
fi
unset git_completion

# Import aliases from ~/.bash_aliases, instead of adding them here directly.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# create gpg agent
if [ -f ~/.gnupg/.gpg-agent-info ] && [ -n "$(pgrep gpg-agent)" ]; then
    source ~/.gnupg/.gpg-agent-info
    export GPG_AGENT_INFO
else
    eval $(gpg-agent --daemon)
fi

# initialize rbenv if installed
if [ -n "$(which rbenv)"  ]; then
    eval "$(rbenv init -)"
fi

# Globals
export JAVA_HOME=$(/usr/libexec/java_home)
export EDITOR='nvim'
export GPG_TTY=$(tty)

# Add to path
export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:/usr/local/opt/node@6/bin"
export PATH="$PATH:$JAVA_HOME/bin"

# Aliases
alias ed='ed -p:'
alias gpg='gpg2'
alias tailf='tail -f'
alias vi='nvim'
alias vim='nvim'
alias sockstat='lsof -i -n -P | grep TCP'
alias ls='ls -alh'
alias rirb='irb -r "rails"'

