function nnn_jumper_directories_abstract
    set selected_dir (fd -H --type directory --absolute-path | fzf --preview "exa -la --header {}" --preview-window "up,60%,border-bottom,+{2}+3/3,~3" --tmux 90%)
    if test -n "$selected_dir"
        jumper update -f ~/.jfolders "$selected_dir"
        n "$selected_dir"
    end
end
