if status is-interactive

    #------------------------------------------------------------------------------#
    #                                     gopy                                     #
    #------------------------------------------------------------------------------#
    set -x LD_LIBRARY_PATH $LD_LIBRARY_PATH "."
    # set -gx PATH "$PATH:/usr/local/go/bin"
    # set -gx GOROOT "/usr/local/go"
    # set -gx GOROOT_BOOTSTRAP $GOROOT
    # set -gx GOPATH "/home/sergey/go"
    # set -gx PATH "$PATH:$GOPATH/bin"


    #------------------------------------------------------------------------------#
    #              Commands to run in interactive sessions can go here             #
    #------------------------------------------------------------------------------#
    # put prompt at the bottom
    printf '%.0s\n' (seq 1 100)

    
    #------------------------------------------------------------------------------#
    #                                  set alaises                                 #
    #------------------------------------------------------------------------------#
    alias v 'nvim'
    alias vf 'fzf --tmux 85% --preview "bat --color always {}"  --exit-0 | xargs -r nvim || true'
    alias fn 'n (fzf --tmux 85% --walker="dir,hidden" --preview "exa -la {}"); printf "%.0s\n" (seq 1 100); commandline -f repaint'
    alias ll 'eza -la --icons --git -a'
    alias lt 'eza --tree --level=2 --icons --git -a'
    alias ls lsd
    alias rmd 'rm -rf -- "$(pwd -P)" && cd ..'
    alias gore2 yaegi
    # set -gx TERMINAL alacritty
    # alias gogh 'bash -c "$(curl -sLo- https://git.io/vQgMr)"'

    
    #------------------------------------------------------------------------------#
    #                                terminal binds \c                               #
    #------------------------------------------------------------------------------#
    bind \c_ 'cd ~; commandline -f repaint' # good
    bind \cl 'printf "%.0s\n" (seq 1 100); commandline -f repaint' # good
    bind \cc 'cd $(fd --hidden --type d . | fzf --tmux 85%  --preview "exa -la --header {}"); printf "%.0s\n" (seq 1 100); commandline -f repaint' # good
    bind \ch '_fzf_search_history; printf "%.0s\n" (seq 1 100); commandline -f repaint' # good
    bind \cp '_fzf_search_processes; printf "%.0s\n" (seq 1 100); commandline -f repaint' # good
    # bind \cf 'fd --hidden . | fzf --preview "if test -d {};exa -la --header {};else if test -f {};bat --style=plain --color=always {};else; {};end;" --bind "ctrl-o:execute(nvim {} &> /dev/tty)"'
    bind \cf '_fzf_search_directory; printf "%.0s\n" (seq 1 100); commandline -f repaint'
    fzf_configure_bindings --variables=\e\cv

   
    #------------------------------------------------------------------------------#
    #                            external command binds \e                           #
    #------------------------------------------------------------------------------#
    bind \en fn
    bind \ev 'v (fd --hidden . | fzf --tmux 85% --preview "if test -d {};exa -la --header {};else if test -f {};bat --style=plain --color=always {};else; {};end;")'
    bind \ez 'zi; printf "%.0s\n" (seq 1 100); commandline -f repaint'
    bind \eg fzf_grep # bad

    
    #------------------------------------------------------------------------------#
    #                                 set variables                                #
    #------------------------------------------------------------------------------#
    # set -gx SMARTGIT_JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
    set -gx Z_DATA "$HOME/.z"
    set -gx PATH "$PATH:/home/sergey/.local/share/coursier/bin"
    set -gx fzf_fd_opts --hidden
    set -gx EDITOR "nvim"
    set fzf_directory_opts --bind "ctrl-o:execute(nvim {} &> /dev/tty)"
    set --export JAVA_HOME (dirname (dirname (readlink -f (which java))))
    set PATH $JAVA_HOME/bin $PATH
    set -gx PATH ~/spark/bin $PATH
    set -Ux LD_LIBRARY_PATH /usr/lib/x86_64-linux-gnu:/home/sergey/anaconda3/lib/
    set -gx PATH "/usr/local/cuda/bin:$PATH"
    set -gx CUDA_HOME "/usr/local/cuda"
    # set --export PATH "$JAVA_HOME/bin:$PATH"
    # set -gx FZF_DEFAULT_COMMAND 'fd . --hidden'

    
    #------------------------------------------------------------------------------#
    #                                     ruby                                     #
    #------------------------------------------------------------------------------#
    export GEM_HOME="$HOME/.gem"
    set -gx PATH "$PATH:$HOME/.gem/bin"

    
    #------------------------------------------------------------------------------#
    #                                     rust                                     #
    #------------------------------------------------------------------------------#
    set -gx PATH "$PATH:$HOME/.cargo/bin"
    set -gx RUSTUP_TOOLCHAIN "stable"

   
    #------------------------------------------------------------------------------#
    #                                    sniffnet                                  #
    #------------------------------------------------------------------------------#
    set -gx ICED_BACKEND tiny-skia

    
    #------------------------------------------------------------------------------#
    #                                     julia                                    #
    #------------------------------------------------------------------------------#
    set -gx PATH "$PATH:/home/sergey/.juliaup/bin"


    #------------------------------------------------------------------------------#
    #                                     spark                                    #
    #------------------------------------------------------------------------------#
    set -gx PATH "/home/sergey/spark/bin:$PATH"
    
    
    #------------------------------------------------------------------------------#
    #                                    hadoop                                    #
    #------------------------------------------------------------------------------#
    #export HADOOP_OPTS="$HADOOP_OPTS -Djava.library.path=$HADOOP_HOME/lib/native"
    set -gx PATH "$PATH:/home/sergey/hadoop/bin"

    
    #------------------------------------------------------------------------------#
    #                                      nnn                                     #
    #------------------------------------------------------------------------------#
    source ~/.config/fish/nnn.fish
    source ~/.config/fish/quitcd.fish

    
    #------------------------------------------------------------------------------#
    #                                     jump                                     #
    #------------------------------------------------------------------------------#
    jump shell fish | source

    
    #------------------------------------------------------------------------------#
    #                                     asdf                                     #
    #------------------------------------------------------------------------------#
    source ~/.asdf/asdf.fish


    #------------------------------------------------------------------------------#
    #                                     yazi                                     #
    #------------------------------------------------------------------------------#
    alias y yazi


    #------------------------------------------------------------------------------#
    #                                     nvim                                     #
    #------------------------------------------------------------------------------#
    export VISUAL=nvim
    export EDITOR=nvim


    #------------------------------------------------------------------------------#
    #                            tokyonight color scheme                           #
    #------------------------------------------------------------------------------#
    # source ~/.config/fish/tokyonight_moon.fish

    
    #------------------------------------------------------------------------------#
    #                               atuin cli history                              #
    #------------------------------------------------------------------------------#
    atuin init fish --disable-up-arrow | source
    # atuin init fish | source

    
    #------------------------------------------------------------------------------#
    #                                   starship                                   #
    #------------------------------------------------------------------------------#
    starship init fish | source


    #------------------------------------------------------------------------------#
    #                                     conda                                    #
    #------------------------------------------------------------------------------#
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    # if test -f ~/anaconda3/bin/conda
    #     eval ~/anaconda3/bin/conda "shell.fish" "hook" $argv | source
    # end
    # <<< conda initialize <<<
    if test -f ~/anaconda3/bin/conda
      source ~/anaconda3/etc/fish/conf.d/conda.fish
      set -gx PATH "/home/sergey/anaconda3/bin/:$PATH"
      export PYTHON_NAME="base"
    end


    #------------------------------------------------------------------------------#
    #                                    zoxide                                    #
    #------------------------------------------------------------------------------#
    zoxide init fish | source


    #------------------------------------------------------------------------------#
    #                                      nix                                     #
    #------------------------------------------------------------------------------#
    # set -gx PATH "$PATH:/home/sergey/.nix"

    
    #------------------------------------------------------------------------------#
    #                                     tmux                                     #
    #------------------------------------------------------------------------------#
    # start tmux as interactive shell started  
    if not set -q TMUX
      tmux new-session -As 0
    end


end

set fish_greeting
