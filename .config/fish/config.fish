if status is-interactive
    # greeting
    set -U fish_greeting

    # nvim as default editor
    set -Ux EDITOR "nvim"

    # alias vim to nvim if it is installed
    if type nvim >/dev/null 2>&1
        alias vim nvim
    end

    # set vim bindings
    set -U fish_key_bindings fish_vi_key_bindings
    # search up
    bind \cp up-or-search
    bind -M insert \cp up-or-search
    # search down
    bind \cn down-or-search
    bind -M insert \cn down-or-search
    # complete one word
    bind -M insert  \cl forward-word
    # uncomplete one word
    bind -M insert  \ch backward-kill-word
    # complete whole word
    bind -M insert \cj end-of-line
    # exit insert mode
    bind -M insert \cc "" -m default repaint
    # clear
    bind -M default \cl "clear; commandline -f repaint" -m insert
end
