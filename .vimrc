" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"The powerful stuff
Plug 'dense-analysis/ale' "Linter
Plug 'SirVer/ultisnips' "Snippets Engine
Plug 'honza/vim-snippets' "Snippets
Plug 'ycm-core/YouCompleteMe' "Completion
Plug 'machakann/vim-sandwich' "Delimiters
Plug 'lervag/vimtex' "LaTeX plugin
Plug 'rust-lang/rust' "Rust plugin

"General Niceties
Plug 'junegunn/rainbow_parentheses.vim' "Use :RainbowParentheses
Plug 'machakann/vim-highlightedyank' "Highlights yanks
Plug 'sheerun/vim-wombat-scheme' "Wombat colorscheme
Plug 'preservim/nerdtree' "toggle mapped to ctrl + n
Plug 'junegunn/fzf' "fuzzy find
Plug 'junegunn/fzf.vim' "fuzzy find defaults

"For writing and markdown
Plug 'junegunn/goyo.vim' "Use :Goyo
Plug 'junegunn/limelight.vim' "Use :Limelight and :Limelight!

"Stuff from before that needs to be given a once over.
"Plug 'https://github.com/junegunn/fzf.vim.git'
"Plug 'https://github.com/majutsushi/tagbar.git'
"Plug 'https://github.com/sheerun/vim-polyglot.git'
"Plug 'https://github.com/ervandew/supertab.git'
"Plug 'https://github.com/tmhedberg/SimpylFold.git'
"Plug 'https://github.com/Konfekt/FastFold.git'
"Plug 'https://github.com/preservim/nerdcommenter.git'

call plug#end()

set encoding=utf-8
set clipboard=unnamed
"Cursor Settings
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/
colorscheme wombat
set number "show line numbers
set relativenumber  " show relative line numbers
" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin on
filetype indent on
syntax on
set colorcolumn=80
highlight ColorColumn ctermbg=233 "set colorcolumn color.
set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again
:nnoremap <F5> :w<CR>
set wildmenu
autocmd BufWritePre * :%s/\s\+$//e "Deletes trialing white spaces before saving.


let g:airline_theme='wombat'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"if !exists('g:airline_symbols')
"    let g:airline_symbols = {}
"endif

"Powerline Startup - using airline now.
"python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup
"set laststatus=2

"Vimtex Settings
let g:tex_flavor='latex'
let g:vimtex_view_method = 'skim'
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme

"integrates Goyo and Limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

"Trigger configuration. Do not use <tab> if you use YouCompleteMe.
let g:UltiSnipsExpandTrigger="<F5>"
let g:UltiSnipsListSnippets="<S-F6>"
let g:UltiSnipsJumpForwardTrigger="<F6>"
let g:UltiSnipsJumpBackwardTrigger="<S-F6>"
let g:UltiSnipsEditSplit='vertical'

"Need to check stuff below this!!!

"Setting NERDTreeToggle and Tagbar to ctrl+N and ctrl+M respectively
nmap <C-n> :NERDTreeToggle<CR>
"nmap <C-m> :TagbarToggle<CR>
autocmd VimEnter * RainbowParentheses

"Folding toggle with space
"nnoremap <space> zA
"set nofoldenable


" Showing line numbers and length
"" set tw=79   " width of document (used by gd)
"" set nowrap  " don't automatically wrap on load
"" set fo-=t   " don't automatically wrap text when typing

" Mouse and backspace


" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>


" map sort function to a key
vnoremap <Leader>s :sort<CR>


" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  "better indentation
vnoremap > >gv  "better indentation


" Useful settings
set history=700
set undolevels=700


" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


" Make search case insensitive
"set hlsearch
"set incsearch
"set ignorecase
"set smartcase
