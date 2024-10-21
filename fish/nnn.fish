#please update /etc/environment
export NNN_PLUG='b:boom;d:xdgdefault;m:mocq;p:preview-tui;j:autojump;c:fzcd;h:fzhist;o:fzopen;n:nuke;r:renamer;l:launch;f:finder;s:suedit;v:-!&codium -n -- "$PWD"*'
export NNN_BMS="d:$HOME/Documents;D:$HOME/Downloads/;m:$HOME/Music/;c:$HOME/.config"
export NNN_FCOLORS='0000E6310000000000000000'
export NNN_TRASH=2
export NNN_TMPFILE='/tmp/.lastd' # to always cd on quit 
alias l "nn -e"
alias n "nnn -e"
set --export NNN_FIFO "/tmp/nnn.fifo"
