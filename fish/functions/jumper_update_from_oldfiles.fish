function jumper_update_from_oldfiles
    for el in (nvim --headless -c 'oldfiles | q' 2>&1 | tr -d '\r' | cut -d ' ' -f 2- | rg -U "^/.+[^]]\n" | rg -v '^/tmp' | rg -v ':$')
        jumper update -f ~/.jfiles
    end
end
