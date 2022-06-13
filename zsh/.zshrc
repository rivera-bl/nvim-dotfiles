export SHELL="zsh"
# export ZDOTDIR=$HOME/.config/zsh#Source aliases
# can't use it because autocomplete overrides the map
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

source "$HOME/.config/zsh/.zalias"
#Source prompt style
source "$HOME/.config/zsh/.zprompt"
#################################################
### SETTINGS
#################################################

bindkey -v                      # vim keys
setopt autocd                   # auto-cd

# CTR-R search
bindkey "^R" history-incremental-pattern-search-backward
stty stop undef
bindkey "^S" history-incremental-pattern-search-forward

# autocompletion
autoload -U compinit
zmodload zsh/complist
compinit
_comp_options+=(globdots)		            # include hidden files

# menu movement
zstyle ':completion:*' menu yes select  # suggestions with tab
bindkey '^[[Z' reverse-menu-complete

# history settings
HISTFILE=~/.config/zsh/history
HISTSIZE=100000
SAVEHIST=100000

setopt appendhistory
setopt INC_APPEND_HISTORY  
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS

# This removes the '%' or '#' when printing a partial line
PROMPT_EOL_MARK=''

#Function for Pasting Vi-Mode selection
#From: https://unix.stackexchange.com/questions/25765/pasting-from-clipboard-to-vi-enabled-zsh-or-bash-shell
function x11-clip-wrap-widgets() {
    # NB: Assume we are the first wrapper and that we only wrap native widgets
    # See zsh-autosuggestions.zsh for a more generic and more robust wrapper
    local copy_or_paste=$1
    shift

    for widget in $@; do
        if [[ $copy_or_paste == "copy" ]]; then
            eval "
            function _x11-clip-wrapped-$widget() {
                zle .$widget
               xclip -in -selection clipboard <<<\$CUTBUFFER
            }
            "
        else
            eval "
            function _x11-clip-wrapped-$widget() {
                CUTBUFFER=\$(xclip -out -selection clipboard)
                zle .$widget
            }
            "
        fi

        zle -N $widget _x11-clip-wrapped-$widget
    done
}

local copy_widgets=(
    vi-yank vi-yank-eol vi-delete vi-backward-kill-word vi-change-whole-line
)
local paste_widgets=(
    vi-put-{before,after}
)

# NB: can atm. only wrap native widgets
x11-clip-wrap-widgets copy $copy_widgets
x11-clip-wrap-widgets paste  $paste_widgets
 
source $HOME/.config/zsh/.zsyntax

function c() python3 -c "from math import *; print($*);"
alias c='noglob c'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/rvv/temp/google-cloud-sdk/path.zsh.inc' ]; then . '/home/rvv/temp/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/rvv/temp/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/rvv/temp/google-cloud-sdk/completion.zsh.inc'; fi

if [ -e /home/rvv/.nix-profile/etc/profile.d/nix.sh ]; then source /home/rvv/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
