if has('conceal')
  if &termencoding ==# "utf-8" || &encoding ==# "utf-8"
    let s:checkbox_unchecked = "\u2611"
    let s:checkbox_checked = "\u2612"
  else
    let s:checkbox_unchecked = 'o'
    let s:checkbox_checked = 'x'
  endif
  syntax match markdownCheckbox "^\s*\([-\*] \[[ x]\]\|--\|++\) " contains=markdownCheckboxChecked,markdownCheckboxUnchecked
  execute 'syntax match markdownCheckboxUnchecked "\([-\*] \[ \]\|--\)" contained conceal cchar='.s:checkbox_unchecked
  execute 'syntax match markdownCheckboxChecked "\([-\*] \[x\]\|++\)" contained conceal cchar='.s:checkbox_checked
endif

