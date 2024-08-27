# Aliases
alias df "duf -only local"
alias du dust
alias l "eza --icons -F -H --group-directories-first --git"
alias ll "eza --icons -F -H --group-directories-first --git -all"
alias lt "eza --tree -L 3"
alias cp "cp -r"
alias vi nvim
alias vim nvim

set -g fish_greeting
set -g fish_key_bindings fish_vi_key_bindings

# Cursor styles
set -gx fish_vi_force_cursor 1
set -gx fish_cursor_default block
set -gx fish_cursor_insert line blink
set -gx fish_cursor_visual block
set -gx fish_cursor_replace_one underscore

#Editor
set -gx EDITOR nvim
set -gx VISUAL $EDITOR
set -gx SUDO_EDITOR $EDITOR

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH
