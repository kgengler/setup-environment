# shellcheck disable=SC1091

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# import the git completion scripts
if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
    # shellcheck source=/dev/null
    source "$(brew --prefix)/etc/bash_completion"
fi
if [ -s "/usr/local/git/contrib/completion/git-prompt.sh" ]; then
    # shellcheck source=/dev/null
    source /usr/local/git/contrib/completion/git-prompt.sh
    GIT_PS1_SHOWDIRTYSTATE=true; export GIT_PS1_SHOWDIRTYSTATE
    git_completion=yes
fi

# Set terminal PS1
if [ "$git_completion" = yes ]; then
    PS1='\[\033[01;32m\]\u:\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 " (%s)")\$ '
else
    PS1='\[\033[01;32m\]\u:\[\033[01;34m\]\w\[\033[00m\]\$ '
fi

unset git_completion


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
  fi
fi

# Initialize rbenv
if [ -n "$(which rbenv)"  ]; then
    eval "$(rbenv init -)"
fi

# Globals
ANSIBLE_NOCOWS=1; export ANSIBLE_NOCOWS
EDITOR='nvim'; export EDITOR
GPG_TTY=$(tty); export GPG_TTY
JAVA_HOME=$(/usr/libexec/java_home); export JAVA_HOME
SSH_AUTH_SOCK=~/.gnupg/S.gpg-agent.ssh; export SSH_AUTH_SOCK

# Fix GPG agent for SSH auth TTY
gpg-connect-agent updatestartuptty /bye >/dev/null

# Set up path
PATH="$PATH:$HOME/.cargo/bin"
PATH="$PATH:$JAVA_HOME/bin"
PATH="$PATH:/usr/local/opt/node@6/bin"
PATH="/usr/local/sbin:$PATH"
export PATH

# Aliases
alias ed='ed -p:'
alias gpg='gpg2'
alias ls='ls -alh'
alias pwgen='pwgen -sN 1'
alias rirb='irb -r "rails"'
alias sockstat='lsof -i -n -P | grep TCP'
alias tailf='tail -f'
alias vi='nvim'
alias vim='nvim'

# Include custom profile local to machine
if [ -f ~/.bash_custom ]; then
    # shellcheck source=/dev/null
    source ~/.bash_custom
fi

