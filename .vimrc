" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

call plug#begin('~/.vim/plugged')

"Basic Setup
Plug 'https://github.com/dense-analysis/ale.git' "linter
"Plug 'https://github.com/SirVer/ultisnips.git' "snippets
Plug 'https://github.com/machakann/vim-highlightedyank.git' "Highlights yanks
Plug 'https://github.com/ycm-core/YouCompleteMe.git' "might have to recompile occassionally. Need extra options to add support for some languages.
"Consider vim-sandwhich or vim-surroud for delimiters

"LaTeX files
Plug 'https://github.com/lervag/vimtex'

"For writing and markdown
Plug 'https://github.com/junegunn/goyo.vim.git' "Use :Goyo
Plug 'https://github.com/junegunn/limelight.vim.git' "Use :Limelight and :Limelight!

"Stuff from before that needs to be given a once over.
Plug 'https://github.com/junegunn/fzf.vim.git' "ytfo
Plug 'https://github.com/majutsushi/tagbar.git'
Plug 'https://github.com/preservim/nerdtree.git'
Plug 'https://github.com/sheerun/vim-polyglot.git'
"Plug 'https://github.com/ycm-core/YouCompleteMe.git'
Plug 'https://github.com/ervandew/supertab.git'
"Plug 'https://github.com/vim-airline/vim-airline.git'

"Coding Niceties
Plug 'https://github.com/junegunn/rainbow_parentheses.vim.git' "Use :RainbowParentheses
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/tmhedberg/SimpylFold.git'
Plug 'https://github.com/Konfekt/FastFold.git'
Plug 'https://github.com/preservim/nerdcommenter.git'

"Colorschemes
Plug 'https://github.com/joshdick/onedark.vim.git'
Plug 'https://github.com/sheerun/vim-wombat-scheme.git'
Plug 'https://github.com/vim-airline/vim-airline-themes.git'

"Plug 'vim-scripts/AutoComplPop'
"Plug 'https://github.com/powerline/powerline.git' "ytfo

call plug#end()

set encoding=utf-8 "just in case
set clipboard=unnamed
"Cursor Settings
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

"Powerline
"set rtp+=/Users/insignificant/.pyenv/versions/3.8.3/Python.framework/Versions/3.8/lib/python3.8/site-packages/powerline/bindings/vim
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
set laststatus=2

"Vimtex Settings
let g:tex_flavor='latex'
let g:vimtex_view_method = 'skim'
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/
colorscheme wombat

"integrates Goyo and Limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

"Setting NERDTreeToggle and Tagbar to ctrl+N and ctrl+M respectively
nmap <C-n> :NERDTreeToggle<CR>
nmap <C-m> :TagbarToggle<CR>
autocmd VimEnter * RainbowParentheses

" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin on
filetype indent on
syntax on

"Need to check stuff below this!!!

"Folding toggle with space
nnoremap <space> zA
set nofoldenable


" Showing line numbers and length
set number "show line numbers
set relativenumber  " show relative line numbers
" set tw=79   " width of document (used by gd)
"" set nowrap  " don't automatically wrap on load
"" set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233


" Mouse and backspace
set mouse=a  " on OSX press ALT and click
"" set bs=2     " make backspace behave like normal again


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
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


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


" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
" let g:ctrlp_max_height = 30
" set wildignore+=*.pyc
" set wildignore+=*_build/*
" set wildignore+=*/coverage/*



" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
"" let g:jedi#usages_command = "<leader>z"
"" let g:jedi#popup_on_dot = 0
"" let g:jedi#popup_select_first = 0
"" map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
"" set completeopt=longest,menuone
"" function! OmniPopup(action)
""     if pumvisible()
""         if a:action == 'j'
""             return "\<C-N>"
""         elseif a:action == 'k'
""             return "\<C-P>"
""         endif
""     endif
""     return a:action
"" endfunction

"" inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
"" inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>
