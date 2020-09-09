###### General
autoload -U compinit colors vcs_info
colors
compinit
REPORTTIME=5

###### History
HISTFILE=~/.zhistory
HISTSIZE=5000
SAVEHIST=5000
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_SPACE
setopt CORRECT_ALL

###### Prompt 
setopt prompt_subst
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:*' unstagedstr '!'
zstyle ':vcs_info:*' formats '%F{green} (%b%u%c)%m%f'
zstyle ':vcs_info:*' actionformats '%F{green} (%b%u%c|a) %m%f'
PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b${vcs_info_msg_0_} %# '

###### Autocompletion
zstyle ':completion:*' completer _complete _correct _approximate

###### Platform-specific configuration
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

	# Case insensitive globbing on Mac
	setopt NO_CASE_GLOB
elif [[ "$ARCH" == "Linux" ]]; then
        # Linux specific things
        alias ls="ls -F --color"
        alias lsl="ls -F -lah --color"
fi

# Source local file .zshrc.local if it exists for local settings
if [[ -f ~/.zshrc.local ]]; then
        source ~/.zshrc.local
fi

