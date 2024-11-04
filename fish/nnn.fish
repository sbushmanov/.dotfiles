#please update /etc/environment
export NNN_PLUG='b:boom;d:xdgdefault;j:jumper_open;m:mocq;p:preview-tui;c:fzcd;o:fzopen;n:nuke;r:renamer;l:launch;s:suedit;v:-!&codium -n -- "$PWD"*'
export NNN_BMS="d:$HOME/Documents;D:$HOME/Downloads/;m:$HOME/Music/;c:$HOME/.config"
export NNN_FCOLORS='0000E6310000000000000000'
export NNN_TRASH=2
export NNN_TMPFILE='/tmp/.lastd' # to always cd on quit 
export NNN_USE_EDITOR=1
alias l "nn -e"
alias n "nnn -e"
set --export NNN_FIFO "/tmp/nnn.fifo"
