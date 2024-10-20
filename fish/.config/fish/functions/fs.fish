function fs --description 'Switch tmux session'
  tmux list-sessions -F "#{session_name}" | fzf --tmux 80% | read -l result; and tmux switch-client -t "$result"
end
