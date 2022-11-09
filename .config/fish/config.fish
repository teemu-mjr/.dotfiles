if status is-interactive
    # greeting
    set -U fish_greeting ""

    # nvim as default editor
    set -Ux EDITOR "nvim"

    # start tmux
    # if not set -q TMUX
    #     set -g TMUX tmux new-session -d -s base
    #     eval $TMUX
    #     tmux attach-session -d -t base
    # end

    # oh-my-posh
    oh-my-posh init fish --config ~/.craver.omp.json | source

    # set vim bindings
    set -g fish_key_bindings fish_vi_key_bindings
    # search up
    bind \cp up-or-search
    bind -M insert \cp up-or-search
    # search down
    bind \cn down-or-search
    bind -M insert \cn down-or-search
    # complete one word
    bind -M insert  \cl forward-word
    # complete whole word
    bind -M insert \cj end-of-line
    # exit insert mode
    bind -M insert \cc "" -m default repaint
    # clear line
    bind -M insert \ec kill-whole-line repaint
    # change insert mode indicators
    function fish_mode_prompt
        switch $fish_bind_mode
            case default
            set_color --bold red
            echo 'N'
            case insert
            set_color --bold green
            echo 'I'
            case replace_one
            set_color --bold green
            echo 'R'
            case visual
            set_color --bold brmagenta
            echo 'V'
            case '*'
            set_color --bold red
            echo '?'
        end
        set_color normal
    end
end
