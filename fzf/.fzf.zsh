# Setup fzf
# ---------
if [[ ! "$PATH" == *$HOME/repos/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}$HOME/repos/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOME/.config/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$HOME/.config/fzf/shell/key-bindings.zsh"
