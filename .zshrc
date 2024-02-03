ZSH_TMUX_AUTOCONNECT=false
if [[ $TERMINAL_EMULATOR != JetBrains* ]]; then
  ZSH_TMUX_AUTOSTART=true
fi

export HISTFILESIZE=1000000000
export HISTSIZE=1000000000

setopt INC_APPEND_HISTORY
export HISTTIMEFORMAT="[%F %T] "
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS

export GOVERSION=1.20.13
export GOPATH=$HOME/Go
export GOBIN=$GOPATH/bin
export GOROOT=$HOME/Go/Sdk/go$GOVERSION
export PATH=$PATH:$GOROOT/bin:$GOBIN

MNML_PROMPT=(mnml_ssh mnml_pyenv mnml_status mnml_keymap 'mnml_cwd 2 0' mnml_git)
MNML_RPROMPT=()
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="minimal"
CASE_SENSITIVE="true"

plugins=(
    tmux
    git
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh