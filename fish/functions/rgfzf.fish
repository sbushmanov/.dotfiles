function rgfzf
    # Use current directory (.) if no arguments are provided
    set query $argv
    if test -z "$query"
        set query "."
    end

    command rg --color=always --line-number --no-heading --smart-case $query \
    | command fzf -d':' --ansi \
        --preview "command bat -p --color=always {1} --highlight-line {2}" \
        --preview-window ~8,+{2}-5 \
    | awk -F':' '{print $1}'
end
