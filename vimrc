set nocompatible  " be iMproved, required
filetype off  " required
set exrc

set encoding=UTF-8

"set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=$HOME/.vim/bundle/Vundle.vim/
call vundle#begin('$HOME/.vim/bundle/')
"call vundle#begin()

"source /Users/1013/sources.vim

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/L9' "Used for: vim scripting
Plugin 'vim-scripts/indentpython.vim' "for Python indendation
Plugin 'tpope/vim-fugitive' "Plugin for Git
"Plugin 'rstacruz/sparkup' "Write HTML Faster
Plugin 'scrooloose/nerdtree' "For file open dialog
Plugin 'airblade/vim-gitgutter' "Vim plugin which shows a git diff in the sign column
Plugin 'christoomey/vim-conflicted' " 
"Easy git merge conflict resolution in Vim
"Plugin 'terryma/vim-multiple-cursors' "Multicursor like sublime text
"Plugin 'mattn/emmet-vim' "exand abbreviations, read befor enabling
Plugin 'sjl/gundo.vim' "undo tree, mapped to F5
"Plugin 'easymotion/vim-easymotion' "Simpler way to use motion, read before enabling
"Plugin 'tpope/vim-surround' "To add surroundings ({'""'}) with keycombis,
"reqd ?
"Plugin 'godlygeek/tabular' "To tabularize text, maybe not required
"Plugin 'cakebaker/scss-syntax.vim' "For css syntax
Plugin 'hdima/python-syntax' "Python syntax highlight
"Plugin 'othree/yajs.vim' "Javascript syntax highlight
"Plugin 'mitsuhiko/vim-jinja' "support for jinja templating engine
Plugin 'tmhedberg/SimpylFold' "Good tool to fold sections
Plugin 'vim-syntastic/syntastic' "Requires flake8/pylint to be enabled, check !
Plugin 'nvie/vim-flake8' "pip install flake8 to install, :ccl to close quickfix
"Plugin 'kien/ctrlp.vim' "fuzzy file, buffer, mru, tag, ... finder 
Plugin 'maralla/completor.vim' "asynchronous code completion framework
Plugin 'skywind3000/asyncrun.vim'
Plugin 'jmcantrell/vim-virtualenv'
"Status bar 
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"for some colors

"Plugin 'jnurmine/Zenburn'
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'morhetz/gruvbox'
"Plugin 'jonathanfilip/vim-lucius'
Plugin 'liuchengxu/space-vim-dark'
Plugin 'vim-scripts/darktango.vim'

"add support for python automatic closing of brackets, braces, etc.
Plugin 'jiangmiao/auto-pairs'

call vundle#end()
filetype plugin indent on
"Set the virtualenv directory

let g:virtualenv_directory = 'd:/users/1013/'
set termguicolors

let g:airline_theme='angr'

" ==== Colors and other basic settings
"colorscheme gruvbox
"set guifont=Inconsolata-medium:h11
set guifont=consolas:h11
"set fillchars+=vert:\|
syntax enable
set background=dark

set ruler
set hidden
set number
set laststatus=2
set smartindent
set st=4 sw=4 et
"Added from Python formating.
au BufNewFile,BufRead *.py
    \ set tabstop=4
"    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix
    \ set cursorline
    \ set showmatch
"For fullstack development:w
au BufNewFile,Bufread *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

let python_highlight_all=1
syntax on
"Map keyboard shortcuts for font zoom

if has('gui_running')
    set background=light
    colorscheme space-vim-dark
else
    set background=dark
"    colorscheme gruvbox
    colorscheme space-vim-dark
endif
" For accessing system clipboard, works in OS-X
set clipboard=unnamed

let g:vim_json_syntax_conceal = 0

":set colorcolumn=80
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar
:set lines=999 columns=999
highlight ColorColumn ctermbg=0 guibg=lightgrey

" ==== NERDTREE
let NERDTreeIgnore = ['__pycache__', '\.pyc$', '\.o$', '\.so$', '\.a$', '\.swp', '*\.swp', '\.swo', '\.swn', '\.swh', '\.swm', '\.swl', '\.swk', '\.sw*$', '[a-zA-Z]*egg[a-zA-Z]*', '.DS_Store']

let NERDTreeShowHidden=1
let g:NERDTreeWinPos="left"
let g:NERDTreeDirArrows=0
map <C-t> :NERDTreeToggle<CR>

" ==== Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_mri_args = "--config=$HOME/.jshintrc"
let g:syntastic_python_checkers = [ 'pylint', 'flake8', 'python' ]
let g:syntastic_yaml_checkers = ['jsyaml']
let g:syntastic_html_tidy_exec = 'tidy5'
let g:syntastic_python_flake8_config_file='.flake8'

" === flake8
let g:flake8_show_in_file=1

" ==== snippets
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_semantic_triggers =  { 'c' : ['->', '.', '::', 're!gl'], 'objc': ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s'] }
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" ==== Easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap f <Plug>(easymotion-s)

" ==== moving around
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" ==== disable mouse
set mouse=c

" ==== disable swap file warning
set shortmess+=A

" === generate ctags
" echo "generating tags..."
" call system('ctags -R . ')

let g:pymode_indent = 0
" ==== custom commands
command JsonPretty execute ":%!python -m json.tool"
set secure

"====adding for nerdtree
"
"map <C-o> :NERDTreeToggle<CR>

"added by me
" Enable folding
set foldmethod=indent
set foldlevel=3

"Enable folding with the spacebar
nnoremap <space> za

""split navigations

nnoremap <C-J> <C-W><C-J>  
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Keymap for Gundotoggle
"Assign to ^Z 
nnoremap <C-z> :GundoToggle<CR>
autocmd FileType py,c,cpp,java,php autocmd BufWritePre <buffer> %s/\s\+$//e
"autocmd BufWritePost *.py call flake8#Flake8() "Call Flake8 while saving file


"
"https://github.com/jiangmiao/auto-pairs
"System Shortcuts:
"    <CR>  : Insert new indented line after return if cursor in blank brackets or quotes.
"    <BS>  : Delete brackets in pair
"    <M-p> : Toggle Autopairs (g:AutoPairsShortcutToggle)
"    <M-e> : Fast Wrap (g:AutoPairsShortcutFastWrap)
"    <M-n> : Jump to next closed pair (g:AutoPairsShortcutJump)
"    <M-b> : BackInsert (g:AutoPairsShortcutBackInsert)
"
"If <M-p> <M-e> or <M-n> conflict with another keys or want to bind to another keys, add
"
"    let g:AutoPairsShortcutToggle = '<another key>'
"
"to .vimrc, if the key is empty string '', then the shortcut will be disabled.
