function nnn_jumper_directories_exact
    set selected_dir (jumper find --type=directories | fzf --preview "exa -la --header {}" --preview-window "up,60%,border-bottom,+{2}+3/3,~3" --tmux 90%)
    if test -n "$selected_dir"
        jumper update -f ~/.jfolders "$selected_dir"
        n "$selected_dir"
    end
    printf "%.0s\n" (seq 1 100)
    commandline -f repaint
end
