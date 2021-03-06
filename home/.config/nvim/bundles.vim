" vim: set ft=vim fdm=marker:

set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/

call dein#begin(expand('~/.config/nvim/'))

" Let Dein manage Dein
call dein#add('~/.config/nvim/repos/github.com/Shougo/dein.vim/')

" libs " {{{
" call dein#add('Shougo/vimproc.vim', {)
"             \ 'build' : {
"             \         'windows' : 'tools\\update-dll-mingw',
"             \         'cygwin' : 'make -f make_cygwin.mak',
"             \         'mac' : 'make -f make_mac.mak',
"             \         'linux' : 'make',
"             \         'unix' : 'gmake',
"             \        },
"             \ }
call dein#add('vim-jp/vital.vim')
call dein#add('xolox/vim-misc')
" }}}

" Unite " {{{
call dein#add('Shougo/unite.vim', { 'depends' : [ 'Shougo/vimproc.vim' ] })
call dein#add('Shougo/neomru.vim', { 'depends' : [ 'Shougo/unite.vim' ] })
call dein#add('Shougo/tabpagebuffer.vim', { 'depends' : [ 'Shougo/unite.vim' ] })
call dein#add('Shougo/unite-outline', { 'depends:' : [ 'Shougo/unite.vim' ] })
call dein#add('Shougo/unite-help', { 'depends' : [ 'Shougo/unite.vim' ] })
call dein#add('Shougo/neoyank.vim', { 'depends' : [ 'Shougo/unite.vim' ] })
call dein#add('tsukkee/unite-tag', { 'depends' : [ 'Shougo/unite.vim' ] })
call dein#add('osyo-manga/unite-quickfix', { 'depends' : [ 'Shougo/unite.vim' ] })
call dein#add('Murlocks/unite-everything', { 'depends:' : [ 'Shougo/unite.vim' ] })
call dein#add('Shougo/vimfiler.vim', { 'depends:' : [ 'Shougo/unite.vim' ] })
call dein#add('thinca/vim-editvar')
" }}}

" Completion " {{{
call dein#add('Shougo/deoplete.nvim')
call dein#add('osyo-manga/vim-marching')
call dein#add('Shougo/neco-syntax', { 'depends:' : [ 'Shougo/deoplete' ] })
call dein#add('Shougo/neco-vim', { 'depends:' : [ 'Shougo/deoplete' ] })
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('davidhalter/jedi-vim')
call dein#add('othree/jspc.vim', { 'depends:' : [ 'Shougo/deoplete' ] })
call dein#add('zchee/deoplete-jedi', { 'depends:' : [ 'Shougo/deoplete' ] })
call dein#add('carlitux/deoplete-ternjs', { 'depends:' : [ 'Shougo/deoplete' ] })
" call dein#add('SirVer/ultisnips')
" call dein#add('honza/vim-snippets')
" call dein#add('Valloric/YouCompleteMe')
" call dein#add('rdnetto/YCM-Generator')
" }}}

" Looks " {{{
" Colors
call dein#add('vim-airline/vim-airline-themes')
call dein#add('atweiden/vim-colors-behelit')
call dein#add('crusoexia/vim-monokai')
call dein#add('tomasr/molokai')
call dein#add('chriskempson/base16-vim')
call dein#add('baskerville/bubblegum')
call dein#add('altercation/vim-colors-solarized')
call dein#add('chriskempson/base16-vim')
call dein#add('jonathanfilip/lucius')
call dein#add('junegunn/seoul256.vim')
call dein#add('w0ng/vim-hybrid')
" Interface
" call dein#add('unblevable/quick-scope')
call dein#add('vim-scripts/cSyntaxAfter')
" call dein#add('powerline/powerline', {'rtp': 'powerline/bindings/vim/'})
call dein#add('bling/vim-airline')
call dein#add('bling/vim-bufferline')
" call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('hynek/vim-python-pep8-indent')
call dein#add('rhysd/committia.vim')
" call dein#add('myusuf3/numbers.vim')
call dein#add('LeafCage/foldCC.vim')
" call dein#add('amix/vim-zenroom')
call dein#add('junegunn/goyo.vim')
call dein#add('amix/vim-zenroom2', { 'depends:' : [ 'junegunn/goyo.vim' ] })
" call dein#add('mhinz/vim-signify')
call dein#add('airblade/vim-gitgutter')
" }}}

" General " {{{
" call dein#add('szw/vim-ctrlspace')
call dein#add('Shougo/vimshell.vim', { 'depends:' : [ 'Shougo/vimproc.vim' ] })
call dein#add('mbbill/undotree')
call dein#add('mhinz/vim-sayonara')
call dein#add('airblade/vim-rooter')
call dein#add('scrooloose/syntastic')
call dein#add('Valloric/MatchTagAlways')
call dein#add('tommcdo/vim-exchange')
call dein#add('sheerun/vim-polyglot')
call dein#add('janko-m/vim-test')
call dein#add('metakirby5/codi.vim')
" call dein#add('jiangmiao/auto-pairs' " Doesn't play well with unite's preview window - fixed??)
call dein#add('junegunn/fzf.vim')
call dein#add('osyo-manga/vim-anzu')
" Double cursor issue... nvim
" call dein#add('osyo-manga/vim-over')
call dein#add('haya14busa/incsearch.vim')
call dein#add('haya14busa/incsearch-easymotion.vim', { 'depends:' : [ 'haya14busa/incsearch.vim' ] })
call dein#add('haya14busa/incsearch-fuzzy.vim', { 'depends:' : [ 'haya14busa/incsearch.vim' ] })
call dein#add('haya14busa/vim-asterisk')
" call dein#add('cohama/vim-smartinput-endwise', { 'depends' : [ 'kana/vim-smartinput' ] })
call dein#add('cohama/lexima.vim')
call dein#add('tpope/vim-fugitive', { 'depends:' : [ 'Shougo/unite.vim' ] })
call dein#add('tpope/vim-abolish')
call dein#add('tpope/vim-unimpaired')
call dein#add('tpope/vim-dispatch')
call dein#add('tpope/vim-eunuch')
" call dein#add('tpope/vim-endwise')
call dein#add('tpope/vim-sleuth')
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-surround')
call dein#add('FooSoft/vim-argwrap')
call dein#add('duff/vim-bufonly')
call dein#add('godlygeek/tabular')
call dein#add('plasticboy/vim-markdown', { 'depends:' : [ 'godlygeek/tabular' ] })
call dein#add('vim-pandoc/vim-pandoc')
" call dein#add('yonchu/accelerated-smooth-scroll')
" call dein#add('tpope/vim-commentary')
call dein#add('tyru/caw.vim')
" call dein#add('kristijanhusak/vim-multiple-cursors')
" call dein#add('tomtom/tcomment_vim')
call dein#add('kana/vim-submode')
" call dein#add('kana/vim-repeat')
" call dein#add('kana/vim-smartinput')
" call dein#add('Murlocks/vimux')
call dein#add('jpalardy/vim-slime')
" call dein#add('mattn/emmet-vim')
call dein#add('thinca/vim-quickrun')
call dein#add('thinca/vim-qfreplace')
call dein#add('mileszs/ack.vim')
" call dein#add('AndrewRadev/splitjoin.vim')
call dein#add('justinmk/vim-sneak')
call dein#add('Lokaltog/vim-easymotion')
" call dein#add('rhysd/accelerated-jk')
" call dein#add('takac/vim-hardtime')
" call dein#add('chrisbra/NrrwRgn')
call dein#add('xolox/vim-easytags', { 'depends' : [ 'xolox/vim-misc' ] })
" }}}

" Text object " {{{
" call dein#add('wellle/targets.vim')
call dein#add('kana/vim-textobj-user')
call dein#add('kana/vim-textobj-entire', { 'depends' : 'kana/vim-textobj-user' })
call dein#add('kana/vim-textobj-function', { 'depends' : 'kana/vim-textobj-user' })
call dein#add('kana/vim-textobj-indent', { 'depends' : 'kana/vim-textobj-user' })
call dein#add('rhysd/vim-textobj-ruby', { 'depends' : 'kana/vim-textobj-user' })
call dein#add('osyo-manga/vim-textobj-multiblock', { 'depends' : 'kana/vim-textobj-user' })
call dein#add('osyo-manga/vim-textobj-multitextobj', { 'depends' : 'kana/vim-textobj-user' })
call dein#add('osyo-manga/vim-textobj-blockwise', { 'depends' : 'kana/vim-textobj-user' })
call dein#add('Julian/vim-textobj-variable-segment', { 'depends' : 'kana/vim-textobj-user' })
" call dein#add('sgur/vim-textobj-parameter', { 'depends' : 'kana/vim-textobj-user' })
" call dein#add('thinca/vim-textobj-between', { 'depends' : 'kana/vim-textobj-user' })
" }}}

" Operator " {{{
call dein#add('kana/vim-operator-user')
call dein#add('kana/vim-operator-replace', { 'depends' : 'kana/vim-operator-user' })
" call dein#add('rhysd/vim-operator-surround', { 'depends' : 'kana/vim-operator-user' })
" call dein#add('tyru/operator-html-escape.vim', { 'depends' : 'kana/vim-operator-user' })
call dein#add('osyo-manga/vim-operator-blockwise', { 'depends' : 'kana/vim-operator-user' })
" }}}

" Local Plugins (Arch) " {{{
" NeoBundleLocal /usr/share/vim/vimfiles/plugin
" call dein#add('fzf.vim')
" }}}

" Plugin Config " {{{
" let g:neobundle#install_process_timeout = 1500

if dein#tap('vim-airline') " {{{

    " let g:airline_theme='behelit'
    let g:airline_theme='bubblegum'
    " let g:airline_theme='sol'
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#bufferline#enabled = 0
    " let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#whitespace#enabled = 0
    let g:airline_section_y = {}

    let g:airline_mode_map = {
                \ '__' : '-',
                \ 'n'  : 'N',
                \ 'i'  : 'I',
                \ 'R'  : 'R',
                \ 'c'  : 'C',
                \ 'v'  : 'V',
                \ 'V'  : 'V',
                \ '' : 'V',
                \ 's'  : 'S',
                \ 'S'  : 'S',
                \ '' : 'S',
                \ }

endif " }}}

if dein#tap('vim-bufferline') " {{{

    let g:bufferline_rotate = 1
    let g:bufferline_fixed_index =  1 "always second
    " let g:bufferline_echo = 0
    " autocmd VimEnter *
    "   \ let &statusline='%{bufferline#refresh_status()}'
    "     \ .bufferline#get_status_string()
    " let g:bufferline_rotate = 2

endif " }}}

if dein#tap('vital.vim') " {{{

    " let g:V = vital#of('vital')
    " let g:S = g:V.import("Web.HTTP")
    " let g:L = g:V.import("Data.List")
    "
    " function! DecodeURI(uri) abort
    "     return g:S.decodeURI(a:uri)
    " endfunction
    "
    " function! EncodeURI(uri) abort
    "     return g:S.encodeURI(a:uri)
    " endfunction
    "
    " command -nargs=1 DecodeURI echo DecodeURI(<args>)
    " command -nargs=1 EncodeURI echo EncodeURI(<args>)

endif " }}}

if dein#tap('deoplete-tern') " {{{

    " Use deoplete.
    let g:tern_request_timeout = 1

    "Add extra filetypes
    let g:tern#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx'
                \]

endif " }}}

if dein#tap('deoplete.nvim') " {{{

    let g:deoplete#enable_at_startup = 1

    let g:deoplete#omni#functions = {}
    let g:deoplete#omni#functions.javascript = [
                \ 'tern#Complete',
                \ 'jspc#omni'
                \]
    let g:deoplete#omni#functions.python = [
                \ 'jedi'
                \]


    autocmd vimrc CursorMovedI *.py,*.js if pumvisible() == 0|silent! pclose|endif
    autocmd vimrc InsertLeave *.py,*.js if pumvisible() == 0|silent! pclose|endif

    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
                \ deoplete#mappings#close_popup() .
                \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

    function! s:check_back_space() abort "{{{
        let col = col('.') - 1
        return !col || getline('.')[col - 1]    =~ '\s'
    endfunction"}}}

    inoremap <S-Tab> <C-p>
    inoremap <expr> <Tab> CleverTab()
    function! CleverTab() abort
        if <SID>check_back_space()
            " nothing to match on empty string
            return "\<Tab>"
        else
            " existing text matching
            if neosnippet#jumpable()
                return deoplete#mappings#close_popup() . "\<Plug>(neosnippet_expand_or_jump)"
            elseif pumvisible()
                return "\<C-n>"
            else
                return deoplete#mappings#manual_complete()
            endif
        endif
    endfunction

    imap <silent><expr><C-l> neosnippet#expandable() ?
                \ "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ?
                \ deoplete#mappings#close_popup() : "\<Plug>(neosnippet_expand_or_jump)")


endif " }}}

if dein#tap('neosnippet') " {{{

    call dein#config({
                \     'autoload' : {
                \         'unite_sources' : [ 'neosnippet', 'neosnippet/user', 'neosnippet/runtime' ]
                \     }
                \ })

    autocmd InsertLeave * NeoSnippetClearMarkers

    " smap <silent>L         <Plug>(neosnippet_jump_or_expand)
    " xmap <silent>L         <Plug>(neosnippet_start_unite_snippet_target)
    " imap <silent>K         <Plug>(neosnippet_expand_or_jump)
    " smap <silent>K         <Plug>(neosnippet_expand_or_jump)
    " imap <silent>G         <Plug>(neosnippet_expand)
    " imap <silent>S         <Plug>(neosnippet_start_unite_snippet)
    " xmap <silent>o         <Plug>(neosnippet_register_oneshot_snippet)
    " xmap <silent>U         <Plug>(neosnippet_expand_target)
    "
    " imap <expr><silent>L         neocomplete#mappings#close_popup() .
    "             \ "\<Plug>(neosnippet_jump_or_expand)"

    " let g:neosnippet#enable_snipmate_compatibility = 1

    " let g:snippets_dir = '~/.vim/snippets/,~/.vim/bundle/snipmate/snippets/'
    let g:neosnippet#snippets_directory = '~/.vim/snippets'

endif " }}}

if dein#tap('YouCompleteMe') " {{{

    let g:ycm_confirm_extra_conf        = 0
    let g:ycm_global_ycm_extra_conf = '~/.vim/ycm.py'
    let g:ycm_extra_conf_vim_data     = ['&filetype']
    let g:ycm_autoclose_preview_window_after_insertion = 1

endif " }}}

if dein#tap('ultisnips') " {{{

    " let g:UltiSnipsExpandTrigger="<C-l>"
    let g:UltiSnipsJumpForwardTrigger = "<c-j>"
    let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

endif " }}}

if dein#tap('unite.vim') " {{{

    " call neobundle#config({
    "             \     'autoload' : {
    "             \         'commands' : [
    "             \             {
    "             \                 'name' : 'Unite',
    "             \                 'complete' : 'customlist,unite#complete_source'
    "             \             },
    "             \             'UniteWithCursorWord',
    "             \             'UniteWithInput'
    "             \         ]
    "             \     }
    "             \ })
    "
    " Use The Silver/Platinum Searcher
    if executable('pt')
        let g:unite_source_rec_async_command = ['pt', '--follow', '--nocolor', '--nogroup', '--hidden',
                    \'--ignore', '.hg', '--ignore', '.svn', '--ignore', '.git', '--ignore', '.bzr',
                    \'--ignore', '**/*.pyc', '-g', '']
        let g:unite_source_grep_command = 'pt'
        let g:unite_source_grep_default_opts = '--nogroup --nocolor'
        let g:unite_source_grep_recursive_opt = ''
        let g:unite_source_grep_encoding = 'utf-8'
    elseif executable('ag')
        let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup', '--hidden',
                    \'--ignore', '.hg', '--ignore', '.svn', '--ignore', '.git', '--ignore', '.bzr',
                    \'--ignore', '**/*.pyc', '-g', '']
        let g:unite_source_grep_command = 'ag'
        let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
        let g:unite_source_grep_recursive_opt = ''
    endif

    function! s:unite_menu_map_func(key, value) abort
        let [word, value] = a:value
        if isdirectory(value)
            return {
                        \     'word' : '[directory] ' . word,
                        \     'kind' : 'directory',
                        \     'action__directory' : value
                        \ }
        elseif !empty(glob(value))
            return {
                        \     'word' : '[file] ' . word,
                        \     'kind' : 'file',
                        \     'default_action' : 'tabdrop',
                        \     'action__path' : value,
                        \ }
        else
            return {
                        \     'word' : '[command] ' . word,
                        \     'kind' : 'command',
                        \     'action__command' : value
                        \ }
        endif
    endfunction

    " General
    let g:unite_source_history_yank_enable = 1
    let g:unite_force_overwrite_statusline = 0
    let g:unite_kind_jump_list_after_jump_scroll=0
    let g:unite_enable_start_insert = 0
    let g:unite_source_rec_min_cache_files = 1000
    let g:unite_source_rec_max_cache_files = 5000
    let g:unite_source_file_mru_long_limit = 100000
    let g:unite_source_file_mru_limit = 100000
    let g:unite_source_directory_mru_long_limit = 100000
    let g:unite_prompt = '❯ '

    " Use buffer name instead of file path for buffer / buffer_tab source
    let s:filter = { 'name' : 'converter_buffer_word' }

    function! s:filter.filter(candidates, context) abort
        for candidate in a:candidates
            let candidate.word = bufname(candidate.action__buffer_nr)
            if candidate.word == ''
                let candidate.word = 'No Name'
            end
        endfor
        return a:candidates
    endfunction

    call unite#define_filter(s:filter)
    unlet s:filter
    call unite#custom_source('buffer', 'converters', 'converter_buffer_word')
    call unite#custom_source('buffer_tab', 'converters', 'converter_buffer_word')

    " Unite-menu
    let g:unite_source_menu_menus = get(g:, 'unite_source_menu_menus', {})
    let g:unite_source_menu_menus.global = { 'description' : 'global shortcut' }
    let g:unite_source_menu_menus.unite = { 'description' : 'unite shortcut' }
    let g:unite_source_menu_menus.global.map = function('s:unite_menu_map_func')
    let g:unite_source_menu_menus.unite.map = function('s:unite_menu_map_func')
    let g:unite_source_menu_menus.global.candidates = [
                \     [ 'vimrc' , $MYVIMRC ],
                \     [ 'vimrc.bundles' , '~/.config/nvim/bundles.vim' ],
                \     [ 'vimfiler' ,    ':VimFiler -no-safe' ],
                \     [ 'vimshell' ,    ':VimShellCurrentDir' ],
                \     [ 'git' ,    ':Unite -start-insert -buffer-name=menu menu:git' ],
                \     [ 'other', ":call Unite_filetype_menu('-start-insert')" ],
                \ ]
    let g:unite_source_menu_menus.unite.candidates = []
    let g:unite_source_menu_filetype_candidates = {}
    let g:unite_source_menu_filetype_candidates._ = [
                \     [ 'neobundle/update' , ':Unite neobundle/update -log' ],
                \     [ 'neobundle/install' , ':Unite neobundle/install -log' ],
                \     [ 'files', ':Unite -start-insert -buffer-name=files buffer_tab file file_mru'],
                \     [ 'function', ':Unite -start-insert -default-action=edit function'],
                \     [ 'variable', ':Unite -start-insert -default-action=edit variable'],
                \     [ 'outline', ':Unite -start-insert outline'],
                \     [ 'help', ':Unite -start-insert help'],
                \     [ 'buffer', ':Unite -start-insert buffer'],
                \     [ 'line', ':Unite -start-insert -auto-preview -buffer-name=search line'],
                \     [ 'grep', ':Unite grep -max-multi-lines=1 -truncate -default-action=tabopen -buffer-name=unite_grep'],
                \     [ 'source', ':Unite -start-insert source'],
                \     [ 'locate', ':Unite -start-insert locate'],
                \     [ 'theme', ':Unite -auto-preview colorscheme'],
                \     [ 'resume grep', ':UniteResume unite_grep'],
                \ ]
    let g:unite_source_menu_menus.git = {
                \ 'description' : 'git menu',
                \}
    let g:unite_source_menu_menus.git.command_candidates = [
                \['▷ tig                                                        ⌘ ,gt',
                \'normal ,gt'],
                \['▷ git status       (Fugitive)                                ⌘ ,gs',
                \'Gstatus'],
                \['▷ git diff         (Fugitive)                                ⌘ ,gd',
                \'Gdiff'],
                \['▷ git commit       (Fugitive)                                ⌘ ,gc',
                \'Gcommit'],
                \['▷ git log          (Fugitive)                                ⌘ ,gl',
                \'exe "silent Glog | Unite quickfix"'],
                \['▷ git blame        (Fugitive)                                ⌘ ,gb',
                \'Gblame'],
                \['▷ git stage        (Fugitive)                                ⌘ ,gw',
                \'Gwrite'],
                \['▷ git checkout     (Fugitive)                                ⌘ ,go',
                \'Gread'],
                \['▷ git rm           (Fugitive)                                ⌘ ,gr',
                \'Gremove'],
                \['▷ git mv           (Fugitive)                                ⌘ ,gm',
                \'exe "Gmove " input("destino: ")'],
                \['▷ git push         (Fugitive)                                ⌘ ,gp',
                \'Git! push'],
                \['▷ git pull         (Fugitive)                                ⌘ ,gP',
                \'Git! pull'],
                \['▷ git prompt       (Fugitive)                                ⌘ ,gi',
                \'exe "Git! " input("git command: ")'],
                \['▷ git cd           (Fugitive)',
                \'Gcd'],
                \]

    let g:unite_source_rec_max_cache_files = 0

    call unite#custom#source('file_rec,file_rec/async',
                \ 'max_candidates', 100)

    call unite#custom#source(
                \ 'file_rec,file_rec/async', 'required_pattern_length',
                \ 1)

    call unite#custom#source('menu,outline,variable', 'matchers', ['matcher_fuzzy'])
    call unite#custom#source('file,file_mru,file_rec,file_rec/async,buffer_tab', 'matchers', ['converter_relative_word', 'matcher_fuzzy'])
    call unite#custom#source('file,file_mru,file_rec,file_rec/async', 'converters', ['converter_file_directory'])
    call unite#custom#source('menu,outline,variable,file,file_mru,file_rec,file_rec/async,buffer_tab', 'sorters', ['sorter_selecta'])

    " Like ctrlp.vim settings.
    call unite#custom#profile('default', 'context', {
                \     'winheight': 10,
                \     'direction': 'botright',
                \ })

    nnoremap <silent> <CR>         :<C-u>Unite -start-insert -buffer-name=menu menu:global<CR>
    " nnoremap <silent> <Space>b     :<C-u>Unite -start-insert -quick-match buffer_tab<CR>
    nnoremap <silent> <Space>a     :<C-u>Unite -start-insert -auto-preview -buffer-name=anzu anzu<CR>
    nnoremap <silent> <Space>s     :<C-u>Unite -start-insert -auto-preview -buffer-name=search line<CR>
    nnoremap <silent> <Space>f     :<C-u>UniteWithCursorWord  -auto-preview -start-insert -buffer-name=search line<CR>
    nnoremap <silent> <Space>g     :<C-u>Unite grep -max-multi-lines=1 -truncate -default-action=tabopen -buffer-name=unite_grep<CR>
    nnoremap <silent> <Space><C-g> :<C-u>Unite -start-insert -buffer-name=menu menu:git<CR>
    nnoremap <silent> <Space>p     :<C-u>Unite -start-insert -buffer-name=files buffer_tab file_rec/async:! file_mru<CR>
    nnoremap <silent> <Space>d     :<C-u>UniteWithBufferDir -wipe -start-insert -buffer-name=files file file/new directory/new<CR>
    " nnoremap <silent> <C-e>      :<C-u>Unite -start-insert -buffer-name=everything everything<CR>
    nnoremap <silent> <Space>y     :<C-u>Unite -buffer-name=yank history/yank<CR>
    nnoremap <silent> <Space>l     :lcl<CR>:<C-u>Unite -buffer-name=locations -auto-preview location_list<CR>
    nnoremap <silent> <Space>r     :<C-u>Unite resume<CR>

    nnoremap <silent> <Space>m :<C-u>call Unite_filetype_menu('-buffer-name=menu -start-insert')<CR>
    function! Unite_filetype_menu(options) abort
        let filetypes = split(&ft, '\.')
        let candidate_sets = map(
                    \     add(filter(filetypes, 'has_key(g:unite_source_menu_filetype_candidates, v:val)'), '_'),
                    \     'g:unite_source_menu_filetype_candidates[v:val]'
                    \ )
        let candidates = g:L.flatten(candidate_sets, 1)
        let g:unite_source_menu_menus.unite.candidates = candidates
        execute ':Unite menu:unite ' . a:options
    endfunction

    if dein#is_sourced('unite-quickfix')
        nnoremap <silent> <Space>q    :<C-u>Unite  -auto-preview quickfix<CR>
    endif
    if dein#is_sourced('unite-outline')
        nnoremap <silent> <Space>o   :<C-u>Unite -start-insert -buffer-name=outline outline<CR>
    endif
    if dein#is_sourced('unite-help')
        nnoremap <silent> <Space>h    :<C-u>Unite -start-insert help<CR>
    endif

    function! s:unite_my_settings() abort " {{{
        " Directory partial match.
        call unite#custom#alias('file', 'h', 'left')
        call unite#custom#default_action('directory', 'narrow')

        call unite#custom#default_action('versions/git/status', 'commit')

        " Overwrite settings.
        nmap <buffer> q          <Plug>(unite_all_exit)
        nmap <buffer> <ESC>      <Plug>(unite_all_exit)
        nmap <buffer> <c-c>      <Plug>(unite_all_exit)
        " imap <buffer> <BS>       <Plug>(unite_delete_backward_path)
        imap <buffer> jk         <Plug>(unite_insert_leave)
        " imap <buffer> <Tab>      <Plug>(unite_complete)
        imap <buffer> '          <Plug>(unite_quick_match_default_action)
        nmap <buffer> '          <Plug>(unite_quick_match_default_action)
        nmap <buffer> <C-t>      <Plug>(unite_toggle_transpose_window)
        imap <buffer> <C-t>      <Plug>(unite_toggle_transpose_window)
        imap <buffer> <C-w>      <Plug>(unite_delete_backward_path)
        imap <buffer> <C-h>      <Plug>(unite_delete_backward_path)
        nmap <buffer> <C-h>      <Plug>(unite_delete_backward_path)
        nmap <buffer> h          <Plug>(unite_delete_backward_path)
        imap <buffer> <CR>       <Plug>(unite_do_default_action)
        imap <buffer> <C-l>      <Plug>(unite_do_default_action)
        nmap <buffer> <C-l>      <Plug>(unite_do_default_action)
        nmap <buffer> <C-o>      <Plug>(unite_toggle_auto_preview)
        imap <buffer> <C-o>      <Plug>(unite_toggle_auto_preview)
        imap <buffer> <C-f>      <Plug>(unite_do_vimfiler_action)
        nmap <buffer> o          <Plug>(unite_insert_enter)
        nnoremap <buffer> <C-k>  <Up>
        nnoremap <buffer> <C-j>  <Down>
        nnoremap <buffer> i      Gi
        " nnoremap <silent><buffer> <Tab>     <C-w>w
        nnoremap <silent><buffer><expr> l
                    \ unite#smart_map('l', unite#do_action('default'))
        nnoremap <silent><buffer><expr> P
                    \ unite#smart_map('P', unite#do_action('insert'))
        nnoremap <silent><buffer><expr> f
                    \ unite#smart_map('f', unite#do_action('vimfiler'))
        inoremap <silent><buffer><expr> <C-f>
                    \ unite#smart_map('<C-f>', unite#do_action('vimfiler'))

        let unite = unite#get_current_unite()
        if unite.profile_name ==# '^search'
            nnoremap <silent><buffer><expr> r     unite#do_action('replace')
        else
            nnoremap <silent><buffer><expr> r     unite#do_action('rename')
        endif

        nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')
        nnoremap <silent><buffer><expr> !     unite#do_action('start')
        nnoremap <buffer><expr> S
                    \ unite#mappings#set_current_sorters(
                    \  empty(unite#mappings#get_current_sorters()) ?
                    \   ['sorter_reverse'] : [])
        nnoremap <buffer><expr> tf
                    \ unite#mappings#set_current_matchers(
                    \ empty(unite#mappings#get_current_matchers()) ?
                    \ ['matcher_fuzzy'] : [])
    endfunction " }}}

    autocmd vimrc FileType unite call s:unite_my_settings()
    augroup commandlinewindow
        autocmd!
        autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>
    augroup END

endif " }}}

if dein#tap('vimfiler') " {{{

    let g:vimfiler_as_default_explorer = 1

endif " }}}

if dein#tap('vim-textobj-multiblock') " {{{

    let g:textobj_multiblock_blocks = [
                \     ['(', ')', 1],
                \     ['[', ']', 1],
                \     ['{', '}', 1],
                \     ['<', '>', 1],
                \     ['"', '"', 1],
                \     ["'", "'", 1],
                \     ['`', '`', 1],
                \     ['|', '|', 1],
                \ ]
    let g:textobj_multiblock_search_limit = 20

    omap ab <Plug>(textobj-multiblock-a)
    omap ib <Plug>(textobj-multiblock-i)
    vmap ab <Plug>(textobj-multiblock-a)
    vmap ib <Plug>(textobj-multiblock-i)

endif " }}}

if dein#tap('vim-textobj-blockwise') " {{{

    vmap <expr> iw mode() == "\<C-v>" ? textobj#blockwise#mapexpr('iw') : 'iw'
    vmap <expr> iW mode() == "\<C-v>" ? textobj#blockwise#mapexpr('iW') : 'iW'

endif " }}}

if dein#tap('vim-operator-blockwise') " {{{

    nmap YY <Plug>(operator-blockwise-yank)
    nmap DD <Plug>(operator-blockwise-delete)
    nmap CC <Plug>(operator-blockwise-change)
    nmap <expr> SS operator#blockwise#mapexpr("\<Plug>(operator-replace)")

endif " }}}

if dein#tap('vim-textobj-multitextobj') " {{{

    let g:textobj_multitextobj_textobjects_i = [
                \     "i(",
                \     "i[",
                \     "\<Plug>(textobj-function-i)",
                \     "\<Plug>(textobj-indent-i)",
                \]

    omap amt <Plug>(textobj-multitextobj-a)
    omap imt <Plug>(textobj-multitextobj-i)
    vmap amt <Plug>(textobj-multitextobj-a)
    vmap imt <Plug>(textobj-multitextobj-i)

endif " }}}

if dein#tap('vim-textobj-between') " {{{

    let g:textobj_between_no_default_key_mappings = 1
    map ix <Plug>(textobj-between-i)
    map ax <Plug>(textobj-between-a)

endif " }}}

if dein#tap('vim-operator-replace') " {{{

    map R <Plug>(operator-replace)

endif " }}}

if dein#tap('vim-operator-surround') " {{{

    map <silent>sa <Plug>(operator-surround-append)
    map <silent>sd <Plug>(operator-surround-delete)
    map <silent>sr <Plug>(operator-surround-replace)

    nmap <silent>sdd <Plug>(operator-surround-delete)<Plug>(textobj-multiblock-a)
    nmap <silent>srr <Plug>(operator-surround-replace)<Plug>(textobj-multiblock-a)

endif " }}}

if dein#tap('vim-submode') " {{{

    let g:submode_keep_leaving_key = 1
    " tab moving
    call submode#enter_with('changetab', 'n', '', 'gt', 'gt')
    call submode#enter_with('changetab', 'n', '', 'gT', 'gT')
    call submode#map('changetab', 'n', '', 't', 'gt')
    call submode#map('changetab', 'n', '', 'T', 'gT')
    " undo/redo
    " call submode#enter_with('undo/redo', 'n', '', '<C-r>', '<C-r>')
    " call submode#enter_with('undo/redo', 'n', '', 'u', 'u')
    " call submode#map('undo/redo', 'n', '', '<C-r>', '<C-r>')
    " call submode#map('undo/redo', 'n', '', 'u', 'u')
    " move between fold
    call submode#enter_with('movefold', 'n', '', 'zj', 'zjzMzvzz')
    call submode#enter_with('movefold', 'n', '', 'zk', 'zkzMzv[zzz')
    call submode#map('movefold', 'n', '', 'j', 'zjzMzvzz')
    call submode#map('movefold', 'n', '', 'k', 'zkzMzv[zzz')
    " resize window
    call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
    call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
    call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>+')
    call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>-')
    call submode#map('winsize', 'n', '', '>', '<C-w>>')
    call submode#map('winsize', 'n', '', '<', '<C-w><')
    call submode#map('winsize', 'n', '', '+', '<C-w>+')
    call submode#map('winsize', 'n', '', '-', '<C-w>-')
    " TODO: Repeat last executed macro. umaku dekinai...
    " call submode#enter_with('macro/a', 'n', '', '@a', '@a')
    " call submode#map('macro/a', 'n', '', 'a', '@a')

endif " }}}

if dein#tap('vimux') " {{{

    nmap <Leader>rb :call VimuxRunCommand("clear; rspec " . bufname("%"))<CR>
    nmap <Leader>vp :VimuxPromptCommand<CR>
    nmap <Leader>vl :VimuxRunLastCommand<CR>
    nmap <Leader>vi :VimuxInspectRunner<CR>
    nmap <Leader>vq :VimuxCloseRunner<CR>
    nmap <Leader>vx :VimuxInterruptRunner<CR>
    nmap <Leader>vz :call VimuxZoomRunner()<CR>
    nmap <Leader>vc :call VimuxRunCommand('clear')<CR>

endif " }}}

if dein#tap('emmet-vim') " {{{

    function! s:zen_html_tab() abort
        let line = getline('.')
        if match(line, '<.*>') < 0
            return "\<c-y>,"
        endif
        return "\<c-y>n"
    endfunction
    " let g:user_emmet_leader_key = <Leader>y
    autocmd FileType xml,xsl,xslt,xsd,css,sass,scss,less,mustache imap <buffer><tab> <c-y>,
    autocmd FileType html imap <buffer><expr><tab> <sid>zen_html_tab()

endif " }}}

if dein#tap('vim-easymotion') " {{{

    function! Post_source_easymotion() abort
        hi EasyMotionTarget ctermfg=79 ctermbg=235
        hi EasyMotionTarget2First ctermfg=79 ctermbg=235
        hi EasyMotionTarget2Second ctermfg=79 ctermbg=235
        hi link EasyMotionShade    Comment
    endfunction
    call dein#config({ 'hook_post_source': function('Post_source_easymotion') })

    let g:EasyMotion_skipfoldedline = 0

    " keep cursor column when JK motion
    let g:EasyMotion_startofline = 0

    map <Space> <Plug>(easymotion-prefix)
    map <Space><Space> <Plug>(easymotion-s)
    map <Space>/ <Plug>(easymotion-sn)
    omap <Space>/ <Plug>(easymotion-tn)
    " map t <Plug>(easymotion-t)
    " omap / <Plug>(easymotion-tn)
    "map    n <Plug>(easymotion-next)
    "map    N <Plug>(easymotion-prev)
    " map w    <Plug>(easymotion-bd-w)
    " map f    <Plug>(easymotion-bd-f)
    " map <Space> <Plug>(easymotion-jumptoanywhere)

endif " }}}

if dein#tap('vim-sneak') " {{{

    hi link Sneak IncSearch
    hi link SneakScope Comment

    "default is ,
    nmap ,, <Plug>SneakPrevious
    nmap : <Plug>SneakNext

    "fix S
    nmap S <Plug>Sneak_S
    xmap S <Plug>Sneak_S

    "enable clever-s behavior
    let g:sneak#s_next = 1

    "replace 'f' with 1-char Sneak
    nmap f <Plug>Sneak_f
    nmap F <Plug>Sneak_F
    xmap f <Plug>Sneak_f
    xmap F <Plug>Sneak_F
    omap f <Plug>Sneak_f
    omap F <Plug>Sneak_F
    "replace 't' with 1-char Sneak
    nmap t <Plug>Sneak_t
    nmap T <Plug>Sneak_T
    xmap t <Plug>Sneak_t
    xmap T <Plug>Sneak_T
    omap t <Plug>Sneak_t
    omap T <Plug>Sneak_T

endif " }}}

if dein#tap('vim-multiple-cursors') " {{{

    let g:multi_cursor_use_default_mapping=0
    let g:multi_cursor_next_key='<C-n>'
    let g:multi_cursor_prev_key='<C-p>'
    let g:multi_cursor_skip_key='<C-x>'

    inoremap jk <esc>
    let g:multi_cursor_exit_from_insert_mode=0
    let g:multi_cursor_quit_key='q'
    let g:multi_cursor_insert_maps={'j':1}

    if dein#is_sourced('neocomplete')
        " Called once right before you start selecting multiple cursors
        function! Multiple_cursors_before() abort
            if exists(':NeoCompleteLock')==2
                exe 'NeoCompleteLock'
            endif
        endfunction

        " Called once only when the multiple selection is canceled (default <Esc>)
        function! Multiple_cursors_after() abort
            if exists(':NeoCompleteUnlock')==2
                exe 'NeoCompleteUnlock'
            endif
        endfunction
    endif

endif " }}}

if dein#tap('accelerated-jk') " {{{

    nmap j <Plug>(accelerated_jk_gj)
    nmap k <Plug>(accelerated_jk_gk)

endif " }}}

if dein#tap('undotree') " {{{

    let g:undotree_WindowLayout = 2
    nnoremap <Leader>u :UndotreeToggle<CR>

endif " }}}

if dein#tap('vim-smartinput') " {{{

    call dein#config({
                \     'autoload' : {
                \         'insert' : 1
                \     }
                \ })

    " function! dein#tapped.hooks.on_source(bundle)
        call smartinput#clear_rules()
        call smartinput#define_default_rules()
    " endfunction

    " function! dein#tapped.hooks.on_post_source(bundle)
        call smartinput_endwise#define_default_rules()
    " endfunction

endif " }}}

if dein#tap('vim-smartinput-endwise') " {{{

    " function! dein#tapped.hooks.on_post_source(bundle)
        " neosnippet and neocomplete compatible
        call smartinput#map_to_trigger('i', '<Plug>(my_cr)', '<Enter>', '<Enter>')
    " endfunction

endif " }}}

if dein#tap('vim-easytags') " {{{

    let g:easytags_dynamic_files = 1
    let g:easytags_include_members = 1
    let g:easytags_async = 1
    let g:easytags_auto_highlight = 0

endif " }}}

if dein#tap('vim-marching') " {{{

    let g:marching_enable_neocomplete = 1

endif " }}}

if dein#tap('syntastic') " {{{

    " let g:syntastic_python_python_exec = '/bin/python2.7'
    let g:syntastic_python_flake8_args='--ignore=E501,E221'
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 0
    let g:syntastic_auto_jump = 2
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 1
    let g:syntastic_java_javac_config_file_enabled = 1
    let g:syntastic_cpp_check_header = 1
    let g:syntastic_cpp_compiler = 'g++'
    let g:syntastic_cpp_compiler_options = ' -std=c++11'

    let g:syntastic_javascript_checkers = ['eslint']

    nnoremap <Leader>_ :SyntasticToggleMode<CR>
    " nnoremap <Leader>s :SyntasticCheck<CR>

endif " }}}

if dein#tap('vim-rooter') " {{{

    let g:rooter_disable_map = 1
    " let g:rooter_manual_only = 1
    " autocmd BufEnter * :Rooter
    " autocmd BufEnter * :SyntasticCheck

endif " }}}

if dein#tap('vim-unimpaired') " {{{

    " currently bugged: :move command closes tabs when set to foldmarker
    " Bubble single lines - uses unimpaired plugin actions
    " nnoremap <M-k> [e
    " nnoremap <M-j> ]e
    " Bubble multiple lines
    " xnoremap <M-k> [egv
    " xnoremap <M-j> ]egv

endif " }}}

if dein#tap('tabular') " {{{

    nmap <Leader>a& :Tabularize /&<CR>
    vmap <Leader>a& :Tabularize /&<CR>
    nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
    vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
    nmap <Leader>a=> :Tabularize /=><CR>
    vmap <Leader>a=> :Tabularize /=><CR>
    nmap <Leader>a: :Tabularize /:<CR>
    vmap <Leader>a: :Tabularize /:<CR>
    nmap <Leader>a:: :Tabularize /:\zs<CR>
    vmap <Leader>a:: :Tabularize /:\zs<CR>
    nmap <Leader>a, :Tabularize /,<CR>
    vmap <Leader>a, :Tabularize /,<CR>
    nmap <Leader>a,, :Tabularize /,\zs<CR>
    vmap <Leader>a,, :Tabularize /,\zs<CR>
    nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
    vmap <Leader>a<Bar> :Tabularize /<Bar><CR>

endif " }}}

if dein#tap('vim-editvar') " {{{

    call dein#config({
                \     'autoload' : {
                \         'commands' : [ 'Editvar' ],
                \         'unite_sources' : [ 'variable' ]
                \     }
                \ })

endif " }}}

if dein#tap('unite-tag') " {{{

    call dein#config({
                \     'autoload' : {
                \         'unite_sources' : [ 'tag' ]
                \     }
                \ })

endif " }}}

if dein#tap('unite-help') " {{{

    call dein#config({
                \     'autoload' : {
                \         'unite_sources' : [ 'help' ]
                \     }
                \ })

endif " }}}

if dein#tap('neoyank.vim') " {{{

    call dein#config({
                \     'autoload' : {
                \         'unite_sources' : [ 'history/yank' ]
                \     }
                \ })

endif " }}}

if dein#tap('foldCC.vim') " {{{

    set foldmethod=marker
    set foldtext=FoldCCtext()
    set foldcolumn=0
    set fillchars=vert:\|

endif " }}}

if dein#tap('numbers.vim') " {{{

    let g:numbers_exclude = ['unite', 'goyo', 'undotree', 'vimshell']

endif " }}}

if dein#tap('goyo.vim') " {{{

    function! s:goyo_enter() abort
        augroup linenumbers
            autocmd InsertLeave * :set norelativenumber
        augroup END
        let b:quitting = 0
        let b:quitting_bang = 0
        set noshowmode
        set noshowcmd
        set nocursorline
        set fdm=manual
        " exec NumbersToggle()
        " exec GitGutterDisable()
        set nonumber
        set norelativenumber
        set scrolloff=999
        let g:neocomplete#disable_auto_complete = 1
        autocmd QuitPre <buffer> let b:quitting = 1
        cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
    endfunction

    function! s:goyo_leave() abort
        augroup linenumbers
            autocmd!
        augroup END
        set showmode
        " set showcmd
        set cursorline
        set scrolloff=10
        set fdm=marker
        " exec GitGutterEnable()
        " set number
        let g:neocomplete#disable_auto_complete = 0
        highlight clear SignColumn
        highlight clear LineNr
        highlight clear GitGutterChangeDefault
        highlight clear GitGutterAddDefault
        highlight clear GitGutterDeleteDefault
        " Quit Vim if this is the only remaining buffer
        if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
            if b:quitting_bang
                qa!
            else
                qa
            endif
        endif
    endfunction

    autocmd User GoyoEnter call <SID>goyo_enter()
    autocmd User GoyoLeave call <SID>goyo_leave()

    nnoremap <silent> <leader>z :Goyo<cr>

    " nnoremap <silent> <leader>z :call <SID>goyoWrapper()<cr>
    " function s:goyoWrapper()
    "
    "     if !exists('#linenumbers#BufEnter')
    "             augroup linenumbers
    "                 autocmd!
    "                 autocmd BufEnter *        :set relativenumber
    "                 autocmd BufLeave *        :set number norelativenumber
    "                 autocmd WinEnter *        :set relativenumber
    "                 autocmd WinLeave *        :set number norelativenumber
    "                 autocmd InsertEnter * :set number norelativenumber
    "                 autocmd InsertLeave * :set relativenumber
    "                 autocmd FocusLost *     :set number norelativenumber
    "                 autocmd FocusGained * :set relativenumber
    "             augroup END
    "     else
    "             augroup linenumbers
    "                 autocmd!
    "             augroup END
    "     endif
    "
    "     exec "Goyo"
    "     highlight clear SignColumn
    "     highlight clear LineNr
    " endfunction

endif " }}}

if dein#tap('caw.vim') " {{{

    let g:caw_operator_keymappings = 1
    nmap <Leader>c gcc
    vmap <Leader>c gcc

endif " }}}

if dein#tap('vim-ctrlspace') " {{{

    " function! dein#tapped.hooks.on_source(bundle)

    if executable("ag")
        let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
    endif

    " endfunction

    nnoremap <silent><C-p> :CtrlSpace O<CR>

endif " }}}

if dein#tap('vim-over') " {{{

    nnoremap <Leader>s :OverCommandLine<CR>

endif " }}}

if dein#tap('lexima.vim') " {{{

    function! Post_source_lexima() abort
        imap <expr> <cr> pumvisible() ? CleverCr() : lexima#expand('<lt>CR>', 'i')
    endfunction
    
    call dein#config({ 'hook_post_source': function('Post_source_lexima') })

    let g:lexima_enable_endwise_rules = 1
    let g:lexima_map_escape = 'jk'

endif " }}}

if dein#tap('auto-pairs') " {{{

    " let g:AutoPairsFlyMode = 1
    let g:AutoPairsMapBS = 0
    inoremap <buffer> <silent> <BS> <C-R>=AutoPairsDelete()<CR>

endif " }}}

if dein#tap('vim-argwrap') " {{{

    nnoremap <Leader>l :ArgWrap<CR>

endif " }}}

if dein#tap('numbers.vim') " {{{

    " exec ":NumbersOnOff<CR>"
    " exec ":NumbersToggle<CR>"
    nnoremap <Leader>n :NumbersOnOff<CR>:NumbersToggle<CR>

endif " }}}

if dein#tap('tommcdo/vim-exchange') " {{{

    "   function! dein#hooks.on_post_source(bundle)
    "     " need to remap these after init
    "     nnoremap L dd
    "     nnoremap H ^
    " endfunction

endif " }}}

if dein#tap('ack.vim') " {{{

    if executable('ag')
        let g:ackprg = 'ag --vimgrep'
    endif

endif " }}}

if dein#tap('incsearch.vim') " {{{

    set hlsearch
    let g:incsearch#auto_nohlsearch = 1
    map /  <Plug>(incsearch-forward)
    map ?  <Plug>(incsearch-backward)
    map g/ <Plug>(incsearch-stay)
    map n  <Plug>(incsearch-nohl-n)
    map N  <Plug>(incsearch-nohl-N)
    map *  <Plug>(incsearch-nohl-*)
    map #  <Plug>(incsearch-nohl-#)
    map g* <Plug>(incsearch-nohl-g*)
    map g# <Plug>(incsearch-nohl-g#)

    map z/ <Plug>(incsearch-easymotion-/)
    map z? <Plug>(incsearch-easymotion-?)
    map zg/ <Plug>(incsearch-easymotion-stay)

    function! s:config_easyfuzzymotion(...) abort
        return extend(copy({
                    \   'converters': [incsearch#config#fuzzy#converter()],
                    \   'modules': [incsearch#config#easymotion#module()],
                    \   'keymap': {"\<CR>": '<Over>(easymotion)'},
                    \   'is_expr': 0,
                    \   'is_stay': 1
                    \ }), get(a:, 1, {}))
    endfunction

    noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())

endif " }}}

if dein#tap('vim-fugitive') " {{{

    nnoremap <silent> <leader>gs :Gstatus<CR>
    nnoremap <silent> <leader>gd :Gdiff<CR>
    nnoremap <silent> <leader>gc :Gcommit<CR>
    nnoremap <silent> <leader>gl :Glog \| Unite quickfix<CR><CR>
    nnoremap <silent> <leader>gb :Gblame<CR>
    nnoremap <silent> <leader>gw :Gwrite<CR>
    nnoremap <silent> <leader>go :Gread<CR>
    nnoremap <silent> <leader>gr :Gremove<CR>
    nnoremap <silent> <leader>gm :exe "Gmove " input("destination: ")<CR>
    nnoremap <silent> <leader>gp :Git! push<CR>
    nnoremap <silent> <leader>gP :Git! pull<CR>
    nnoremap <silent> <leader>gi :exe "Git! " input("git command: ")<CR>

endif " }}}

if dein#tap('vim-asterisk') " {{{

    " overrides incsearch
    map *   <Plug>(asterisk-*)
    map #   <Plug>(asterisk-#)
    map g*  <Plug>(asterisk-g*)
    map g#  <Plug>(asterisk-g#)
    map z*  <Plug>(asterisk-z*)
    map gz* <Plug>(asterisk-gz*)
    map z#  <Plug>(asterisk-z#)
    map gz# <Plug>(asterisk-gz#)

    let g:asterisk#keeppos = 1

endif " }}}

if dein#tap('vim-anzu') " {{{

    if dein#is_sourced('incsearch.vim')
        nmap  n <Plug>(incsearch-nohl)<Plug>(anzu-n-with-echo)
        nmap  N <Plug>(incsearch-nohl)<Plug>(anzu-N-with-echo)
    else
        nmap n <Plug>(anzu-n-with-echo)
        nmap N <Plug>(anzu-N-with-echo)
    endif

    nmap <Esc><Esc> <Plug>(anzu-clear-search-status)

endif " }}}

if dein#tap('vim-surround') " {{{

    xmap s   <Plug>VSurround
    xmap gs  <Plug>VgSurround

endif " }}}

if dein#tap('vim-eunuch') " {{{


endif " }}}

if dein#tap('vim-signify') " {{{

    let g:signify_sign_weight = 'none'

    " highlight lines in Sy and vimdiff etc.)

    highlight DiffAdd           cterm=none ctermbg=none ctermfg=119
    highlight DiffDelete        cterm=none ctermbg=none ctermfg=167
    highlight DiffChange        cterm=none ctermbg=none ctermfg=227

    " highlight signs in Sy

    highlight SignifySignAdd    cterm=none ctermbg=none  ctermfg=119
    highlight SignifySignDelete cterm=none ctermbg=none  ctermfg=167
    highlight SignifySignChange cterm=none ctermbg=none  ctermfg=227

endif " }}}

if dein#tap('vim-gitgutter') " {{{

    let g:gitgutter_realtime = 0
    let g:gitgutter_eager = 0

endif " }}}

if dein#tap('cSyntaxAfter') " {{{

    augroup cSyntaxAfter
        autocmd!
        autocmd BufEnter *.cpp,*.c,*.java,*.py,*.sh call CSyntaxAfter()
    augroup END

endif " }}}

if dein#tap('vim-slime') " {{{

    let g:slime_target = "tmux"
    let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}
    let g:slime_dont_ask_default = 1
    " let g:slime_python_ipython = 1
    map <C-x> mzvae<C-C><C-C>`z

endif " }}}

if dein#tap('vim-test') " {{{

    let test#strategy = "dispatch"
    nnoremap <silent> <leader>T  :TestLast<CR>

endif " }}}

if dein#tap('vim-test') " {{{

    let g:sayonara_confirm_quit = 1
    nnoremap <space>c :Sayonara<CR>

endif " }}}

if dein#tap('fzf.vim') " {{{

    " function! dein#tapped.hooks.on_source(bundle)

    function! s:tags_sink(line) abort
        let parts = split(a:line, '\t\zs')
        let excmd = matchstr(parts[2:], '^.*\ze;"\t')
        execute 'silent e' parts[1][:-2]
        let [magic, &magic] = [&magic, 0]
        execute excmd
        let &magic = magic
    endfunction

    function! s:tags() abort
        if empty(tagfiles())
            echohl WarningMsg
            echom 'Preparing tags'
            echohl None
            call system('ctags -R')
        endif

        call fzf#run({
                    \ 'source':  'cat '.join(map(tagfiles(), 'fnamemodify(v:val, ":S")')).
                    \            '| grep -v ^!',
                    \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
                    \ 'down':    '40%',
                    \ 'sink':    function('s:tags_sink')})
    endfunction

    command! Tags call s:tags()

    " endfunction

    nnoremap <Leader>t :Tags<CR>
    nnoremap <C-p> :FZF<CR>

endif " }}}

" ('pyclewn') " {{{

    let g:pyclewn_args = "-w bottom"

" }}}

" }}}

call dein#end()

if dein#check_install()
    call dein#install()
endif

autocmd VimEnter * call dein#call_hook('post_source')
