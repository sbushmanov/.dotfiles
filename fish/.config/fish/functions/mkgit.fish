function mkgit
command mkdir $argv
if test $status = 0
cd $argv;git init
end
end
