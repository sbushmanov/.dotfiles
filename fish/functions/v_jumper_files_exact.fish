function v_jumper_files_exact
    set selected_file (jumper find --type files | fzf --preview "bat --style=plain --color=always {}" --preview-window "up,60%,border-bottom,+{2}+3/3,~3" --tmux 90%)
    if test -n "$selected_file"
        jumper update -f ~/.jfiles "$selected_file"
        nvim "$selected_file"
    end
end
