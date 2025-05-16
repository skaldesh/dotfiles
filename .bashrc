#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias pls='sudo'
alias ls='ls --color=auto'
alias ll='ls -lah'
alias gp='gopass show'
alias gpc='gopass show -c'
alias gps='gopass show'
alias sc='systemctl'
alias ping8='ping 8.8.8.8'
alias htpasswd='docker run --rm -ti xmartlabs/htpasswd'

# include the go tools
export PATH=$PATH:/usr/local/go/bin
# include home bin folder to path variable
export PATH=$PATH:$HOME/bin
# include go path bin
export PATH=$PATH:$GOPATH/bin
# include Qt tools
export PATH=$PATH:/usr/lib/qt6/bin

# Comand Completion.
# Complete also commands and file names.
complete -cf sudo
# Auto prepend cd when entering a file path.
shopt -s autocd
# Enable gopass bash auto completion.
source <(gopass completion bash)
# Enable git bash auto completion.
. /usr/share/git/completion/git-completion.bash
# Enable a custom prompt when inside a git repository.
. /usr/share/git/completion/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\w$(__git_ps1 " (%s)") \$ '
# Bash Command History.
export HISTCONTROL=erasedups
# Load c jump extension.
eval "$(jump shell --bind=c)"

# Set Editor variables.
export EDITOR=micro
export GIT_EDITOR=${EDITOR}
export SUDO_EDITOR=${EDITOR}

# Start ssh-agent.
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    rm -f ~/.ssh-agent-info
    ssh-agent -t 4h > ~/.ssh-agent-info
fi
# Import the env variables of ssh-agent, if undefined
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    eval "$(<~/.ssh-agent-info)" 1> /dev/null
fi

# Set Go env vars.
export GOPATH=$HOME/go
export GOPRIVATE="git.wahtari.m"
export GOBIN=$GOPATH/bin
export GOPROXY="https://gomods.wahtari.m"

# needed for Qt when using go1.10 or newer
export CGO_CXXFLAGS_ALLOW=".*" 
export CGO_LDFLAGS_ALLOW=".*" 
export CGO_CFLAGS_ALLOW=".*"
export QT_QPA_PLATFORM=wayland-egl
export QT_QPA_PLATFORMTHEME=gtk3

# Use wayland backend
export BEMENU_BACKEND=wayland

# Enable wayland for firefox.
export MOZ_ENABLE_WAYLAND=1
#export MOZ_LOG="PlatformDecoderModule:5"

# Flatpak
#export XDG_DATA_DIRS=/var/lib/flatpak/exports/share:/home/skaldesh/.local/share/flatpak/exports/share
