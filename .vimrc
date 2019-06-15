syntax on
filetype plugin indent on



let g:jsx_ext_required = 0

" nerdtree stuff
" Run nerdtree automatically when openeing VIM
autocmd vimenter * NERDTree
" Move window focus to the right instead of on Nerdtree when openeing
autocmd VimEnter * wincmd p
" Toggle Nerd Tree on ctrl+n
map <C-n> :NERDTreeToggle<CR>
" show hidden files and folders in NerdTree
let NERDTreeShowHidden=1
" close VIM when only nertree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" FILETYPES
au bufread,bufnewfile *.jade set filetype=jade
au bufread,bufnewfile *.js set filetype=javascript
au bufread,bufnewfile *.ts set filetype=typescript
au bufread,bufnewfile *.vue set filetype=vue
au bufread,bufnewfile *.json set filetype=json
au bufread,bufnewfile *.as set filetype=actionscript
au bufread,bufnewfile *.java set filetype=java
au bufread,bufnewfile *.jsx set filetype=jsx
au bufread,bufnewfile *.css set filetype=css
au bufread,bufnewfile *.html set filetype=html


"""""""""""""""""""""""""""""""
" Syntax Checker with Syntastic
"""""""""""""""""""""""""""""""
set autoread

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_json_checkers = ['eslint']
"let g:syntastic_typescript_checkers = ['eslint', 'tsc']
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']
let g:syntastic_vue_checkers = ['eslint']
"let g:syntastic_html_checkers = ['/usr/local/Cellar/tidy-html5/5.4.0/bin/tidy']

" use the local version of eslint via the project
 let g:syntastic_javascript_eslint_exec = './node_modules/.bin/eslint'
 let g:syntastic_json_eslint_exec = './node_modules/.bin/eslint'
 let g:syntastic_vue_eslint_exec = './node_modules/.bin/eslint'
 "let g:syntastic_typescript_eslint_exec = './node_modules/.bin/eslint'

"""""""""""""""""""""""""""""""
" Ale (auto fixer)
"""""""""""""""""""""""""""""""
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'json': ['eslint'],
\}
let g:ale_fix_on_save = 1

"""""""""""""""""""""""""""""""
" JsDoc
"""""""""""""""""""""""""""""""
let g:jsdoc_enable_es6 = 1
let g:jsdoc_return = 1
let g:jsdoc_param_description_separator = ' - '

"""""""""""""""""""""""""""""""
" Colors.  Themes at http://vimcolors.com/
"""""""""""""""""""""""""""""""
set background=dark
colorscheme Tomorrow-Night-Bright

"""""""""""""""""""""""""""""""
" Close Tag
"""""""""""""""""""""""""""""""
" filenames like *.xml, *.html, *.xhtml, ...
" Then after you press <kbd>&gt;</kbd> in these files, this plugin will try to close the current tag.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non closing tags self closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" integer value [0|1]
" This will make the list of non closing tags case sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

""""
" NERDCommenter
""""
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'javascript': { 'left': '/** ','right': '*/' } }

""""
"general options
""""

"indentation
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab

"line number
set number
set ruler

"smarter search
set showmatch
set incsearch
set hlsearch
set wildmenu

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allows window switching from an unsaved buffer without saving it first.
set hidden

" Keeps dirs a little cleaner with a specified dir for swp files.
set backupdir=~/.vimtmp/backup//
set directory=~/.vimtmp/swp//
" Allow backspacing over autoindent, line breaks and start of insert action

set nostartofline
" Stop certain movements from always going to the first character of a line.
" try G and gg

" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set backspace=indent,eol,start

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" 'press <Enter> to continue'
set cmdheight=2

" Open new split panes to right and bottom, which feels more natural than Vimís default:
set splitbelow
set splitright

" Show partial commands in the last line of the screen
set showcmd
set noautochdir

" set color
colorscheme gruvbox
set background=dark
set t_Co=256

" yanks and pastes into the clipboard not the default buffer
set clipboard=unnamed

"" Key Mappins"
map <C-S-H> <C-w>h
map <C-S-J> <C-w>j
map <C-S-K> <C-w>k
map <C-S-L> <C-w>l
noremap <F5> :JsDoc<CR>
autocmd FileType typescript nmap <buffer> <F6> <Plug>(TsuquyomiRenameSymbolC)
set statusline=%f "tail of the filename

" kicks you out of insert when typing jk
inoremap jk <esc>
" visual selection of matching braces
nnoremap <C-T> v%

" Selects the current word, pastes the current buffer, then yanks the word
" under the cursor, hacky find and replace substitute
map <C-p> viwpviwy

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
" ***EDIT*** changed <C-L> to be move one split left trying to keep the remove
" highlight functionality in <C-;>
" **NOTE** doesn't seem to work so I use typing gibbish into search to stop it
nnoremap <C-;> :nohl<CR>
