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

  # vim bindings
  fish_vi_key_bindings

  # bind <c-l> to complete one word
  bind -M insert  \cl forward-word
  # bind <c-j> to complete whole word
  bind -M insert \cj end-of-line
end

# Cargo
fish_add_path $HOME/.cargo/bin
