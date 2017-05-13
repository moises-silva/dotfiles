# .bashrc
export PS1='\[\033[01;31m\]\u@\h \[\033[01;34m\]\W \n\$ \[\033[00m\]'

set -o vi
bind -m vi-insert "\M-.:yank-last-arg"
bind -m vi-insert "\M-_:yank-mth-arg"

alias vi=vim
alias screen="screen -h 100000"
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

export HISTSIZE=10000
export EDITOR=vim
shopt -s histappend

ssh_key=""
if [ -f $HOME/.ssh/id_rsa ]; then
	ssh_key=$HOME/.ssh/id_rsa
fi

# Start keychain
if [ -f /usr/bin/keychain ] && [ "x$ssh_key" != "x" ]; then
	/usr/bin/keychain -q $ssh_key
	source $HOME/.keychain/$HOSTNAME-sh
fi

if [ -f $HOME/.git-completion.bash ]
then
	. $HOME/.git-completion.bash
	export PS1='\[\033[01;31m\]\u@\h \[\033[01;34m\]\W$(__git_ps1 " (%s)") \n\$ \[\033[00m\]'
fi

ulimit -c unlimited
