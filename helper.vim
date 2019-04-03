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
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/'. l:pattern)
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

function! HandleVisualSelectionCommand(cmd, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")
    call CmdLine("%s" . '/'. l:pattern . '/'. l:pattern)

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
"
" My Operator {{{1
function! s:myOperator(type) abort
  let regsave = @@
  let selsave = &selection
  let &selection = 'inclusive'

  if a:type =~? 'v'
    silent execute "normal! gvy"
  elseif a:type == 'line'
    silent execute "normal! '[V']y"
  else
    silent execute "normal! `[v`]y"
  endif

  let &selection = selsave
  let flags = s:get_config().operator
  let flags.query_orig = @@
  let flags.query_escaped = 0

  let flags.query = s:escape_query(flags, @@)
  if s:get_current_tool_name(flags) != 'findstr'
    let flags.query = '-- '. flags.query
  endif
  let @@ = regsave

  return s:start(flags)
endfunction
