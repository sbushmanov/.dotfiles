function fzf-bcd-widget --description 'cd backwards'
pwd | awk -v RS=/ '/\n/ {exit} {p=p $0 "/"; print p}' | tac | fzf --tmux 80%  +m --select-1 --exit-0 $FZF_BCD_OPTS | read -l result
[ "$result" ]; and cd $result
commandline -f repaint
end
