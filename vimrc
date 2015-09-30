""""""""""""""""
" VIM SETTINGS "
""""""""""""""""

set nocompatible
execute pathogen#infect()
syntax on
filetype plugin indent on

" set t_Co=16 " Term colors
set background=dark
set t_Co=256 " Term colors
" let g:molokai_original = 1
colorscheme molokai


set hlsearch
set number
set showmatch
set incsearch
set hidden
set backspace=indent,eol,start
set textwidth=0 nosmartindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set ruler
set dir=/tmp//
set scrolloff=5
set nofoldenable
set nowrap
set enc=utf-8
set ignorecase
set smartcase
" set modeline
set showcmd
set list listchars=tab:\┊\ 
set noshowmode
set laststatus=2

" Startify settings
let g:startify_change_to_dir = 0
autocmd User Startified setlocal buftype=

" BufExplorer
" let g:bufExplorerShowRelativePath = 0  " Show relative paths.

" NERD Tree Settings
let NERDTreeIgnore = ['\.pyc$', '\.o$', '\.class$', '\.xml$']

" NERD Commenter Settings
let NERDSpaceDelims=1
let NERDDefaultAlign='left'

" Numbers Settings
let g:numbers_exclude = ['help', 'bufexplorer', 'nerdtree', 'tagbar']

" Tagbar Settings
set tags=./.tags,.tags,./tags,tags
let g:tagbar_width = 30
let g:tagbar_iconchars = ['▸', '▾']
let g:tagbar_map_nexttag = 'J'
let g:tagbar_map_prevtag = 'K'
let g:scala_use_builtin_tagbar_defs = 0

" Airline Settings
let g:airline_theme = 'murmur'
let g:airline_powerline_fonts = 1

" Rainbow Parens " Extreme Yellow
let g:rbpt_colorpairs = [
    \ [196, 'DarkOrchid3'],
    \ [160, 'firebrick3'],
    \ [124, 'RoyalBlue3'],
    \ [88, 'SeaGreen3'],
    \ [124, 'DarkOrchid3'],
    \ [160, 'firebrick3'],
    \ [196, 'RoyalBlue3'],
    \ [202, 'SeaGreen3'],
    \ [208, 'DarkOrchid3'],
    \ [214, 'firebrick3'],
    \ [220, 'RoyalBlue3'],
    \ [226, 'firebrick3'],
    \ [227, 'RoyalBlue3'],
    \ [228, 'firebrick3'],
    \ [229, 'firebrick3'],
    \ [255, 'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
function! RainbowEnable()
  :RainbowParenthesesLoadRound
  :RainbowParenthesesLoadBraces
  :RainbowParenthesesToggle
endfunction

" Syntastic
let g:airline#extensions#syntastic#enabled = 1
let g:syntastic_mode_map = {
      \ "mode": "passive",
      \ "active_filetypes": ["php"],
      \ "passive_filetypes": [] }
let g:syntastic_scala_checkers = ["scalac"]
" let g:syntastic_php_checkers = ["php"]

" Ctrl-P
let g:ctrlp_match_window = 'top,order:ttb'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](vendor)$',
 \ }


"""""""""""""""""""""
" FileType Settings "
"""""""""""""""""""""

autocmd BufEnter *.scala call RainbowEnable()
" autocmd FileType python setlocal tabstop=2 shiftwidth=2 softtabstop=2
" autocmd FileType javascript setlocal tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab
autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType cpp colorscheme vividchalk
autocmd FileType haskell set autoindent
autocmd FileType scala set autoindent
autocmd QuickFixCmdPost *grep* cwindow
autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en_us
autocmd FileType help setlocal nospell
autocmd FileType tex setlocal spell spelllang=en_us
augroup myvimrc
  autocmd!
  autocmd BufWritePost .vimrc source $HOME/.vimrc
augroup END


""""""""""""""""
" KEY MAPPINGS "
""""""""""""""""

command! Wsudo w !sudo tee %
inoremap <C-c> <Esc>
cnoremap <C-F> <S-Right>
cnoremap <C-D> <S-Left>
nnoremap <C-bar> <Nop>
" Repeat . command for visual selection
vnoremap . :normal .<CR>

nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
set pastetoggle=<F2>
set keywordprg=":help" " Activate with K
" inoremap <C-j> <C-O>j
" inoremap <C-k> <C-O>k
inoremap <C-J> <C-O>o
inoremap <C-K> <C-O>O
inoremap <C-I> <C-O>~
" Remap number increment bc tmux
noremap <C-Z> <C-A>

" Replace word under cursor
nnoremap <Leader>a :%s/\<<C-r><C-w>\>/
nnoremap <Leader>s :s/\<<C-r><C-w>\>/

" highlight/syntax info. TODO: Would be nice to turn on and off
nnoremap th :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Leader shortcuts
let mapleader=","
" let maplocalleader="\\"
nnoremap <LocalLeader>w :w<CR>
map <silent> <LocalLeader>m :set paste!<CR>
map <silent> <LocalLeader>b :BufExplorer<CR>
map <silent> <LocalLeader>h :noh<CR>
map <silent> <LocalLeader>p o<ESC>p
map <silent> <LocalLeader>P O<ESC>p
map <silent> <LocalLeader>y :PBCopy<CR>
map <silent> <LocalLeader>r :source ~/.vimrc <CR>:echo 'vimrc reloaded!'<CR>
map <silent> <LocalLeader>f :CtrlP<CR>
map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>nf :NERDTreeFind<CR>
map <silent> <LocalLeader>gh :Gbrowse<CR>
map <silent> <LocalLeader>gs :Gstatus<CR><C-w>3+
map <silent> <LocalLeader>gd :Gvdiff<CR>
map <silent> <LocalLeader>gl :Glog<CR>
map <silent> <LocalLeader>bv :BufExplorerVerticalSplit<CR>
map <silent> <LocalLeader>bs :BufExplorerHorizontalSplit<CR>
map <silent> <LocalLeader>cc <Plug>NERDCommenterToggle
map <silent> <LocalLeader>ca <Plug>NERDCommenterAppend
map <silent> <LocalLeader>cy <Plug>NERDCommenterYank
map <silent> <LocalLeader>l  :NumbersToggle<CR>
map <silent> <LocalLeader>lo :NumbersOnOff<CR>
map <silent> <LocalLeader>rp :call RainbowEnable()<CR>
map <silent> <LocalLeader>sc :SyntasticCheck<CR>
map <silent> <LocalLeader>tb :TagbarToggle<CR>
map <silent> <LocalLeader>tp :TagbarCurrentTag "p"<CR>
noremap <C-[> :TagbarCurrentTag "p"<CR>
map <silent> <LocalLeader>ta :Tabularize assignment<CR>

" inoremap <C-[> <C-O>:TagbarCurrentTag "p"<CR>
" map <silent> <LocalLeader>]  :exe "ptjump " . expand("<cword>")<CR>


"""""""""""""""""""
" VISUAL SETTINGS "
"""""""""""""""""""

" Whitespace highlighting
highlight CursorLineNr cterm=underline ctermbg=236 ctermfg=11 guifg=#073642
highlight NonText cterm=none ctermfg=0 guifg=#073642
highlight SpecialKey cterm=none ctermfg=8 guifg=#073642 guibg=#002b36
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/

" Custom highlighting
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
highlight String ctermfg=227
autocmd ColorScheme * highlight String ctermfg=227

" Highlight too-long lines
" autocmd BufRead,InsertEnter,InsertLeave * 2match LineLengthError /\%126v.*/
" highlight LineLengthError ctermbg=darkgrey guibg=black
" autocmd ColorScheme * highlight LineLengthError ctermbg=darkgrey guibg=black

" Scala Settings
" highlight link scalaCapitalWord
highlight scalaExternal ctermfg=1
highlight scalaInstanceDeclaration ctermfg=42
highlight scalaKeywordModifier ctermfg=197 cterm=underline
highlight scalaCaseFollowing ctermfg=208
autocmd ColorScheme * highlight scalaExternal ctermfg=1
autocmd ColorScheme * highlight scalaInstanceDeclaration ctermfg=42
autocmd ColorScheme * highlight scalaKeywordModifier ctermfg=197 cterm=underline
autocmd ColorScheme * highlight scalaCaseFollowing ctermfg=208

" Status bar
function! SyntaxItem()
    return synIDattr(synID(line("."),col("."),1),"name")
endfunction
set laststatus=2

" Startify
let g:startify_custom_header = [
  \ '                                 ________  __ __        ',
  \ '            __                  /\_____  \/\ \\ \       ',
  \ '    __  __ /\_\    ___ ___      \/___//''/''\ \ \\ \    ',
  \ '   /\ \/\ \\/\ \ /'' __` __`\        /'' /''  \ \ \\ \_ ',
  \ '   \ \ \_/ |\ \ \/\ \/\ \/\ \      /'' /''__  \ \__ ,__\',
  \ '    \ \___/  \ \_\ \_\ \_\ \_\    /\_/ /\_\  \/_/\_\_/  ',
  \ '     \/__/    \/_/\/_/\/_/\/_/    \//  \/_/     \/_/    ',
  \ '',
  \ 'Time to start editing!',
  \ '',
  \ ''
  \ ]
