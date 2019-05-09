function MarkAsDone()
    if getline('.') =~ '^\s*- \[x\]'
        s/^\(\s*\)- \[x\]/\1- [ ]/
    elseif getline('.') =~ '^\s*- \[ \]'
        s/^\(\s*\)- \[ \]/\1- [x]/
    endif
endfunction
nmap <silent> <cr> :call MarkAsDone()<cr>
