set nocompatible  " be iMproved, required
filetype off  " required
set exrc

set encoding=UTF-8
scriptencoding UTF-8
set rtp+=/usr/local/opt/fzf
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree' "For file open dialog
Plugin 'hdima/python-syntax' "Python syntax highlight
Plugin 'nvie/vim-flake8' "pip install flake8 to install, :ccl to close quickfix
Plugin 'maralla/completor.vim' "asynchronous code completion framework
Plugin 'jmcantrell/vim-virtualenv'
"Plugin 'python-mode/python-mode'
Plugin 'liuchengxu/space-vim-dark'
Plugin 'vim-scripts/L9' "Used for: vim scripting
Plugin 'itchyny/lightline.vim'
Plugin 'mengelbrecht/lightline-bufferline'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'gabrielelana/vim-markdown'

"Vim Colorschemes
Plugin 'jnurmine/Zenburn'
Plugin 'morhetz/gruvbox'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'zacanger/angr.vim'
Plugin 'sainnhe/gruvbox-material'
"locally stored color schemes; syntax works in macos
Plugin 'file://~/.vim/colors/relaxedgreen.vim', {'pinned': 1}
Plugin 'file://~/.vim/colors/pink.vim', {'pinned': 1}
Plugin 'file://~/.vim/colors/apprentice.vim', {'pinned': 1}
Plugin 'file://~/.vim/colors/pyte.vim', {'pinned': 1}

"Plugin 'sheerun/vim-polyglot' A collection of language packs for Vim, enable
"as required
" Wiki - Personal wiki 
Plugin 'vimwiki/vimwiki'

"File Managers
"
Plugin 'istib/vifm.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'ryanoasis/vim-devicons'
Plugin 'dense-analysis/ale'
call vundle#end()
filetype plugin indent on
"Set the virtualenv directory

let g:virtualenv_directory = '~/Envs'
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
    \ set softtabstop=4
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
let g:WebDevIconsOS = 'Darwin'
" loading the plugin
let g:webdevicons_enable = 1
" adding the flags to NERDTree
let g:webdevicons_enable_nerdtree = 1
" adding the custom source to unite
let g:webdevicons_enable_unite = 1
" adding the column to vimfiler
let g:webdevicons_enable_vimfiler = 1
" adding to vim-airline's tabline
let g:webdevicons_enable_lightline_tabline = 1
" adding to vim-airline's statusline
let g:webdevicons_enable_lightline_statusline = 1
let g:webdevicons_enable_startify = 1

set background=dark
if has('gui_running')
    set background=dark "light
    colorscheme gruvbox
    set guioptions-=e
else
    set background=dark "light
    colorscheme gruvbox
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

" ==== disable mouse
"set mouse=c
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
set enc=utf-8
set fileencoding=utf-8
"set fileencodings=ucs-bom,utf8,prc
"set termencoding=utf-8
set encoding=utf-8

"Turn on pymode plugin
"let g:pymode = 1
"let g:pymode_paths = []
"let g:pymode_trim_whitespaces = 1
"let g:pymode_options = 1
"let g:pymode_options_max_line_length = 79
"let g:pymode_options_colorcolumn = 1
"let g:pymode_quickfix_minheight = 3
"let g:pymode_quickfix_maxheight = 6
"let g:pymode_preview_height = 10
"let g:pymode_preview_position = 'botright'
"let g:pymode_python = 'python3'
"let g:pymode_indent = 0
"let g:pymode_motion = 1
"let g:pymode_doc = 1
"let g:pymode_doc_bind = 'K'
"let g:pymode_virtualenv = 1
"let g:pymode_virtualenv_path = $VIRTUAL_ENV
"let g:pymode_run = 1
"let g:pymode_run_bind = '<leader>r'
"let g:pymode_breakpoint = 1
"let g:pymode_breakpoint_bind = '<leader>b'
"let g:pymode_breakpoint_cmd = ''
"let g:pymode_lint = 1
"let g:pymode_lint_Auto = 1
"let g:pymode_lint_on_write = 1
"let g:pymode_lint_unmodified = 1
"let g:pymode_lint_on_fly = 1
"let g:pymode_lint_message = 1
"let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe', 'black'] ", 'pycodestyle']
"let g:pymode_lint_ignore = ["E501", "W",]
"let g:pymode_lint_select = ["E501", "W0011", "W430"]
"let g:pymode_lint_sort = []
"let g:pymode_lint_cwindow = 1
"let g:pymode_lint_signs = 1
"let g:pymode_lint_todo_symbol = 'WW'
"let g:pymode_lint_comment_symbol = 'CC'
"let g:pymode_lint_visual_symbol = 'RR'
"let g:pymode_lint_error_symbol = 'EE'
"let g:pymode_lint_info_symbol = 'II'
"let g:pymode_lint_pyflakes_symbol = 'FF'
"let g:pymode_syntax_all =1
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
let g:lightline#bufferline#enable_devicons=1
let g:lightline#bufferline#unicode_symbols=1
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'
let g:lightline#bufferline#filename_modifier = ':t'
" PEP8-Indent {
let g:python_pep8_indent_hang_closing = 0
let g:python_pep8_indent_multiline_string=1
" }

let g:lightline = {
      \ 'tab_component_function': {
      \   'tabnum': 'LightlineWebDevIcons',
      \ },
      \ }
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
      \ }, 
      \ 'component_function': {
      \   'modified': 'LightLineModified',
      \   'readonly': 'LightLineReadonly',
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',},
      \   'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \   'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
      \ }
"      \ 'separator': { 'left': '', 'right': '' },
"      \ 'subseparator': { 'left': '', 'right': '' },
"
"      \ 'separator': { 'left': '', 'right': '' },
"      \ 'subseparator': { 'left': '', 'right': '' }
"  \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
"  \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return _ !=# '' ? '⭠ '._ : ''
  endif
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction


" Bind F5 to save file if modified and execute python script in a buffer.
nnoremap <silent> <F5> :call SaveAndExecutePython()<CR>
vnoremap <silent> <F5> :<C-u>call SaveAndExecutePython()<CR>
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

function! SaveAndExecutePython()
    " SOURCE [reusable window]: https://github.com/fatih/vim-go/blob/master/autoload/go/ui.vim

    " save and reload current file
    silent execute "update | edit"

    " get file path of current file
    let s:current_buffer_file_path = expand("%")

    let s:output_buffer_name = "Python"
    let s:output_buffer_filetype = "output"

    " reuse existing buffer window if it exists otherwise create a new one
    if !exists("s:buf_nr") || !bufexists(s:buf_nr)
        silent execute 'botright new ' . s:output_buffer_name
        let s:buf_nr = bufnr('%')
    elseif bufwinnr(s:buf_nr) == -1
        silent execute 'botright new'
        silent execute s:buf_nr . 'buffer'
    elseif bufwinnr(s:buf_nr) != bufwinnr('%')
        silent execute bufwinnr(s:buf_nr) . 'wincmd w'
    endif

    silent execute "setlocal filetype=" . s:output_buffer_filetype
    setlocal bufhidden=delete
    setlocal buftype=nofile
    setlocal noswapfile
    setlocal nobuflisted
    setlocal winfixheight
    setlocal cursorline " make it easy to distinguish
    setlocal nonumber
    setlocal norelativenumber
    setlocal showbreak=""

    " clear the buffer
    setlocal noreadonly
    setlocal modifiable
    %delete _

    " add the console output
    silent execute ".!python " . shellescape(s:current_buffer_file_path, 1)

    " resize window to content length
    " Note: This is annoying because if you print a lot of lines then your code buffer is forced to a height of one line every time you run this function.
    "       However without this line the buffer starts off as a default size and if you resize the buffer then it keeps that custom size after repeated runs of this function.
    "       But if you close the output buffer then it returns to using the default size when its recreated
    "execute 'resize' . line('$')

    " make the buffer non modifiable
    setlocal readonly
    setlocal nomodifiable
endfunction

function! LightlineWebDevIcons(n)
  let l:bufnr = tabpagebuflist(a:n)[tabpagewinnr(a:n) - 1]
  return WebDevIconsGetFileTypeSymbol(bufname(l:bufnr))
endfunction

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
