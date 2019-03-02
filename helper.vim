function! s:IsPlugged(plugin) abort
    return has_key(g:plugs, a:plugin)
endfunction

function! HandleVisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")
    let l:dir = expand("%:h")

    if a:direction == 'GrepperGit'
        call CmdLine("Grepper -tool git -noprompt -noopen -query '" . l:pattern . "' " )
    elseif a:direction == 'GrepperAg'
        call CmdLine("Grepper -tool ag -noprompt -noopen -query '" . l:pattern . "' " )
    elseif a:direction == 'GrepperInDir'
        call CmdLine("Grepper -noprompt -noopen -query '" . l:pattern . "' '" . l:dir . "'\<left>" )
    elseif a:direction == 'GrepperFunction'
        call CmdLine("Grepper -tool rg -noprompt -query 'def " . l:pattern . "'\<cr>" )
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
