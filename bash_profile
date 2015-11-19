export EDITOR=emacs
export GIT_EDITOR=emacs
#export VISUAL=emacs

alias ls="ls -G"
alias ll="ls -lh"

alias skey_me="ssh-add -D && ssh-add ~/.ssh/padillac_luckbox_rsa"

# alias eax="source ~/.bash_profile"

## rbenv
# export RBENV_ROOT=/usr/local/var/rbenv
# export PATH="/usr/local/var/rbenv/shims:$PATH"
# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

## homebrew openssl
#export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt
#export SSL_CERT_FILE=/usr/local/etc/openssl/cert.pem

## I don't even remember
# export JAVA_HOME=$(/usr/libexec/java_home)

#alias postgres_start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
#alias postgres_stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

#alias run_redis='redis-server /usr/local/etc/redis.conf'

#export PATH="$HOME/bin:/Applications/calibre.app/Contents/MacOS:$PATH"

source /usr/local/etc/bash_completion.d/git-completion.bash

# add current branch to git prompt
source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
PS1="\u@\h:\W \$(__git_ps1 \"(%s)\")\$ "

# keep some stuff private
if [ -d ~/.bash_private ]; then
   source ~/.bash_private/*
fi
