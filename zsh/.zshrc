# can't use it because autocomplete overrides the map
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

#################################################
### SETTINGS
#################################################
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'

bindkey -v                      # vim keys
setopt autocd                   # auto-cd

# CTR-R search
bindkey "^R" history-incremental-pattern-search-backward
stty stop undef
bindkey "^S" history-incremental-pattern-search-forward

# autocompletion
bindkey '\0' forward-char
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

#################################################
### SYNTAX HIGHLIGHTING
#################################################
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# di=directory,ow=otherwriteable, 
export LS_COLORS="di=90:ex=93:*.jpg=1;41:ow=90"

# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md
ZSH_HIGHLIGHT_STYLES[precommand]=fg=#00ee00
ZSH_HIGHLIGHT_STYLES[command]=fg=#ffdf00
ZSH_HIGHLIGHT_STYLES[alias]=fg=#ffdf00
ZSH_HIGHLIGHT_STYLES[builtin]=fg=#ffdf00
ZSH_HIGHLIGHT_STYLES[default]=fg=#d1d1e1
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=#00cc00
# ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=#00cc00
ZSH_HIGHLIGHT_STYLES[arg0]=fg=#afc350
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=#ff0000
ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=#3e7eff
ZSH_HIGHLIGHT_STYLES[path]=fg=#918273,underline
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=#afc350

#################################################
### PROMPT
#################################################

# This removes the '%' or '#' when printing a partial line
PROMPT_EOL_MARK=''

COLDIR='61'
COLERR='1'
ENDSYM='>>'

autoload -Uz vcs_info
precmd() { vcs_info }
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%F{46}[%b]%f'
zstyle ':vcs_info:*' enable git

PROMPT='%F{$COLDIR}@%m:%F{46} %1~${vcs_info_msg_0_} %(?.%F{COLDIR}$ENDSYM.%F{$COLERR}$ENDSYM)%f%b '

#################################################
### ALIASES
#################################################

# DIRS
alias cdb="cd $HOME/.local/bin"
alias cdc="cd $HOME/.config"
alias cde="cd $HOME/editor"
alias cdt="cd $HOME/.local/share/Trash/files/"

# MAIN
alias sos="source $HOME/.config/zsh/.zshrc"
alias mki="sudo make clean install"
alias ki="sudo killall"
alias ls="ls --color"
alias ll="ls -al --color"
alias grep="grep --color"
alias vi="nvim"
alias py="python -c 'import code; import readline; readline.parse_and_bind(\"set editing-mode vi\"); code.interact(local=locals())'"
alias duh="du -h --max-depth=1 | sort -hr"
alias rm="gio trash"

# GIT
alias ga="git add"
alias gaa="git add ."
alias gc="git commit -m $1"
alias gs="git status"
alias gpp="git push -u origin master"
alias glc="git log --reverse --pretty=reference"
alias gdf="git diff"
alias glz="lazygit"
alias glg="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
# alias gpr="git push -f"
# alias gss="git status -s"
# alias ga="git add"

# DOCKER
alias dk="docker"
alias dke="docker exec -it"
alias dkc="docker-compose"

# K8
alias k="kubectl"

# TERRAFORM
alias tf="terraform"
alias tfaa="terraform apply --auto-approve"

# TMUX
alias t="tmux"
alias ta="t a -t"
alias tls="t ls"
alias tn="t new -t"

# MANPAGES
#Simple Prompt Escapes from zsh manpage
alias zpes="man zshmisc | sed -n '2030,$'p | less"
#VCS Info Module information from zsh manpage
alias zvcs="man zshcontrib | sed -n '800,$'p | less"
#Complist Module from zsh manpage
alias zlst="man zshmodules | sed -n '251,$'p | less"
#Completion System from zsh manpage
alias zcom="man zshcompsys"

function c() python3 -c "from math import *; print($*);"
alias c='noglob c'

#################################################
### FUNCTIONS
#################################################

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
    vi-yank vi-yank-eol vi-delete vi-backward-kill-word
)
local paste_widgets=(
    vi-put-{before,after}
)

# NB: can atm. only wrap native widgets
x11-clip-wrap-widgets copy $copy_widgets
x11-clip-wrap-widgets paste  $paste_widgets

#################################################
### PATHS
#################################################

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/rvv/temp/google-cloud-sdk/path.zsh.inc' ]; then . '/home/rvv/temp/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/rvv/temp/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/rvv/temp/google-cloud-sdk/completion.zsh.inc'; fi

if [ -e /home/rvv/.nix-profile/etc/profile.d/nix.sh ]; then source /home/rvv/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

[ -f ~/.config/fzf/.fzf.zsh ] && source ~/.config/fzf/.fzf.zsh
