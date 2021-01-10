"
" plugins
let need_to_install_plugins = 0
if empty(glob('~/.vim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        let need_to_install_plugins = 1
        echo "Creating Directories..."
        !mkdir ~/.vim/temp
        !mkdir ~/.vim/backup
endif
call plug#begin()
"    Plug 'VundleVim/Vundle.vim'
    Plug 'scrooloose/nerdtree' "For file open dialog
    Plug 'hdima/python-syntax' "Python syntax highlight
    Plug 'nvie/vim-flake8' "pip install flake8 to install, :ccl to close quickfix
    Plug 'maralla/completor.vim' "asynchronous code completion framework
    Plug 'jmcantrell/vim-virtualenv'
    Plug 'python-mode/python-mode'
    Plug 'liuchengxu/space-vim-dark'
    Plug 'vim-scripts/L9' "Used for: vim scripting
    Plug 'itchyny/lightline.vim'
    Plug 'mengelbrecht/lightline-bufferline'
    Plug 'Vimjas/vim-python-pep8-indent'
    Plug 'gabrielelana/vim-markdown'

    "Vim Colorschemes
    Plug 'jnurmine/Zenburn'
    Plug 'morhetz/gruvbox'
    Plug 'jonathanfilip/vim-lucius'
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'zacanger/angr.vim'
    Plug 'sainnhe/gruvbox-material'
    Plug 'altercation/vim-colors-solarized'
    "Plug 'rakr/vim-one'
    "locally stored color schemes; syntax works in macos
    "Plug 'file://~/.vim/colors/relaxedgreen.vim', {'pinned': 1}
    "Plug 'file://~/.vim/colors/onedark.vim', {'pinned': 1}
    " Wiki - Personal wiki 
    Plug 'joshdick/onedark.vim'
    Plug 'vimwiki/vimwiki'

    "File Managers
    "
    Plug 'istib/vifm.vim'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'

    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'dense-analysis/ale'
    Plug 'jistr/vim-nerdtree-tabs'
    Plug 'jiangmiao/auto-pairs'
call plug#end()

filetype plugin indent on
syntax on
set path+=**

if need_to_install_plugins == 1
    echo "Installing plugins..."
    silent! PlugInstall
    echo "Done!"
    q
endif

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END
"set guifont=SauceCodePro\ Nerd\ Font \Complete_Regular:h13:cANSI
"set guifont=Source\ Code\ Pro\ for\ Powerline:h13:cANSI
set guifont=Hack\ Nerd\ Font:h13

syntax enable
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
"For fullstack development
au BufNewFile,Bufread *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

let python_highlight_all=1
syntax on
"Map keyboard shortcuts for font zoom
        
:set backupdir=~/.vim/backup/,~/vimfiles/backup/ " where to put backup files
:set backup " make backup files
:set breakindent " this is just awesome (best patch in a long time)
:set directory=~/.vim/temp/,~/vimfiles/temp/ " directory to place swap files in
:set expandtab " no real tabs please!
:set exrc " source .vimrc _vimrc .exrc _exrc files in local tree (deepest found rules all)
:set fileencoding=utf-8 " UTF-8
:set fileformats=unix,dos,mac " support all three, in this order

" For accessing system clipboard, works in OS-X
set clipboard=unnamed

let g:vim_json_syntax_conceal = 0

":set colorcolumn=80
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar
":set lines=999 columns=999
highlight ColorColumn ctermbg=0 guibg=lightgrey

" ==== NERDTREE
let NERDTreeIgnore = ['__pycache__', '\.pyc$', '\.o$', '\.so$', '\.a$', '\.swp', '*\.swp', '\.swo', '\.swn', '\.swh', '\.swm', '\.swl', '\.swk', '\.sw*$', '[a-zA-Z]*egg[a-zA-Z]*', '.DS_Store']

let NERDTreeShowHidden=1
let g:NERDTreeWinPos="left"
let g:NERDTreeDirArrows=0
map <C-t> :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
let g:nerdtree_open = 0

" Ale
let g:ale_linters = {'python': ['flake8', 'pydocstyle', 'bandit', 'mypy']}
let g:ale_fixers = {'*':[], 'python': ['black']}

"" === flake8
let g:flake8_show_in_file=1
"
"" ==== snippets
"" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"
"
"" ==== moving around
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
"
"split navigations
"
nnoremap <C-J> <C-W><C-J>  
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Enable mouse
set mouse=a
"Disable by adding mouse=c
"
"" ==== disable swap file warning
set shortmess+=A
"
"" === generate ctags
"" echo "generating tags..."
"" call system('ctags -R . ')
"
let g:pymode_indent = 0
"" ==== custom commands
"command JsonPretty execute ":%!python -m json.tool"
"set secure
"
" Enable folding
set foldmethod=indent
set foldlevel=99
"
""Enable folding with the spacebar
"nnoremap <space> za

"Keymap for Gundotoggle
"Assign to ^Z 
"nnoremap <C-z> :GundoToggle<CR>
autocmd FileType py,c,cpp,java,php autocmd BufWritePre <buffer> %s/\s\+$//e
"autocmd BufWritePost *.py call flake8#Flake8() "Call Flake8 while saving file

"nnoremap <F5> <Esc>:w<CR>:!clear;python %<CR>
"
set fileencoding=utf-8
"set fileencodings=ucs-bom,utf8,prc
"set termencoding=utf-8
set encoding=utf-8

au BufNewFile,BufRead *.chklst setf chklst 
let mapleader = " "

" Begin Lightline configuration...
if !has('gui_running')
  set t_Co=256
endif
if has('gui_running')
  set guifont=Source\ Code\ Pro\ for\ Powerline:h13
  set guioptions-=e
endif
set showtabline=2
set noshowmode
let g:lightline                  = {}
let g:lightline#bufferline#show_number=1
let g:lightline#bufferline#number_separator=":"
"let g:lightline#bufferline#enable_devicons=1
let g:lightline#bufferline#unicode_symbols=1
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'
let g:lightline#bufferline#filename_modifier = ':t'
" PEP8-Indent {
let g:python_pep8_indent_hang_closing = 0
let g:python_pep8_indent_multiline_string=1
" }

"let g:lightline = {
"      \ 'tab_component_function': {
"      \   'tabnum': 'LightlineWebDevIcons',
"      \ },
"      \ }
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ] 
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['close'] ]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'spell': '%{&spell?&spelllang:""}',
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))'
      \ }} 
"      \ 'component_function': {
"      \   'modified': 'LightLineModified',
"      \   'readonly': 'LightLineReadonly',
"      \   'fugitive': 'LightLineFugitive',
"      \   'filename': 'LightLineFilename',
"      \   'fileformat': 'LightLineFileformat',
"      \   'filetype': 'LightLineFiletype',
"      \   'fileencoding': 'LightLineFileencoding',
"      \   'mode': 'LightLineMode',},
"      \   'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
"      \   'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
"      \ }

" To enable the saving and restoring of screen positions.
let g:screen_size_restore_pos = 1

" To save and restore screen for each Vim instance.
" This is useful if you routinely run more than one Vim instance.
" For all Vim to use the same settings, change this to 0.
let g:screen_size_by_vim_instance = 1
" Added to save and restore screen positions.
"
if has("gui_running")
  function! ScreenFilename()
    if has('amiga')
      return "s:.vimsize"
    elseif has('win32')
      return $HOME.'\_vimsize'
    else
      return $HOME.'/.vimsize'
    endif
  endfunction

  function! ScreenRestore()
    " Restore window size (columns and lines) and position
    " from values stored in vimsize file.
    " Must set font first so columns and lines are based on font size.
    let f = ScreenFilename()
    if has("gui_running") && g:screen_size_restore_pos && filereadable(f)
      let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
      for line in readfile(f)
        let sizepos = split(line)
        if len(sizepos) == 5 && sizepos[0] == vim_instance
          silent! execute "set columns=".sizepos[1]." lines=".sizepos[2]
          silent! execute "winpos ".sizepos[3]." ".sizepos[4]
          return
        endif
      endfor
    endif
  endfunction

  function! ScreenSave()
    " Save window size and position.
    if has("gui_running") && g:screen_size_restore_pos
      let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
      let data = vim_instance . ' ' . &columns . ' ' . &lines . ' ' .
            \ (getwinposx()<0?0:getwinposx()) . ' ' .
            \ (getwinposy()<0?0:getwinposy())
      let f = ScreenFilename()
      if filereadable(f)
        let lines = readfile(f)
        call filter(lines, "v:val !~ '^" . vim_instance . "\\>'")
        call add(lines, data)
      else
        let lines = [data]
      endif
      call writefile(lines, f)
    endif
  endfunction

  if !exists('g:screen_size_restore_pos')
    let g:screen_size_restore_pos = 1
  endif
  if !exists('g:screen_size_by_vim_instance')
    let g:screen_size_by_vim_instance = 1
  endif
  autocmd VimEnter * if g:screen_size_restore_pos == 1 | call ScreenRestore() | endif
  autocmd VimLeavePre * if g:screen_size_restore_pos == 1 | call ScreenSave() | endif
endif

"Settings for fzf
"
"" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - Popup window
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" - down / up / left / right
let g:fzf_layout = { 'down': '40%' }

" - Window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10new' }

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'


" file browser
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let NERDTreeMinimalUI = 1
let g:nerdtree_open = 0
map <leader>n :call NERDTreeToggle()<CR>

function NERDTreeToggle()
    "NERDTreeTabsToggle
    NERDTree %
    if g:nerdtree_open == 1
        let g:nerdtree_open = 0
    else
        let g:nerdtree_open = 1
        wincmd p
        NERDTreeToggle
    endif
endfunction
function! StartUp()
    if 0 == argc()
        NERDTreeToggle
    end
endfunction
autocmd VimEnter * call StartUp()


"Set the virtualenv directory
let g:solarized_termcolors=256
let g:virtualenv_directory = '~/.virtualenvs'
let g:virtualenv_auto_activate = 1

"map leader:h to show top on a new tab - demo 
noremap <leader>h :tab term ++close top<CR>

"Disable Bells and flashes in Vim
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
set vb t_vb=
set belloff=all
"
"use cd to change to the directory of current file
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
"Change the color scheme
set background=dark
if has('gui_running')
    set background=dark "light
    colorscheme solarized ""gruvbox
    set guioptions-=e
else
    set background=dark "light
    colorscheme solarized ""gruvbox
endif

