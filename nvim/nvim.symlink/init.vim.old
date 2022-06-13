"                   __
"    __          __/\ \__               __
"   /\_\    ___ /\_\ \ ,_\      __  __ /\_\    ___ ___
"   \/\ \ /' _ `\/\ \ \ \/     /\ \/\ \\/\ \ /' __` __`\
"    \ \ \/\ \/\ \ \ \ \ \_  __\ \ \_/ |\ \ \/\ \/\ \/\ \
"     \ \_\ \_\ \_\ \_\ \__\/\_\\ \___/  \ \_\ \_\ \_\ \_\
"      \/_/\/_/\/_/\/_/\/__/\/_/ \/__/    \/_/\/_/\/_/\/_/
"
"       author: Daniel Dabrowski based on init created by Liam Ederzeel
"       https://github.com/LiamEderzeel/MyDotFiles/blob/master/init.vim

" Folding cheet sheetIndicates a fast terminal connection.
"
" zR    open all folds
" zM    close all folds
" za    toggle fold at cursor position
" zj    move down to start of next fold
" zk    move up to end of previous fold

" Environment {
    " Identify platform {
        silent function! OSX()
            return has('macunix')
        endfunction
        silent function! LINUX()
            return has('unix') && !has('macunix') && !has('win32unix')
        endfunction
        silent function! WINDOWS()
            return  (has('win32') || has('win64'))
        endfunction
    " }

    " Basics {
        set nocompatible        " Must be first line
        if !WINDOWS()
            set shell=/bin/sh
        endif
    " }

    " Windows Compatible {
        " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
        " across (heterogeneous) systems easier.
        if WINDOWS()
            set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
        endif
    " }

    " Arrow Key Fix {
        if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
            inoremap <silent> <C-[>OC <RIGHT>
        endif
    " }
" }

" Bundles {
"
			function! BuildComposer(info)
				if a:info.status != 'unchanged' || a:info.force
					if has('nvim')
						!cargo build --release
					else
						!cargo build --release --no-default-features --features json-rpc
					endif
				endif
			endfunction

    set runtimepath+=~/.vim/plugged/repos/github.com/Shougo/dein.vim
	if dein#load_state(expand('~/.vim/plugged'))
		call dein#begin(expand('~/.vim/plugged'))
       	call dein#add('Shougo/dein.vim')
        call dein#add('wsdjeg/dein-ui.vim')

        " Utilities{
            call dein#add('Shougo/vimproc.vim', {'build': 'make clean all'})
            "call dein#add('editorconfig/editorconfig-vim')
            call dein#add('tpope/vim-surround')                             " Sorroundings
            " call dein#add('tpope/vim-repeat')                             " More . command
            " call dein#add('tpope/vim-abolish')                            " Better replace
            " call dein#add('tpope/vim-unimpaired')                         " Key mappings for [
            " call dein#add('tommcdo/vim-exchange')                         " Exchange motion
            " call dein#add('AndrewRadev/splitjoin.vim')                    " Split onelinners with gS
            "call dein#add('SirVer/ultisnips')                               " Snippets
            "call dein#add('marcweber/vim-addon-mw-utils')
            " call dein#add('honza/vim-snippets')
            " call dein#add('wellle/targets.vim')                           " Better motions
            "call dein#add('Raimondi/delimitMate')                           " Auto close quotes parentesis etc
            "call dein#add('mhinz/vim-grepper')                              " Multiple grep support
            " call dein#add('sjl/gundo.vim')                                " Undo tree
            "call dein#add('godlygeek/tabular')                              " Align code
            " call dein#add('vim-scripts/BufOnly.vim')                      " Close All other buffers
            "call dein#add('airblade/vim-rooter')
            "call dein#add('tpope/vim-dispatch')                             " Asynchronous build and test dispatcher
            "call dein#add('tomtom/tcomment_vim')
            "call dein#add('mattn/emmet-vim')
            "call dein#add('dermusikman/sonicpi.vim')
            "call dein#add('Shougo/deoplete.nvim')
            "call dein#add('mhinz/vim-startify')                             " Start Screen
            " call dein#add('neomake/neomake')                              " Async Syntax check
            " call dein#add('Yggdroot/indentLine')
            "call dein#add('junegunn/fzf', { 'build': './install --all' })   " Fuzzy finder
            "call dein#add('junegunn/fzf.vim')                               " fzf vim plugin
            "call dein#add('brooth/far.vim')
            "call dein#add('christoomey/vim-tmux-navigator')
            "call dein#add('tpope/vim-fugitive')                             " Git wrapper
            "call dein#add('euclio/vim-markdown-composer', {'build': 'cargo build --release'})                   " Markdown live previewer

            if OSX()
                call dein#add('wakatime/vim-wakatime')                      " register time
            endif
        " }
        " Prose {
            call dein#add('reedes/vim-pencil', {'on_ft': ['markdown', 'text']})
            call dein#add('reedes/vim-lexical', {'on_ft': ['markdown', 'text']})
            call dein#add('reedes/vim-wordy', {'on_ft': ['markdown', 'text']})
            call dein#add('dbmrq/vim-ditto', {'on_ft': ['markdown', 'text']})
            call dein#add('junegunn/goyo.vim', {'on_ft': ['markdown', 'text']})
            call dein#add('junegunn/limelight.vim', {'on_ft': ['markdown', 'text']})
        " }
        " VCS {
            call dein#add('tpope/vim-fugitive')                           " Git wrapper
            call dein#add('airblade/vim-gitgutter')                       " Git gutter simbols
        " }
        " UI {
            call dein#add('hzchirs/vim-material')
            "call dein#add('AlxHnr/clear_colors')
            "call dein#add('mhartington/oceanic-next')
            "call dein#add('liamederzeel/solo.vim')
            "call dein#add('rakr/vim-one')
            "call dein#add('crusoexia/vim-monokai')
            "call dein#add('frankier/neovim-colors-solarized-truecolor-only')
            call dein#add('bling/vim-airline')
            call dein#add('vim-airline/vim-airline-themes')
            "call dein#add('edkolev/tmuxline.vim')
            "call dein#add('Valloric/MatchTagAlways')
            " call dein#add('altercation/vim-colors-solarized')
            " call dein#add('w0ng/vim-hybrid')
            " call dein#add('whatyouhide/vim-gotham')
            " call dein#add('morhetz/gruvbox')
        " }
        " Language {
            "call dein#add('lilydjwg/colorizer')                     " Preview colors
            "call dein#add('vim-scripts/vim-polyglot')
            " call dein#add('garbas/vim-snipmate')
            " call dein#add('rust-lang/rust.vim', {})
            " call dein#add('racer-rust/vim-racer', {})
            " call dein#add('cespare/vim-toml', { 'on_ft': 'toml' })
            " call dein#add('mattn/emmet-vim', {})
            " call dein#add('shime/vim-livedown')					" Markdown previewer
            " call dein#add('jaawerth/nrun.vim', {})
            " " Yaml
            " call dein#add('mrk21/yaml-vim')
            " " C#
            "call dein#add('OrangeT/vim-csharp')
            " " JS
            " call dein#add('pangloss/vim-javascript')
            " call dein#add('mxw/vim-jsx')
            " call dein#add('leafgarland/typescript-vim')
            " call dein#add('crusoexia/vim-javascript-lib')
            " call dein#add('carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' })
            " " JSON
            " call dein#add('elzr/vim-json', { 'on_ft': 'json' })
            "call dein#add('vim-scripts/ShaderHighLight')            " Shader lab
            " " HTML
            " call dein#add('othree/html5.vim', { 'on_ft': ['html', 'markdown' ]})
            " " CSS
            " call dein#add('JulesWang/css.vim')
            " call dein#add('hail2u/vim-css3-syntax')
            " call dein#add('cakebaker/scss-syntax.vim')

            call dein#add('OmniSharp/omnisharp-vim', {
                    \ 'build': ':OmniSharpInstall',
                    \ 'on_ft': 'cs'
                    \ })
        " }

        " programming {
            "call dein#add('neoclide/coc.nvim', { 'build': 'install.sh' })
        " }

        call dein#end()

        if dein#check_install()
            call dein#install()
        endif
        call dein#check_lazy_plugins()
        call dein#save_state()
    endif
" }

" General {
    filetype plugin on                      " Automatically detect file types.
    syntax on                               " Turn syntax highlighting on
    set mouse=a                             " Automatically enable mouse usage
    set mousehide                           " Hide the mouse cursor while typing
    set complete-=i                         " Complete only on current buffer http://stackoverflow.com/questions/2169645/vims-autocomplete-is-excruciatingly-slow
    set ffs=unix,dos
    set ff=unix                             " Change DOS line endings to unix
    set nrformats-=octal                    " Ctrl A considers numbers starting with 0 octal
    set autoread
    scriptencoding utf-8
    set clipboard=unnamed                   " Set clipboard buffer to unnamed
    set undofile                            " turn on the feature
    set undodir=$HOME/.vim/undo             " directory where the undo files will be stored

    " Ignore files {
        set wildignore+=node_modules/**,
        set wildignore+=bower_components/**,
        set wildignore+=.git/**,
        set wildignore+=*.meta,
        set wildignore+=*.prefab,
        set wildignore+=*.sample,
        set wildignore+=*.asset,
        set wildignore+=*.unity,
        set wildignore+=*.anim,
        set wildignore+=*.controller,
        set wildignore+=*.jpg,
        set wildignore+=*.png,
        set wildignore+=*.mp3,
        set wildignore+=*.wav,
        set wildignore+=*.ttf,
        set wildignore+=*.pdf,
        set wildignore+=*.psd,
        set wildignore+=*.shader,
        set wildignore+=*.dll,
        set wildignore+=*.mat,
        set wildignore+=*.file,
        set wildignore+=*.unitypackage,
        set wildignore+=debug/,
        set wildignore+=Debug/,
        set wildignore+=temp/,
        set wildignore+=Temp/,
        set wildignore+=temp/,
    " }
" }

" UI {
    if has('nvim')
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
        " let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
    endif

    if has('termguicolors')
        set termguicolors
    endif

    highlight clear SignColumn                      " SignColumn should match background
    highlight clear LineNr                          " Current line number row will have same background color in relative mode

    if has('nvim')
        set inccommand=nosplit
    endif

    let g:material_style='oceanic'
    set background=dark
    colorscheme vim-material                        " Set theme to one

    set guicursor=a:blinkon0
    set cursorline                                  " Highlight current line
    set ruler                                       " Shows line and column of cursor
    set relativenumber number                       " Line numbers
    set backspace=2                                 " Backspace beyond insert point
    set cmdheight=1
    set laststatus=2                                " Always display the statusline in all windows
    "set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h10:cEASTEUROPE
    set noshowmode                                  " Hide the default mode text (e.g. -- INSERT -- below the statusline)
    set fillchars+=vert:┆

    augroup VimCSS3Syntax
        autocmd!

        autocmd FileType scss setlocal iskeyword+=-
    augroup END
" }

" Key mapping {{{1
    let mapleader = ","

" }}}

" My Features {{{1

    " Easier init files editing {{{2
        nmap <leader>vr :tabedit $MYVIMRC<CR>

         augroup vimrc     " Source vim configuration upon save
             autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
             " autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
         augroup END

    " }}}2


"}}}


" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:
