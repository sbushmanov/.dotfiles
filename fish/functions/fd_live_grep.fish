function fd_live_grep
    set RG_PREFIX "fd -H -tf --absolute-path | xargs rg -i --column --line-number --color=always "

    fzf --ansi --disabled --query '' \
        --bind "start:reload:$RG_PREFIX {q}" \
        --bind "change:reload:sleep 0.1; $RG_PREFIX {q} || true" \
        --delimiter ':' \
        --preview "bat --color=always {1} --highlight-line {2}" \
        --preview-window "up,60%,border-bottom,+{2}+3/3,~3" \
        --tmux 90% \
        --bind "enter:become(jumper update -f ~/.jfiles {1};nvim {1} +{2})"
end
