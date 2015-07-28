# .bashrc

export PATH="$PATH:/usr/sbin:/sbin:/usr/local/bin:$HOME/bin"
export PS1='\[\033[01;31m\]\u@\h \[\033[01;34m\]\W$(__git_ps1 " (%s)") \n\$ \[\033[00m\]'

function Make() {
	nice make $* 2>&1 | tee make.out
}

set -o vi
bind -m vi-insert "\M-.:yank-last-arg"
bind -m vi-insert "\M-_:yank-mth-arg"

alias ls="ls --color=never"
alias vi=vim
alias screen="screen -h 100000"
alias rgdb="gdb -x .gdb_restore.gdb"
alias ssha="ssh -A"

export HISTSIZE=10000
export EDITOR=vim
shopt -s histappend

ssh_key=""
if [ -f $HOME/.ssh/id_rsa ]; then
	ssh_key=$HOME/.ssh/id_rsa
fi
if [ -f $HOME/.ssh/id_dsa ]; then
	ssh_key=$HOME/.ssh/id_dsa
fi

# Start keychain
if [ -f /usr/bin/keychain ] && [ "x$ssh_key" != "x" ]; then
	/usr/bin/keychain -q $ssh_key
	source $HOME/.keychain/$HOSTNAME-sh
fi

if [ -f $HOME/.git-completion.bash ]
then
	. $HOME/.git-completion.bash
fi

ulimit -c unlimited

function Python27() {
	export LD_LIBRARY_PATH="/opt/python2.7/lib:$LD_LIBRARY_PATH"
	export PATH="/opt/python2.7/bin:$PATH"
}

