" Environment {
    " Basics {
        set nocompatible        " Must be first line
        set background=dark     " Assume a dark background
    " }

    " Windows Compatible {
        " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
        " across (heterogeneous) systems easier. 
        if has('win32') || has('win64')
          set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
        endif
    " }

    " Setup Bundle Support {
         set rtp+=~/.vim/bundle/vundle/
         call vundle#rc()

         " Let Vundle manage Vundle
         " Required! 
         Bundle 'gmarik/vundle'

         " My Bundles here:
         "
         " Original repos on github
         Bundle 'tpope/vim-fugitive'
         Bundle 'msanders/snipmate.vim'
         Bundle 'tpope/vim-surround'
         Bundle 'tpope/vim-git'
         Bundle 'ervandew/supertab'
         Bundle 'sontek/minibufexpl.vim'
         Bundle 'mitechie/pyflakes-pathogen'
         Bundle 'mileszs/ack.vim'
         Bundle 'sjl/gundo.vim'
         Bundle 'fs111/pydoc.vim'
         Bundle 'alfredodeza/pytest.vim'
         Bundle 'reinh/vim-makegreen'
         Bundle 'sontek/rope-vim'
         Bundle 'Lokaltog/vim-easymotion'
         Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
         " Vim-scripts repos
         "Bundle 'L9'
         "Bundle 'FuzzyFinder'
         Bundle 'rails.vim'
         Bundle 'scrooloose/syntastic'
         Bundle 'majutsushi/tagbar'
         Bundle 'scrooloose/nerdtree'
         Bundle 'pangloss/vim-javascript'
         Bundle 'altercation/vim-colors-solarized'
         Bundle 'pep8'
         Bundle 'TaskList.vim'
         " Non github repos
         Bundle 'git://git.wincent.com/command-t.git'
         " ...

         filetype plugin indent on     " Required! 
         "
         " Brief help
         "
         " :BundleInstall  - install bundles (won't update installed)
         " :BundleInstall! - update if installed
         "
         " :Bundles foo    - search for foo
         " :Bundles! foo   - refresh cached list and search for foo
         "
         " :BundleClean    - confirm removal of unused bundles
         " :BundleClean!   - remove without confirmation
         "
         " See :h vundle for more details
         " or wiki for FAQ
         " Note: comments after Bundle command are not allowed..
    " }
" }

" General {
    set background=dark         " Assume a dark background
    if !has('win32') && !has('win64')
        set term=$TERM          " Make arrow and other keys work
    endif
    filetype plugin indent on   " Automatically detect file types.
    syntax on                   " Syntax highlighting
    set mouse=a                 " Automatically enable mouse usage
    "set autochdir              " Always switch to the current file directory.. Messes with some plugins, best left commented out
    " Not every vim is compiled with this, use the following line instead
    " If you use command-t plugin, it conflicts with this, comment it out.
    "autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
    scriptencoding utf-8

    "set autowrite              " Automatically write a file when leaving a modified buffer
    set shortmess+=filmnrxoOtT  " Abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash " Better unix / windows compatibility
    set virtualedit=onemore     " Allow for cursor beyond last character
    set history=1000            " Store a ton of history (default is 20)
    "set spell                  " Spell checking on

    " Setting up the directories {
        set backup                          " Backups are nice ...
        " Moved to function at bottom of the file
        "set backupdir=$HOME/.vimbackup//   " But not when they clog.
        "set directory=$HOME/.vimswap//     " Same for swap files
        "set viewdir=$HOME/.vimviews//      " Same for view files

        " Creating directories if they don't exist
        "silent execute '!mkdir -p $HVOME/.vimbackup'
        "silent execute '!mkdir -p $HOME/.vimswap'
        "silent execute '!mkdir -p $HOME/.vimviews'
        au BufWinLeave * silent! mkview  "make vim save view (state) (folds, cursor, etc)
        au BufWinEnter * silent! loadview "make vim load view (state) (folds, cursor, etc)
    " }
" }

" Vim UI {
    color solarized                 " Load a colorscheme
    set tabpagemax=15               " Only show 15 tabs
    set showmode                    " Display the current mode

    set cursorline                  " Highlight current line
    hi cursorline guibg=#333333     " Highlight bg color of current line
    hi CursorColumn guibg=#333333   " Highlight cursor
    set guifont=Inconsolata:h16:cANSI "Set font for gvim

    if has('cmdline_info')
        set ruler                   " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
        set showcmd                 " Show partial commands in status line and
                                    " Selected characters/lines in visual mode
    endif

    if has('statusline')
        set laststatus=2

        " Broken down into easily includeable segments
        set statusline=%<%f\        " Filename
        set statusline+=%w%h%m%r    " Options
        set statusline+=%{fugitive#statusline()} " Git Hotness
        set statusline+=\ [%{&ff}/%Y]            " filetype
        set statusline+=\ [%{getcwd()}]          " current dir
        "set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    endif

    set backspace=indent,eol,start  " Backspace for dummys
    set linespace=0                 " No extra spaces between rows
    set nu                          " Line numbers on
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set winminheight=0              " windows can be 0 line high 
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap to
    set scrolljump=5                " Lines to scroll when cursor leaves screen
    set scrolloff=3                 " Minimum lines to keep above and below cursor
    set foldenable                  " Auto fold code
    set gdefault                    " The /g flag on :s substitutions by default
    set list
    set listchars=tab:>.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace
    set foldmethod=indent
    set foldlevel=99
    set columns=120
" }

" Formatting {
    set nowrap                      " Wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
    "set matchpairs+=<:>            " Match, to be used with % 
    set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
    "set comments=sl:/*,mb:*,elx:*/ " Auto format comment blocks
    " Remove trailing whitespaces and ^M chars
    autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
" }

" Key (re)Mappings {

    " The default leader is '\', but many people prefer ',' as it's in a standard
    " location
    let mapleader = ','

    " Making it so ; works like : for commands. Saves typing and eliminates :W style typos due to lazy holding shift.
    nnoremap ; :

    " Easier moving in tabs and windows
    map <C-J> <C-W>j<C-W>_
    map <C-K> <C-W>k<C-W>_
    map <C-L> <C-W>l<C-W>_
    map <C-H> <C-W>h<C-W>_

    " Wrapped lines goes down/up to next row, rather than next line in file.
    nnoremap j gj
    nnoremap k gk

    " The following two lines conflict with moving to top and bottom of the screen
    " If you prefer that functionality, comment them out.
    map <S-H> gT
    map <S-L> gt

    " Stupid shift key fixes
    cmap W w
    cmap WQ wq
    cmap wQ wq
    cmap Q q
    cmap Tabe tabe

    " Yank from the cursor to the end of the line, to be consistent with C and D.
    " nnoremap Y y$

    " Clearing highlighted search
    nmap <silent> <leader>/ :nohlsearch<CR>

    " Shortcuts
    " Change Working Directory to that of the current file
    cmap cwd lcd %:p:h
    cmap cd. lcd %:p:h

    " Visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv 

    " Fix home and end keybindings for screen, particularly on mac
    " - for some reason this fixes the arrow keys too. huh.
    map [F $
    imap [F $
    map [H g0
    imap [H g0

    " For when you forget to sudo.. Really Write the file.
    cmap w!! w !sudo tee % >/dev/null
" }

" Plugins {
    " VCSCommand {
        "let b:VCSCommandMapPrefix=',v'
        "let b:VCSCommandVCSType='git'
    " } 

    " PIV {
        let g:DisableAutoPHPFolding = 0
        "let cfu=phpcomplete#CompletePHP
    " }

    " Misc {
        :map <C-F10> <Esc>:vsp<CR>:VTree<CR>
        "map Control + F10 to Vtree

        noremap <leader><F5> :CheckSyntax<cr>
        let g:checksyntax_auto = 1

        " Comment out line(s) in visual mode -RB: If you do this, you can't
        " switch sides of the comment block in visual mode.
        "vmap  o  :call NERDComment(1, 'toggle')<CR>
        let g:NERDShutUp=1

        let b:match_ignorecase = 1
    " }

    " ShowMarks {
        let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        " Don't leave on by default, use :ShowMarksOn to enable
        let g:showmarks_enable = 0
        " For marks a-z
        highlight ShowMarksHLl gui=bold guibg=LightBlue guifg=Blue
        " For marks A-Z
        highlight ShowMarksHLu gui=bold guibg=LightRed guifg=DarkRed
        " For all other marks
        highlight ShowMarksHLo gui=bold guibg=LightYellow guifg=DarkYellow
        " For multiple marks on the same line.
        highlight ShowMarksHLm gui=bold guibg=LightGreen guifg=DarkGreen
    " }

    " Command-t {
        let g:CommandTSearchPath = $HOME . '/Code'
    " }

    " OmniComplete {
        "if has("autocmd") && exists("+omnifunc")
            "autocmd Filetype *
                "\if &omnifunc == "" |
                "\setlocal omnifunc=syntaxcomplete#Complete |
                "\endif
        "endif

        " Popup menu hightLight Group
        "highlight Pmenu    ctermbg=13    guibg=DarkBlue
        "highlight PmenuSel    ctermbg=7    guibg=DarkBlue        guifg=LightBlue
        "highlight PmenuSbar ctermbg=7    guibg=DarkGray
        "highlight PmenuThumb            guibg=Black

        hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
        hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
        hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

        " some convenient mappings 
        inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
        inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
        inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
        inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
        inoremap <expr> <C-d>       pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
        inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

        " Make sure that it doesn't break supertab
        let g:SuperTabCrMapping = 0

        " Automatically open and close the popup menu / preview window
        au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
        set completeopt=menu,preview,longest
    " }

    " Supertab {
        au FileType python set omnifunc=pythoncomplete#Complete
        let g:SuperTabDefaultCompletionType = "context"
        let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
    " }

    " Ropevim {
        map <leader>j :RopeGotoDefinition<CR>
        map <leader>r :RopeRename<CR>
    " }

    " Ctags {
        " This will look in the current directory for 'tags', and work up the tree towards root until one is found. 
        set tags=./tags;/,$HOME/vimtags
        map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR> " C-\ - Open the definition in a new tab
        map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>      " A-] - Open the definition in a vertical split
    " }

    " Tagbar {
        map <C-\> :TagbarToggle<CR>
    " }

    " EasyTags {
       " Disabling for now. It doesn't work well on large tag files 
        let g:loaded_easytags = 1  " Disable until it's working better
        let g:easytags_cmd = 'ctags'
        let g:easytags_dynamic_files = 1
        if !has('win32') && !has('win64')
            let g:easytags_resolve_links = 1
        endif
    " }

    " Delimitmate {
        au FileType * let b:delimitMate_autoclose = 1

        " If using html auto complete (complete closing tag)
        au FileType xml,html,xhtml let b:delimitMate_matchpairs = "(:),[:],{:}"
    " }

    " AutoCloseTag {
        " Make it so AutoCloseTag works for xml and xhtml files as well
        au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
    " }

    " SnipMate {
        " Setting the author var
        let g:snips_author = 'Ken Haigh <ken@thehaighs.net>'
        " Shortcut for reloading snippets, useful when developing
        nnoremap ,smr <esc>:exec ReloadAllSnippets()<cr>
    " }

    " Make Green {
        map <Leader>] <Plug>MakeGreen
    " }

    " NerdTree {
        map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
        map <leader>e :NERDTreeFind<CR>
        nmap <leader>nt :NERDTreeFind<CR>

        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
        let NERDTreeChDirMode=0
        let NERDTreeQuitOnOpen=1
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=1
    " }

    " Tabularize {
        if exists(":Tabularize")
          nmap <Leader>a= :Tabularize /=<CR>
          vmap <Leader>a= :Tabularize /=<CR>
          nmap <Leader>a: :Tabularize /:<CR>
          vmap <Leader>a: :Tabularize /:<CR>
          nmap <Leader>a:: :Tabularize /:\zs<CR>
          vmap <Leader>a:: :Tabularize /:\zs<CR>
          nmap <Leader>a, :Tabularize /,<CR>
          vmap <Leader>a, :Tabularize /,<CR>
          nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
          vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
        endif
     " }

     " Syntastic {
         set statusline+=%#warningmsg#
         set statusline+=%{SyntasticStatuslineFlag()}
         set statusline+=%*
         let g:syntastic_enable_signs=1
         let g:syntastic_auto_jump=1
         let g:syntastic_auto_loc_list=1
     " }

     " Task lists {
         map <leader>td <Plug>TaskList
     " }

     " Easy Motion {
        let g:EasyMotion_leader_key='<leader><leader>'
     " }

     " Fuzzy Finder {
        " Fuzzy Find file, tree, buffer, line
        nmap <leader>ff :FufFile **/<CR>
        nmap <leader>ft :FufFile<CR>
        nmap <leader>fb :FufBuffer<CR>
        nmap <leader>fl :FufLine<CR>
        nmap <leader>fr :FufRenewCache<CR>
     " }

     " Session List {
         set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
         nmap <leader>sl :SessionList<CR>
         nmap <leader>ss :SessionSave<CR>
     " }

     " Buffer explorer {
         nmap <leader>b :BufExplorer<CR>
     " }

     " VCS commands {
         nmap <leader>vs :VCSStatus<CR>
         nmap <leader>vc :VCSCommit<CR>
         nmap <leader>vb :VCSBlame<CR>
         nmap <leader>va :VCSAdd<CR>
         nmap <leader>vd :VCSVimDiff<CR>
         nmap <leader>vl :VCSLog<CR>
         nmap <leader>vu :VCSUpdate<CR>
     " }

     " php-doc commands {
         nmap <leader>pd :call PhpDocSingle()<CR>
         vmap <leader>pd :call PhpDocRange()<CR>
     " }

     " Debugging with VimDebugger {
         map <F11> :DbgStepInto<CR>
         map <F10> :DbgStepOver<CR>
         map <S-F11> :DbgStepOut<CR>
         map <F5> :DbgRun<CR>
         map <F6> :DbgDetach<CR>
         map <F8> :DbgToggleBreakpoint<CR>
         map <S-F8> :DbgFlushBreakpoints<CR>
         map <F9> :DbgRefreshWatch<CR>
         map <S-F9> :DbgAddWatch<CR>
     " }

     " Taglist Variables {
         let Tlist_Auto_Highlight_Tag = 1
         let Tlist_Auto_Update = 1
         let Tlist_Exit_OnlyWindow = 1
         let Tlist_File_Fold_Auto_Close = 1
         let Tlist_Highlight_Tag_On_BufEnter = 1
         let Tlist_Use_Right_Window = 1
         let Tlist_Use_SingleClick = 1

         let g:ctags_statusline=1
         " Override how taglist does javascript
         let g:tlist_javascript_settings = 'javascript;f:function;c:class;m:method;p:property;v:global'
     " }

     " JSON {
         nmap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>
     " }

     " Gundo {
         map <leader>g :GundoToggle<CR>
     " }

     " pyflakes {
         let g:pyflakes_use_quickfix = 0
     " }

     " Pep8 {
         let g:pep8_map='<leader>8'
     " }
" }

" GUI Settings {
    " GVIM- (here instead of .gvimrc)
    if has('gui_running')
        set guioptions-=T              " remove the toolbar
        set lines=40                   " 40 lines of text instead of 24,
    else
        set term=builtin_ansi       " Make arrow and other keys work
    endif
" }

function! InitializeDirectories()
  let separator = "."
  let parent = $HOME 
  let prefix = '.vim'
  let dir_list = { 
              \ 'backup': 'backupdir', 
              \ 'views': 'viewdir', 
              \ 'swap': 'directory' }

  for [dirname, settingname] in items(dir_list)
      let directory = parent . '/' . prefix . dirname . "/"
      if exists("*mkdir")
          if !isdirectory(directory)
              call mkdir(directory)
          endif
      endif
      if !isdirectory(directory)
          echo "Warning: Unable to create backup directory: " . directory
          echo "Try: mkdir -p " . directory
      else  
          let directory = substitute(directory, " ", "\\\\ ", "")
          exec "set " . settingname . "=" . directory
      endif
  endfor
endfunction
call InitializeDirectories()

function! NERDTreeInitAsNeeded()
    redir => bufoutput
    buffers!
    redir END
    let idx = stridx(bufoutput, "NERD_tree")
    if idx > -1
        NERDTreeMirror
        NERDTreeFind
        wincmd l
    endif
endfunction

" Use local vimrc if available {
    if filereadable(expand("~/.vimrc.local"))
        source ~/.vimrc.local
    endif
" }
