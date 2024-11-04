function fzf_vim
    set selected_file (fd -H --type file | fzf --tmux 80% --preview "bat --color always {}")
    if test -n "$selected_file"
        jumper update -f ~/.jfiles "$selected_file"
        vim "$selected_file"
    end
end
