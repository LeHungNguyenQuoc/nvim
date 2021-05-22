let mapleader = ' '
set nocompatible

source ~/.nvim_me/plug.vim
source ~/.nvim_me/helper.vim
source ~/.nvim_me/scripts/BufOnly.vim

" Set augroup
augroup MyAutoCmd
  autocmd!
augroup END

noremap <C-t> :Switch<cr>
vnoremap <C-t> :Switch<cr>

" Auto save
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_events = ["InsertLeave", "TextChanged"]

""""""""""""""""""""""""""""""""""""""""""
" Easy Align
""""""""""""""""""""""""""""""""""""""""""
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
""""""""""""""""""""""""""""""""""""""""""
" FZF
""""""""""""""""""""""""""""""""""""""""""
nnoremap gd *:FZF -i --color fg:240,bg:230,hl:33,fg+:241,bg+:221,hl+:33 -q <C-R>=expand("<cword>")<CR><CR>
nnoremap <silent> <leader>f :FZF<cr>
nnoremap <silent> <leader>m :History<cr>
nnoremap <silent> <leader>b :Buffers<cr>
nnoremap <silent> <leader>B :Windows<cr>
nnoremap <silent> <leader>F :FZF ~ <cr>
let g:fzf_layout = { 'down': '~30%' }
let $FZF_DEFAULT_OPTS .= "
      \ --color fg:240,bg:230,hl:33,fg+:241,bg+:221,hl+:33
      \ --color info:33,prompt:33,pointer:166,marker:166,spinner:33"

      " \ --color fg:-1,bg:-1,hl:33,fg+:235,bg+:254,hl+:33
      " \ --color info:136,prompt:136,pointer:230,marker:230,spinner:136"
" let g:coc_node_path='/Users/quocle/.nvm/versions/node/v12.9.1/bin/node'
" let g:coc_global_extensions = ['coc-solargraph']

autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
""""""""""""""""""""""""""""""""""""""""""
" Common rails mapping
""""""""""""""""""""""""""""""""""""""""""
noremap <leader>tt :vs<cr><C-W>l:A<cr><C-W>h
""""""""""""""""""""""""""""""""""""""""""
" Common mapping
""""""""""""""""""""""""""""""""""""""""""
" Search
"
vnoremap * y/\V<C-R>=escape(@",'/\')<CR><CR>Nzz
nnoremap * yiw/\V<C-R>=escape(@",'/\')<CR><CR>Nzz
" Replace
vnoremap <leader>h y:%s/<C-R>"/<C-R>"/g<left><left>
vnoremap <leader>ah y:Grepper -noprompt -quickfix -query <C-R>"<CR>:cfdo %s/<C-R>"/<C-R>"/gc<space><bar><space>update
" nnoremap <leader>G :Grepper -quickfix -open<cr>
" Split
noremap <leader>- :split<cr>
noremap <leader>\ :vs<cr>
noremap <leader>* :noh<cr>

" Auto remove trailing space
autocmd FileType ruby,javascript,eruby,haml autocmd BufWritePre <buffer> %s/\s\+$//e

au BufNewFile,BufRead *.hamlc   set filetype=haml
set nofoldenable
set tabstop=2 shiftwidth=2
set nonumber

set autoread
set autoindent
set smartindent
set shiftround  " Round indent by shiftwidth
set smarttab    " Smart insert / delete tab
set expandtab   " Expand tab to space"
set backspace=indent,eol,start
let loaded_matchparen = 1
let &titlestring = @%
set title
set noswapfile
set ignorecase
set autoindent
set smartcase
set wrap
set modifiable
"
" customize verical bar 
set fillchars=diff:⣿,vert:│
set fillchars+=vert:│
" hi VertSplit ctermbg=NONE guibg=NONE ctermfg=Green guifg=#839289
autocmd ColorScheme * highlight VertSplit cterm=NONE ctermfg=Blue ctermbg=NONE
" hi NonText ctermfg=darkcyan guifg=darkcyan
"
" Quick save & edit
nnoremap <leader>w :w!<cr>
nnoremap <leader>W :wq!<cr>
nnoremap <leader>q :bdelete!<cr>
nnoremap <leader>z :q!<cr>

" Disable Arrow keys in Escape mode
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" Disable Arrow keys in Insert mode

inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
"
""""""""""""""""""""""""""""""""""""""""""
"  Vim Terraform 
""""""""""""""""""""""""""""""""""""""""""
let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_fmt_on_save=1
""""""""""""""""""""""""""""""""""""""""""
"  Vim Test 
""""""""""""""""""""""""""""""""""""""""""
" nmap <silent> t<C-n> :TestNearest<CR>
" nmap <silent> t<C-f> :TestFile<CR>
" nmap <silent> t<C-s> :TestSuite<CR>
" nmap <silent> t<C-l> :TestLast<CR>
" nmap <silent> t<C-g> :TestVisit<CR>

" let test#ruby#bundle_exec = 1

" if has('nvim')
"   let test#strategy = "neovim"
"   tmap <C-o> <C-\><C-n>
" endif

""""""""""""""""""""""""""""""""""""""""""
" any-jump.vim
""""""""""""""""""""""""""""""""""""""""""
" Jump to definition under cursore
nnoremap <leader>aj :AnyJump<CR>

" Visual mode: jump to selected text in visual mode
xnoremap <leader>aj :AnyJumpVisual<CR>

" open previous opened file (after jump)
nnoremap <leader>ab :AnyJumpBack<CR>

" open last closed search window again
nnoremap <leader>al :AnyJumpLastResults<CR>

let g:any_jump_disable_default_keybindings = 1

" Show line numbers in search rusults
let g:any_jump_list_numbers = 0

" Auto search references
let g:any_jump_references_enabled = 1

" Auto group results by filename
let g:any_jump_grouping_enabled = 0

" Amount of preview lines for each search result
let g:any_jump_preview_lines_count = 5

" Max search results, other results can be opened via [a]
let g:any_jump_max_search_results = 10

" Prefered search engine: rg or ag
let g:any_jump_search_prefered_engine = 'rg'


" Search results list styles:
" - 'filename_first'
" - 'filename_last'
let g:any_jump_results_ui_style = 'filename_first'

" Any-jump window size & position options
let g:any_jump_window_width_ratio  = 0.6
let g:any_jump_window_height_ratio = 0.6
let g:any_jump_window_top_offset   = 4

" Customize any-jump colors with extending default color scheme:
let g:any_jump_colors = { "help": "Comment" }

" Or override all default colors
let g:any_jump_colors = {
      \"plain_text":         "Comment",
      \"preview":            "Comment",
      \"preview_keyword":    "Operator",
      \"heading_text":       "Function",
      \"heading_keyword":    "Identifier",
      \"group_text":         "Comment",
      \"group_name":         "Function",
      \"more_button":        "Operator",
      \"more_explain":       "Comment",
      \"result_line_number": "Comment",
      \"result_text":        "Statement",
      \"result_path":        "String",
      \"help":               "Comment"
      \}

" Disable default any-jump keybindings (default: 0)
let g:any_jump_disable_default_keybindings = 1

" Remove comments line from search results (default: 1)
let g:any_jump_remove_comments_from_results = 1

" Custom ignore files
" default is: ['*.tmp', '*.temp']
let g:any_jump_ignored_files = ['*.tmp', '*.temp']

" Search references only for current file type
" (default: false, so will find keyword in all filetypes)
let g:any_jump_references_only_for_current_filetype = 0

" Disable search engine ignore vcs untracked files
" (default: false, search engine will ignore vcs untracked files)
let g:any_jump_disable_vcs_ignore = 0

""""""""""""""""""""""""""""""""""""""""""
" Copy / cut to clipboard
""""""""""""""""""""""""""""""""""""""""""
noremap <leader>o "+y
noremap <leader>d "+d

vnoremap <C-c> "+y
vnoremap <C-d> "+d

"Filename to clipboard
noremap <leader>cp :let @*=expand("%")<CR>
noremap <leader>ct :let @*="bin/bundle exec rspec ".expand("%")<CR>
noremap <leader>cu :let @*="bin/bundle exec cucumber ".expand("%")<CR>
"nmap <c-l> :let @*=expand("%:p")<CR>

" Copy yanked text to clipboard
nnoremap <silent> cY :let [@+, @*] = [@", @"]<CR>

" Paste from clipboard
nnoremap <C-p>  "+p
nnoremap <C-P>  "+P
nnoremap <silent> cgp "+gp
nnoremap <silent> cgP "+gP
nnoremap <silent> c=p o<Esc>"+pm``[=`]``^
nnoremap <silent> c=P O<Esc>"+Pm``[=`]``^
nnoremap <silent> c=v :set<Plug>PeepOpenaste<CR>"+p:set nopaste<CR>
nnoremap <silent> c=V :set<Plug>PeepOpenaste<CR>"+P:set nopaste<CR>

"""""""""""""""""""""""""""""""""""""""""""
" VIM GREPPER
""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>g :Grepper<cr>
nnoremap <leader>G :Grepper -quickfix -open<cr>
" vnoremap <silent> <leader>gp :call HandleVisualSelection('GrepperInDir', '')<cr>
" vnoremap <silent> gdf :call HandleVisualSelection('GrepperFunction', '')<cr>
" vnoremap <silent> <leader>h :call HandleVisualSelectionCommand('replace', '')<cr><cr>

nmap gu *viw<plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)
" nmap gs <plug>(GrepperOperator)

" Optional. The default behaviour should work for most users.
let g:grepper               = {}
let g:grepper.tools         = ['git' ,'rg', 'ag']
let g:grepper.jump          = 0
let g:grepper.quickfix          = 0
let g:grepper.next_tool     = '<leader>g'
let g:grepper.open      = 1

"""""""""""""""""""""""""""""""""""""""""""
" STARTIFY
""""""""""""""""""""""""""""""""""""""""""""

" mhinz/vim-startiy
let g:startify_skiplist = [
      \ '.git/index',
      \ '.git/config',
      \ 'COMMIT_EDITMSG',
      \ 'git-rebase-todo',
      \ escape(fnamemodify($VIMRUNTIME, ':p'), '\') . 'doc',
      \ ]

let g:startify_enable_special     = 0
let g:startify_change_to_dir      = 0
let g:startify_change_to_vcs_root = 0
let g:startify_relative_path      = 1
let g:startify_update_oldfiles    = 1
let g:startify_show_sessions      = 1
let g:startify_custom_header      = [] " Disable random quotes header

nnoremap <silent> <Leader>H :Startify<CR>

augroup MyAutoCmd
  autocmd User Startified setlocal buftype= nofoldenable foldcolumn=0
augroup END

"""""""""""""""""""""""""""""""""""""""""""
" COLOR & THEME
""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set background=light
colorscheme solarized8
let g:solarized_termcolors=256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"

highlight VertSplit cterm=NONE
" syntax enable
" set background=light
" colorscheme solarized8_flat
" set background=dark
" colorscheme dracula
" " syntax on
" if has("mac") || has("macunix")
"   set guifont=Monaco\ for\ Powerline:h24
" elseif has("win32") || has("win64")
"   set guifont=Monaco\ for\ Powerline:h14:cANSI
"   set renderoptions=type:directx,renmode:5
" endif

" Cusors in difference modes on TMUX & Iterm2
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerd Tree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
let NERDTreeQuitOnOpen = 0

nnoremap <leader>nt :NERDTreeToggle<cr>
nnoremap <leader>nn :NERDTreeFind<cr>

" automatically close a tab if the only remaining window is NerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


"""""""""""""""""""""""""""""""""""""""""""
" AIRLINE
"""""""""""""""""""""""""""""""""""""""""""
"let g:airline#extensions#tabline#enabled = 0
"let g:airline#extensions#tabline#show_splits = 0
"let g:airline#extensions#bufferline#enabled = 1
"let g:airline#extensions#tabline#formatter = 'unique_tail'
"let g:airline_statusline_ontop=1
"let g:airline_powerline_fonts = 1
"if !exists('g:airline_symbols')
"  let g:airline_symbols = {}
"endif
"let g:airline_theme='solarized'
""
"" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'

"" airline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''
" let g:airline#extensions#coc#enabled = 1

" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" nmap <silent> gd <Plug>(coc-definition)

" Customize statusline colors 
hi StatusLine ctermbg=24 ctermfg=254 guibg=#004f87 guifg=#e4e4e4
hi StatusLineNC ctermbg=250 ctermfg=254 guibg=#d0d0d0 guifg=#444444

" hi StatusLine ctermbg=24 ctermfg=254 guibg=#004f87 guifg=#e4e4e4
" hi StatusLineNC ctermbg=252 ctermfg=238 guibg=#d0d0d0 guifg=#444444

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COMPLETER 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
set completeopt-=preview
set complete=.,w,b,u,t,k
set complete-=t
set pumheight=20                " Set popup menu max height"
inoremap <Tab> <C-N>
inoremap <S-Tab> <C-P>
" inoremap <C-]> <C-X><C-]>

"
"""""""""""""""""""""""""""""""""""""""""""
" LOCATION LIST & QUICK FIX
"""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>ll :lopen<cr>
nnoremap <leader>lq :lclose<cr>
nnoremap <leader>ln :lnext<cr>
nnoremap <leader>lp :lprevious<cr>

nnoremap <leader>cc :botright cope<cr>
nnoremap <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
nnoremap <leader>cq :cclose<cr>
"
"""""""""""""""""""""""""""""""""""""""""""
" Navigating vs BUFFER
 """""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>tq :bdelete!<cr>
nnoremap <leader>to :tabonly<cr>:BufOnly!<cr>
nnoremap <leader>e :b#<cr>
nnoremap <leader>[ :bprevious<cr>
nnoremap <Leader>] :bnext<cr>

nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l


" Ctags
nnoremap <silent> <Leader>tn :tnext<CR>
nnoremap <silent> <Leader>tp :tprevious<CR>
nnoremap <silent> <Leader>ts :tselect<CR>


" TagBar
nmap <C-\> :TagbarToggle<CR>
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GIT CONFIG
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled=0
nnoremap <silent> <leader>d :GitGutterToggle<cr>
" TIG
nnoremap TS :vs term://tig status<cr><cr>
nnoremap TB :vs term://tig blame<cr><cr>
nnoremap TL :vs term://tig log %<cr><cr>

nnoremap <silent> GB :Gblame<cr>
nnoremap <silent> GS :Gstatus<cr>
nnoremap <silent> GS :Gstatus<cr>
nnoremap <silent> GD :Gdiff<cr>
