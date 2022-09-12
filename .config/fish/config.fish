if status is-interactive
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
end
