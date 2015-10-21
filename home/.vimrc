set nocompatible

" auto reload this very rc!
" augroup myvimrc
"     au!
"     au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
" augroup END

" Environment " {{{

let mapleader = ','
let localleader = '_'

" load bundles
if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif

set term=xterm-256color
set t_Co=256

" Less lag
set lazyredraw
set ttyfast


" Allow to trigger background
function! ToggleBG()
    let s:tbg = &background
    " Inversion
    if s:tbg == "dark"
        set background=light
    else
        set background=dark
    endif
endfunction
noremap <leader>bg :call ToggleBG()<CR>

if has('clipboard')
    if has('unnamedplus')  " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else         " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif

filetype plugin indent on           " Automatically detect file types.
syntax on                           " Syntax highlighting
set mouse=a                         " Automatically enable mouse usage
set mousehide                       " Hide the mouse cursor while typing
scriptencoding utf-8

set foldmethod=marker               " use foldmarkers
let &fmr = ' {{{, }}}'              " Put spaces between comment and marker
autocmd BufNewFile,BufRead * :let &cms = ' ' . &cms
set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore             " Allow for cursor beyond last character
set history=1000                    " Store a ton of history (default is 20)
set nospell                         " Spell checking off
set hidden                          " Allow buffer switching without saving
set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=#                    " '#' is an end of word designator
set iskeyword-=-                    " '-' is an end of word designator
set iskeyword-=_                    " '_' is an end of word designator

set tags=.tags,./tags,tags,../tags,~/.vimtags

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
" Restore cursor to file position in previous editing session
function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

" Make directory automatically.
" --------------------------------------
" http://vim-users.jp/2011/02/hack202/

autocmd BufWritePre *
      \ call s:mkdir_as_necessary(expand('<afile>:p:h'), v:cmdbang)
function! s:mkdir_as_necessary(dir, force)
  if !isdirectory(a:dir) && &l:buftype == '' &&
        \ (a:force || input(printf('"%s" does not exist. Create? [y/N]',
        \              a:dir)) =~? '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction

set backup                          " Backups are nice ...
set undofile                        " So is persistent undo ...
set undolevels=1000                 " Maximum number of changes that can be undone
set undoreload=10000                " Maximum number lines to save for undo on a buffer reload

" }}}

" UI " {{{

" color molokai
" color behelit
set background=dark                 " Assume a dark background
color bubblegum-256-dark

set showmode                        " Display the current mode
set cursorline                      " highlight current line

highlight clear SignColumn          " SignColumn should match background
highlight clear LineNr              " Make line number match background

set backspace=indent,eol,start      " Backspace for dummies
set ruler                           " Show the ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
set showcmd                         " Show partial commands in status line and
                                    " Selected characters/lines in visual mode

set linespace=1                     " No extra spaces between rows
set showmatch                       " Show matching brackets/parenthesis
set incsearch                       " Find as you type search
set nohlsearch                      " Dont highlight search terms
set winminheight=0                  " Windows can be 0 line high
set ignorecase                      " Case insensitive search
set smartcase                       " Case sensitive when uc present
set wildmenu                        " Show list instead of just completing
set wildmode=list:longest,full      " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]       " Backspace and cursor keys wrap too
set scrolljump=20                   " Lines to scroll when cursor leaves screen
set scrolloff=10                    " Minimum lines to keep above and below cursor
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
" hi Search ctermbg=161

" Smart numbering
set number
" set relativenumber

" augroup linenumbers
"   autocmd!
"   autocmd BufEnter *    :set relativenumber
"   autocmd BufLeave *    :set number norelativenumber
"   autocmd WinEnter *    :set relativenumber
"   autocmd WinLeave *    :set number norelativenumber
"   autocmd InsertEnter * :set number norelativenumber
"   autocmd InsertLeave * :set relativenumber
"   autocmd FocusLost *   :set number norelativenumber
"   autocmd FocusGained * :set relativenumber
" augroup END

set laststatus=2
set statusline=%<%f\                     " Filename
set statusline+=%w%h%m%r                 " Options
set statusline+=%{fugitive#statusline()} " Git Hotness
set statusline+=\ [%{&ff}/%Y]            " Filetype
set statusline+=\ [%{getcwd()}]          " Current dir
set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

" Formatting
set autoindent                      " Indent at the same level of the previous line
set shiftwidth=4                    " Use indents of 4 spaces
set expandtab                       " Tabs are spaces, not tabs
set tabstop=4                       " An indentation every four columns
set softtabstop=4                   " Let backspace delete indent
set nojoinspaces                    " Prevents inserting two spaces after punctuation on a join (J)
set splitright                      " Puts new vsplit windows to the right of the current
set splitbelow                      " Puts new split windows to the bottom of the current
set pastetoggle=<F12>               " pastetoggle (sane indentation on pastes)

" don't auto continue line comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Remove trailing whitespaces and ^M chars
autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl,sql autocmd BufWritePre <buffer> if !exists('g:spf13_keep_trailing_whitespace') | call StripTrailingWhitespace() | endif

" }}}

" Keybindings " {{{
" nnoremap ,, ,

"make Y consistent with rest of vim!
nmap Y y$

" Easy esc
inoremap jk <Esc>
cnoremap jk <Esc>
snoremap jk <Esc>
" inoremap kj <Esc>

"easy command mode
nnoremap ; :
nnoremap : ;
" nnoremap ;; ;
" vnoremap ; :
" vnoremap ;; ;

" no more bullshit
nnoremap q: <Nop>

" Move around easier
inoremap <C-o>   <Esc>o
imap <C-j>       <Down>
imap <C-k>       <Up>
cmap <C-j>       <Down>
cmap <C-k>       <Up>

" Wrapped lines goes down/up to next row, rather than next line in file.
" noremap <silent> j gj
" noremap <silent> k gk

" <num>j or k now marks a jump location
" nnoremap <silent> k :<C-u>execute 'normal!' (v:count > 1 ? "m'".v:count.'k' : 'gk')<Return>
" nnoremap <silent> j :<C-u>execute 'normal!' (v:count > 1 ? "m'".v:count.'j' : 'gj')<Return>

"add new lines above/below current line.
nmap <silent> gO O<Esc>
nmap <silent> go o<Esc>

"paste in insertmode
inoremap <C-v> <C-r>+

" Easier moving in tabs and windows
" The lines conflict with the default digraph mapping of <C-K>
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h
"nmap <BS> <C-W>h<C-W> "C-H bugged in nvim

" Scroll the window next to the current one
"   (especially useful for two-window split)
nmap <silent> <leader>j <c-w>w<c-d><c-w>W
nmap <silent> <leader>k <c-w>w<c-u><c-w>W

" Go to the first and last char of the line
nnoremap H ^
nnoremap L g_
vnoremap H ^
vnoremap L g_

" allows incsearch highlighting for range commands
cnoremap $t <CR>:t''<CR>
cnoremap $m <CR>:m''<CR>
cnoremap $d <CR>:d<CR>``

" Make search results invisible
nnoremap <silent> <leader>/ :set invhlsearch<CR>
" Clear search
" nn <silent> <BS> :nohlsearch<CR>

" Find merge conflict markers
nnoremap <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

"Duplicate lines above and below
inoremap <C-A-down> <esc>Ypk
nnoremap <C-A-down> Ypk
xnoremap <C-A-down> y`>pgv
inoremap <C-A-up> <esc>YPj
nnoremap <C-A-up> YPj
xnoremap <C-A-up> y`<Pgv

" swap word under the cursor with previous word on the left
nnoremap <M-l>  "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><C-o><C-l>
" swap word under the cursor with next word on the right
nnoremap <M-h> "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><C-o>/\w\+\_W\+<CR><C-l>
" bubble lines up and down
nnoremap <M-k> ddkP
nnoremap <M-j> ddp


"Jump back to last edited buffer
" nnoremap <C-b> <C-^>
" inoremap <C-b> <esc><C-^>

"Will open files in current directory, allows you to leave the working cd in
"the project root. You can also use %% anywhere in the command line to expand.
cnoremap %% <C-R>=expand('%:h').'/'<cr>
nmap <leader>ew :e %%
nmap <leader>es :sp %%
nmap <leader>ev :vsp %%
nmap <leader>et :tabe %%

" Change Working Directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" split edit vimrc
nnoremap <leader>ev <C-w><C-s><C-l>:e $MYVIMRC<CR>

" Strip whitespaces
nnoremap <leader>sw :call StripTrailingWhitespace()<CR>

" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>

" Adjust viewports to the same size
map <Leader>= <C-w>=

" Map <Leader>ff to display all lines with keyword under cursor
" and ask which one to jump to
nnoremap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Easy formatting
nmap <silent> <leader>q gwie

" Initialize directories
function! InitializeDirectories()
    let parent = $HOME
    let prefix = 'vim'
    let dir_list = {
                \ 'backup': 'backupdir',
                \ 'views': 'viewdir',
                \ 'swap': 'directory' }

    if has('persistent_undo')
        let dir_list['undo'] = 'undodir'
    endif

    let common_dir = parent . '/.' . prefix

    for [dirname, settingname] in items(dir_list)
        let directory = common_dir . dirname . '/'
        if exists("*mkdir")
            if !isdirectory(directory)
                call mkdir(directory)
            endif
        endif
        if !isdirectory(directory)
            echo "Warning: Unable to create backup directory: " . directory
            echo "Try: mkdir -p " . directory
        else
            let directory = substitute(directory, " ", "\\\\ ", "g")
            exec "set " . settingname . "=" . directory
        endif
    endfor
endfunction
call InitializeDirectories()

function! StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " do the business:
    %s/\s\+$//e
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

function! s:RunShellCommand(cmdline)
    botright new

    setlocal buftype=nofile
    setlocal bufhidden=delete
    setlocal nobuflisted
    setlocal noswapfile
    setlocal owrap
    setlocal filetype=shell
    setlocal syntax=shell

    call setline(1, a:cmdline)
    call setline(2, substitute(a:cmdline, '.', '=', 'g'))
    execute 'silent $read !' . escape(a:cmdline, '%#')
    setlocal nomodifiable
    1
endfunction

command! -complete=file -nargs=+ Shell call s:RunShellCommand(<q-args>)
" e.g. Grep current file for <search_term>: Shell grep -Hn <search_term> %

command! -nargs=1 Silent
\ | execute ':silent !'.<q-args>
\ | execute ':redraw!'

" }}}
