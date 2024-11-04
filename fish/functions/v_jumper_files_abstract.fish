function v_jumper_files_abstract
    set selected_file (fd -H --type file --absolute-path | fzf --preview "bat --style=plain --color=always {}" --preview-window "up,60%,border-bottom,+{2}+3/3,~3" --tmux 90%)
    if test -n "$selected_file"
        jumper update -f ~/.jfiles "$selected_file"
        nvim "$selected_file"
    end
end
