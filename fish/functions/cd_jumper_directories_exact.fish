function cd_jumper_directories_exact
    set selected_dir (jumper find --type directories | fzf --preview "exa -la --header {}" --preview-window "up,60%,border-bottom,+{2}+3/3,~3" --tmux 90%)
    if test -n "$selected_dir"
        jumper update -f /home/sergey/.jfolders "$selected_dir"
        cd "$selected_dir"
    end
end
