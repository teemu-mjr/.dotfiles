if status is-interactive
    # greeting
    set -U fish_greeting ""

    # nvim as default editor
    set -Ux EDITOR "nvim"

    # start tmux
    if not set -q TMUX
        set -g TMUX tmux new-session -d -s base
        eval $TMUX
        tmux attach-session -d -t base
    end

    # oh-my-posh
    oh-my-posh init fish --config ~/.craver.omp.json | source

    # bind <c-o> to up arrow
    bind \co up-or-search
    # bind <c-n> to down arrow
    bind \cn down-or-search
    # bind <c-h> to move back a word
    bind \ch backward-word
    # bind <c-l> to complete one word
    bind \cl forward-word
    # bind <c-j> to complete whole word
    bind \cj end-of-line
    # bind exit
    bind \cq exit
end


