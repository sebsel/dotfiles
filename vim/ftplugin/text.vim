function MarkAsDone()
    if getline('.') =~ '^- \[x\]'
        s/^- \[x\]/- [ ]/
    elseif getline('.') =~ '^- \[ \]'
        s/^- \[ \]/- [x]/
    endif
endfunction
nmap <silent> <cr> :call MarkAsDone()<cr>
