function cheat
    for arg in $argv
        curl "https://cht.sh/$arg"
    end
end
