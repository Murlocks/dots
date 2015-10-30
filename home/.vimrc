" vim: set ft=vim fdm=marker:

set nocompatible

" auto reload this very rc!
" augroup myvimrc
"     au!
"     au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
" augroup END

" Environment " {{{

let mapleader = ','
let localleader = '_'

" Clear vimrc augroup
augroup vimrc
    autocmd!
augroup END

" load bundles
if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif

set term=xterm-256color
set t_Co=256

" let g:netrw_browsex_viewer = "xdg-open"
let g:netrw_browsex_viewer = "firefox"

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
autocmd vimrc BufNewFile,BufRead * :let &cms = ' ' . &cms
set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore             " Allow for cursor beyond last character
set history=1000                    " Store a ton of history (default is 20)
set nospell                         " Spell checking off
set hidden                          " Allow buffer switching without saving
set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=#                    " '#' is an end of word designator
" set iskeyword-=-                    " '-' is an end of word designator
" set iskeyword-=_                    " '_' is an end of word designator

set tags=.tags,./tags,tags,../tags,~/.vimtags

" folding

set foldlevelstart=0

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction
set foldtext=MyFoldText() " }}}

function! s:Pulse() " {{{
    redir => old_hi
        silent execute 'hi CursorLine'
    redir END
    let old_hi = split(old_hi, '\n')[0]
    let old_hi = substitute(old_hi, 'xxx', '', '')

    let steps = 8
    let width = 1
    let start = width
    let end = steps * width
    let color = 233

    for i in range(start, end, width)
        execute "hi CursorLine ctermbg=" . (color + i)
        redraw
        sleep 6m
    endfor
    for i in range(end, start, -1 * width)
        execute "hi CursorLine ctermbg=" . (color + i)
        redraw
        sleep 6m
    endfor

    execute 'hi ' . old_hi
endfunction " }}}
command! -nargs=0 Pulse call s:Pulse()

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

autocmd vimrc BufWritePre *
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

set background=dark                 " Assume a dark background

" color monokai
" color behelit
color bubblegum-256-dark
" color base16-bright
" color triplejelly
" let g:seoul256_background = 235
" color seoul256

" Keep my background
hi Normal ctermfg=249 ctermbg=235 cterm=none guifg=#B2B2B2 guibg=#262626 gui=none

set showmode                        " Display the current mode
set cursorline                      " highlight current line

highlight clear SignColumn          " SignColumn should match background
highlight clear LineNr              " Make line number match background

set backspace=indent,eol,start      " Backspace for dummies
set ruler                           " Show the ruler
set rulerformat=%50(%=\%{fugitive#statusline()}\%y\ %l,%c%V\ %P%) " A ruler on steroids
set noshowcmd                         " Show partial commands in status line and
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
set nonumber
set norelativenumber

" augroup linenumbers
"     autocmd!
"     autocmd BufEnter *    :set relativenumber
"     autocmd BufLeave *    :set number norelativenumber
"     autocmd WinEnter *    :set relativenumber
"     autocmd WinLeave *    :set number norelativenumber
"     autocmd InsertEnter * :set number norelativenumber
"     autocmd InsertLeave * :set relativenumber
"     autocmd FocusLost *   :set number norelativenumber
"     autocmd FocusGained * :set relativenumber
" augroup END

" set laststatus=1
" " set statusline=%{expand('%:p')}
" " set statusline+=%<\                          " cut at start
" set statusline+=%f\                            " file name
" set statusline+=%h%m%r%w                       " flags
" set statusline+=%=                             " right align
" set statusline+=[%{strlen(&ft)?&ft:'none'},    " filetype
" set statusline+=%{strlen(&fenc)?&fenc:&enc},   " encoding
" set statusline+=%{&fileformat}]                " file format
" set statusline+=%-8(\ (%l,%c)\ %)%P                  " line and column
" " set statusline+=%<%P                           " percentage of file

" statusline setup
set statusline =%#identifier#
set statusline+=[%t]    "tail of the filename
set statusline+=%*

"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%#identifier#
set statusline+=%h      "help file flag
set statusline+=%y      "filetype
set statusline+=%*

"read only flag
set statusline+=%#identifier#
set statusline+=%r
set statusline+=%*

"modified flag
set statusline+=%#identifier#
set statusline+=%m
set statusline+=%*

set statusline+=%#identifier#
set statusline+=%{fugitive#statusline()}
set statusline+=%*

" display a warning if &et is wrong, or we have mixed-indenting
set statusline+=%#warningmsg#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*

set statusline+=%#identifier#
set statusline+=%{StatuslineTrailingSpaceWarning()}
set statusline+=%*

set statusline+=%#identifier#
set statusline+=%{StatuslineLongLineWarning()}
set statusline+=%*

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"display a warning if &paste is set
set statusline+=%#warningmsg#
" set statusline+=%{&paste?'[paste]':''}
" set statusline+=%*

set statusline+=%=      "left/right separator
set statusline+=%#warningmsg#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set statusline+=%*
set laststatus=2

"recalculate the trailing whitespace warning when idle, and after saving
autocmd vimrc cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

"return '[\s]' if trailing white space is detected
"return '' otherwise
function! StatuslineTrailingSpaceWarning()
    if !exists("b:statusline_trailing_space_warning")

        if !&modifiable
            let b:statusline_trailing_space_warning = ''
            return b:statusline_trailing_space_warning
        endif

        if search('\s\+$', 'nw') != 0
            let b:statusline_trailing_space_warning = '[\s]'
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction


"return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction

"recalculate the tab warning flag when idle and after writing
autocmd vimrc cursorhold,bufwritepost * unlet! b:statusline_tab_warning

"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let b:statusline_tab_warning = ''

        if !&modifiable
            return b:statusline_tab_warning
        endif

        let tabs = search('^\t', 'nw') != 0

        "find spaces that arent used as alignment in the first indent column
        let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning =  '[mixed-indenting]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '[&et]'
        endif
    endif
    return b:statusline_tab_warning
endfunction

"recalculate the long line warning when idle and after saving
autocmd vimrc cursorhold,bufwritepost * unlet! b:statusline_long_line_warning

"return a warning for "long lines" where "long" is either &textwidth or 80 (if
"no &textwidth is set)
"
"return '' if no long lines
"return '[#x,my,$z] if long lines are found, were x is the number of long
"lines, y is the median length of the long lines and z is the length of the
"longest line
function! StatuslineLongLineWarning()
    if !exists("b:statusline_long_line_warning")

        if !&modifiable
            let b:statusline_long_line_warning = ''
            return b:statusline_long_line_warning
        endif

        let long_line_lens = s:LongLines()

        if len(long_line_lens) > 0
            let b:statusline_long_line_warning = "[" .
                        \ '#' . len(long_line_lens) . "," .
                        \ 'm' . s:Median(long_line_lens) . "," .
                        \ '$' . max(long_line_lens) . "]"
        else
            let b:statusline_long_line_warning = ""
        endif
    endif
    return b:statusline_long_line_warning
endfunction

"return a list containing the lengths of the long lines in this buffer
function! s:LongLines()
    let threshold = (&tw ? &tw : 80)
    let spaces = repeat(" ", &ts)
    let line_lens = map(getline(1,'$'), 'len(substitute(v:val, "\\t", spaces, "g"))')
    return filter(line_lens, 'v:val > threshold')
endfunction

"find the median of the given array of numbers
function! s:Median(nums)
    let nums = sort(a:nums)
    let l = len(nums)

    if l % 2 == 1
        let i = (l-1) / 2
        return nums[i]
    else
        return (nums[l/2] + nums[(l/2)-1]) / 2
    endif
endfunction

" set statusline=%<%f\                     " Filename
" set statusline+=%w%h%m%r                 " Options
" set statusline+=%{fugitive#statusline()} " Git Hotness
" set statusline+=\ [%{&ff}/%Y]            " Filetype
" set statusline+=\ [%{getcwd()}]          " Current dir
" set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

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
autocmd vimrc FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Remove trailing whitespaces and ^M chars
autocmd vimrc FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl,sql autocmd BufWritePre <buffer> call StripTrailingWhitespace()
autocmd vimrc FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl,sql autocmd InsertLeave <buffer> call StripTrailingWhitespace()

" }}}

" Keybindings " {{{
" nnoremap ,, ,

"make Y consistent with rest of vim!
nnoremap Y y$

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

" Move around easier
inoremap <C-o>   <Esc>o
inoremap <C-j>       <Down>
inoremap <C-k>       <Up>
cnoremap <C-j>       <Down>
cnoremap <C-k>       <Up>

" Wrapped lines goes down/up to next row, rather than next line in file.
" noremap <silent> j gj
" noremap <silent> k gk

" <num>j or k now marks a jump location
" nnoremap <silent> k :<C-u>execute 'normal!' (v:count > 1 ? "m'".v:count.'k' : 'gk')<Return>
" nnoremap <silent> j :<C-u>execute 'normal!' (v:count > 1 ? "m'".v:count.'j' : 'gj')<Return>

"add new lines above/below current line.
nnoremap <silent> gO O<Esc>
nnoremap <silent> go o<Esc>

"paste in insertmode
" inoremap <C-v> <C-r>+

" Easier moving in tabs and windows
" The lines conflict with the default digraph mapping of <C-K>
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-L> <C-W>l
noremap <C-H> <C-W>h
"nnoremap <BS> <C-W>h<C-W> "C-H bugged in nvim

" Scroll the window next to the current one
"   (especially useful for two-window split)
nnoremap <silent> <leader>j <c-w>w<c-d><c-w>W
nnoremap <silent> <leader>k <c-w>w<c-u><c-w>W

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

" toggle rel num
nnoremap <Leader>n :set rnu!<CR>

"Jump back to last edited buffer
" nnoremap <C-b> <C-^>
" inoremap <C-b> <esc><C-^>

"Will open files in current directory, allows you to leave the working cd in
"the project root. You can also use %% anywhere in the command line to expand.
cnoremap %% <C-R>=expand('%:h').'/'<cr>
nnoremap <leader>ew :e %%
nnoremap <leader>es :sp %%
nnoremap <leader>ev :vsp %%
nnoremap <leader>et :tabe %%

" Change Working Directory to that of the current file
cnoremap cwd lcd %:p:h
cnoremap cd. lcd %:p:h

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" "Focus" the current line.  Basically:
"
" 1. Close all folds.
" 2. Open just the folds containing the current line.
" 3. Move the line to a little bit (15 lines) above the center of the screen.
" 4. Pulse the cursor line.  My eyes are bad.
"
" This mapping wipes out the z mark, which I never use.
"
" I use :sus for the rare times I want to actually background Vim.
nnoremap <Space>z mzzMzvzz15<c-e>`z:Pulse<cr>

" Space to toggle folds.
nnoremap <Space><Space> za
vnoremap <Space><Space> za

" Make zO recursively open whatever fold we're in, even if it's partially open.
nnoremap zO zczO

" split edit vimrc
nnoremap <leader>ev <C-w><C-s><C-l>:e $MYVIMRC<CR>

" Strip whitespaces
nnoremap <leader>sw :call StripTrailingWhitespace()<CR>

" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>

" Adjust viewports to the same size
noremap <Leader>= <C-w>=

" noremap <Leader>ff to display all lines with keyword under cursor
" and ask which one to jump to
nnoremap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Easy formatting
nnoremap <silent> <leader>q gwie

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

let g:indentguides_state = 0
function! IndentGuides() " {{{
    if g:indentguides_state
        let g:indentguides_state = 0
        2match None
    else
        let g:indentguides_state = 1
        execute '2match IndentGuides /\%(\_^\s*\)\@<=\%(\%'.(0*&sw+1).'v\|\%'.(1*&sw+1).'v\|\%'.(2*&sw+1).'v\|\%'.(3*&sw+1).'v\|\%'.(4*&sw+1).'v\|\%'.(5*&sw+1).'v\|\%'.(6*&sw+1).'v\|\%'.(7*&sw+1).'v\)\s/'
    endif
endfunction " }}}
hi def IndentGuides guibg=#303030 ctermbg=236
nnoremap <leader>I :call IndentGuides()<cr>

" }}}
