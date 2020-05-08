. "$HOME/.bashrc"

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -r $HOME/.rvm/scripts/completion ]] && source $HOME/.rvm/scripts/completion
export PATH=/usr/local/bin:$PATH
