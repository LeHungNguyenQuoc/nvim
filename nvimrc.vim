let mapleader = ' '
set nocompatible

source ~/.nvim_me/plug.vim
source ~/.nvim_me/helper.vim
source ~/.nvim_me/scripts/BufOnly.vim

" Set augroup
augroup MyAutoCmd
  autocmd!
augroup END

""""""""""""""""""""""""""""""""""""""""""
" Easy Align
""""""""""""""""""""""""""""""""""""""""""
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
""""""""""""""""""""""""""""""""""""""""""
" FZF
""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>f :FZF --color fg:240,bg:230,hl:33,fg+:241,bg+:221,hl+:33<cr>
nnoremap <silent> <leader>m :History --color fg:240,bg:230,hl:33,fg+:241,bg+:221,hl+:33<cr>
nnoremap <silent> <leader>b :Buffers <cr>
nnoremap <silent> <leader>F :FZF ~ --color fg:240,bg:230,hl:33,fg+:241,bg+:221,hl+:33<cr>
let $FZF_DEFAULT_OPTS .= ' --no-height'
let g:coc_node_path='/Users/quocle/.nvm/versions/node/v12.9.1/bin/node'

""""""""""""""""""""""""""""""""""""""""""
" Common rails mapping
""""""""""""""""""""""""""""""""""""""""""
noremap <leader>tt :vs<cr><C-W>l:A<cr><C-W>h
""""""""""""""""""""""""""""""""""""""""""
" Common mapping
""""""""""""""""""""""""""""""""""""""""""
noremap <leader>- :split<cr>
noremap <leader>\ :vs<cr>
noremap <leader>* :noh<cr>
" Auto remove trailing space
autocmd FileType ruby,javascript,eruby autocmd BufWritePre <buffer> %s/\s\+$//e

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
set number
set autoindent
set smartcase
set nowrap
set modifiable
"
" customize verical bar 
set fillchars=diff:⣿,vert:│
set fillchars+=vert:⣿

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
"  Vim Test 
""""""""""""""""""""""""""""""""""""""""""
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

let test#ruby#bundle_exec = 1

if has('nvim')
  let test#strategy = "neovim"
  tmap <C-o> <C-\><C-n>
endif

""""""""""""""""""""""""""""""""""""""""""
" Copy / cut to clipboard
""""""""""""""""""""""""""""""""""""""""""
nmap <leader>c "+y
nmap <leader>d "+d

xmap <leader>c "+y
xmap <leader>d "+d

"Filename to clipboard
nmap <leader>cp :let @*=expand("%")<CR>
nmap <leader>ct :let @*="bin/bundle exec rspec ".expand("%")<CR>
nmap <leader>cu :let @*="bin/bundle exec cucumber ".expand("%")<CR>
"nmap <c-l> :let @*=expand("%:p")<CR>

" Copy yanked text to clipboard
nnoremap <silent> cY :let [@+, @*] = [@", @"]<CR>

" Paste from clipboard
nnoremap <silent> cp  "+p
nnoremap <silent> cP  "+P
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
vnoremap <silent> <leader>gp :call HandleVisualSelection('GrepperInDir', '')<cr>
vnoremap <silent> gdf :call HandleVisualSelection('GrepperFunction', '')<cr>
vnoremap <silent> <leader>h :call HandleVisualSelectionCommand('replace', '')<cr><cr>

nmap gs <plug>(GrepperOperator)
nmap gu viw<plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

nmap gis viw<plug>(GrepperOperator)

" Optional. The default behaviour should work for most users.
let g:grepper               = {}
let g:grepper.tools         = ['rg', 'git', 'ag']
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
" colorscheme dracula
" syntax on
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
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_theme='snow_light'
"
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COMPLETER 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set completeopt-=preview
set complete=.,w,b,u,t,k
set complete-=t
set pumheight=20                " Set popup menu max height"
inoremap <Tab> <C-N>
inoremap <S-Tab> <C-P>
inoremap <C-]> <C-X><C-]>
"
"""""""""""""""""""""""""""""""""""""""""""
" LOCATION LIST & QUICK FIX
"""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>ll :lopen<cr>
nnoremap <leader>lq :lclose<cr>
nnoremap <leader>ln :ln<cr>
nnoremap <leader>lp :lp<cr>

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
nnoremap <leader>] :bnext<cr>

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
