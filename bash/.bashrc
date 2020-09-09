# Platform-specific configuration
ARCH=$(uname)
if [[ "$ARCH" == "Darwin" ]]; then
	# Mac specific things

	# -GF means colorize output using LSCOLORS env variable
	alias ls="ls -GF"
	alias lsl="ls -GF -lah"
	
	# Colors for ls command, see man ls for description of how used
	export LSCOLORS=ExGxBxDxCxegedabagacad

	# Make sure that sublime text executable 'subl' on PATH on Mac
	if [[ -d /Applications/Sublime\ Text.app/Contents/SharedSupport/bin ]]; then
    	export PATH=$PATH:/Applications/Sublime\ Text.app/Contents/SharedSupport/bin
	fi
elif [[ "$ARCH" == "Linux" ]]; then
	# Linux specific things
	alias ls="ls -F --color"
	alias lsl="ls -F -lah --color"
fi
#else
#	# Cygwin specific things
#fi

# The following configurations apply to all platforms

# Source .bashrc.local, if it exists
if [[ -f ~/.bashrc.local ]]; then
   	source ~/.bashrc.local
fi

# Determine current git branch
# Possible more efficient alternative? http://aaroncrane.co.uk/2009/03/git_branch_prompt/
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Set up grep color options
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;35;40'

# Set the prompt string
# Notes: 
#   (1) single quotes are required to prevent the $(parse_git_branch) from being
#       evaluated when the .bashrc file is sourced.
#   (2) More details here: https://www.cyberciti.biz/tips/howto-linux-unix-bash-shell-setup-prompt.html
PS1='\[\e[1;30m\]\u@\h\[\e[1;32m\]$(parse_git_branch)\[\e[1;30m\]:\W\[\e[0m\] $ '

# Enable tab-completion of git branches
source ~/.git-completion.bash

# Catch any locally installed files
export PATH="/usr/local/bin:$PATH"

# Homebrew puts executables in /usr/local/sbin
export PATH="/usr/local/sbin:$PATH"

# curl-trace (https://github.com/wickett/curl-trace)
alias curl-trace='curl -w "@$HOME/.curl-format"'

function enscriptCode() {  enscript --line-numbers -numbers -Ecpp -r2 -o - "$@" | ps2pdf - "$@".pdf; }

# Don't allow overwrite on stdout redirect
set -o noclobber

# Aliases for common commands
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

# Activate a Python virtualenv
alias activate="source */bin/activate"

# curl-trace (https://github.com/wickett/curl-trace)
alias curl-trace='curl -w "@$HOME/.curl-format"'

# Huge history. Doesn't appear to slow things down, so why not?
HISTSIZE=500000
HISTFILESIZE=100000

# Avoid duplicate entries
HISTCONTROL="erasedups:ignoreboth"

# Don't record some commands
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"

## SMARTER TAB-COMPLETION (Readline bindings) ##

# Perform file completion in a case insensitive fashion
bind "set completion-ignore-case on"

# Treat hyphens and underscores as equivalent
bind "set completion-map-case on"

# Display matches for ambiguous patterns at first tab press
bind "set show-all-if-ambiguous on"

# Show character after file in list of matches denoting file type
bind "set visible-stats on"

# Editor
# export EDITOR=vim
