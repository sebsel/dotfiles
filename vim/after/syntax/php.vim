syn region phpHereDoc matchgroup=Delimiter start="\(<<<\)\@3<=\z(\I\i*\)$" end="^\s*\z1\>" contained contains=@Spell,phpIdentifier,phpIdentifierSimply,phpIdentifierComplex,phpSpecialChar,phpMethodsVar,phpStrEsc keepend extend
syn region phpHereDoc matchgroup=Delimiter start=+\(<<<\)\@3<="\z(\I\i*\)"$+ end="^\s*\z1\>" contained contains=@Spell,phpIdentifier,phpIdentifierSimply,phpIdentifierComplex,phpSpecialChar,phpMethodsVar,phpStrEsc keepend extend
" including HTML,JavaScript,SQL if enabled via options
if (exists("php_html_in_heredoc") && php_html_in_heredoc)
  syn region phpHereDoc matchgroup=Delimiter start="\(<<<\)\@3<=\z(\(\I\i*\)\=\(html\)\c\(\i*\)\)$" end="^\s*\z1\>"  contained contains=@htmlTop,phpIdentifier,phpIdentifierSimply,phpIdentifierComplex,phpSpecialChar,phpMethodsVar,phpStrEsc keepend extend
  syn region phpHereDoc matchgroup=Delimiter start="\(<<<\)\@3<=\z(\(\I\i*\)\=\(javascript\)\c\(\i*\)\)$" end="^\s*\z1\>"  contained contains=@htmlJavascript,phpIdentifierSimply,phpIdentifier,phpIdentifierComplex,phpSpecialChar,phpMethodsVar,phpStrEsc keepend extend
endif
if (exists("php_sql_heredoc") && php_sql_heredoc)
  syn region phpHereDoc matchgroup=Delimiter start="\(<<<\)\@3<=\z(\(\I\i*\)\=\(sql\)\c\(\i*\)\)$" end="^\s*\z1\>" contained contains=@sqlTop,phpIdentifier,phpIdentifierSimply,phpIdentifierComplex,phpSpecialChar,phpMethodsVar,phpStrEsc keepend extend
endif
if (exists("php_xml_heredoc") && php_xml_heredoc)
  syn region phpHereDoc matchgroup=Delimiter start="\(<<<\)\@3<=\z(\(\I\i*\)\=\(xml\)\c\(\i*\)\)$" end="^\s*\z1\>" contained contains=@xmlTop,phpIdentifier,phpIdentifierSimply,phpIdentifierComplex,phpSpecialChar,phpMethodsVar,phpStrEsc keepend extend
endif

syn keyword phpFunctions str_starts_with str_ends_with str_contains contained
syn keyword phpKeyword fn mixed match never enum readonly contained
syn match phpParent /\$this/
syn keyword phpParent self
