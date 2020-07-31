syntax on
filetype plugin indent on

"""""""""""""""""""""""""""""""
" File Types
"""""""""""""""""""""""""""""""
au bufread,bufnewfile *.jade set filetype=jade
au bufread,bufnewfile *.js set filetype=javascript
au bufread,bufnewfile *.ts set filetype=typescript
au bufread,bufnewfile *.vue set filetype=vue
au bufread,bufnewfile *.json set filetype=json
au bufread,bufnewfile *.as set filetype=actionscript
au bufread,bufnewfile *.java set filetype=java
au bufread,bufnewfile *.jsx set filetype=jsx
au bufread,bufnewfile *.css set filetype=css
au bufread,bufnewfile *.scss set filetype=sass
au bufread,bufnewfile *.sass set filetype=sass
au bufread,bufnewfile *.html set filetype=html

"""""""""""""""""""""""""""""""
" Set split locations
"""""""""""""""""""""""""""""""
set splitbelow
set splitright
set autoread

"""""""""""""""""""""""""""""""
" Ale
"""""""""""""""""""""""""""""""
let g:ale_completion_tsserver_autoimport = 1
let g:ale_completion_enabled = 1
let g:ale_vue_vls_use_global = 1
let g:ale_fix_on_save = 1
let g:ale_open_list = 1
let g:ale_set_quickfix = 1
let g:ale_set_loclist = 0
let g:ale_linters_explicit = 1
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}
set omnifunc=ale#completion#OmniFunc

"""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""
autocmd vimenter * NERDTree
" Move window focus to the right instead of on Nerdtree when openeing
autocmd VimEnter * wincmd p
" Toggle Nerd Tree on ctrl+n
map <C-n> :NERDTreeToggle<CR>
" show hidden files and folders in NerdTree
let NERDTreeShowHidden=1
" close VIM when only nertree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"""""""""""""""""""""""""""""""
" JsDoc
"""""""""""""""""""""""""""""""
let g:jsdoc_enable_es6 = 1
let g:jsdoc_return = 1
let g:jsdoc_param_description_separator = '-'

"""""""""""""""""""""""""""""""
" Colors.  Themes at http://vimcolors.com/
"""""""""""""""""""""""""""""""
colorscheme gruvbox
set background=dark
set t_Co=256

" yanks and pastes into the clipboard not the default buffer
set clipboard=unnamed

"""""""""""""""""""""""""""""""
" Close Tag
"""""""""""""""""""""""""""""""
" filenames like *.xml, *.html, *.xhtml, ...
" Then after you press <kbd>&gt;</kbd> in these files, this plugin will try to close the current tag.
"
let g:closetag_filenames = '*.html,*.jsx,*.vue'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non closing tags self closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,vue,jsx,tsx,xhtml,phtml'

" integer value [0|1]
" This will make the list of non closing tags case sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '<C->>'


""""
" NERDCommenter
""""
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = {
\   'javascript': { 'left': '/** ','right': '*/' },
\   'typescript': { 'left': '/** ','right': '*/' },
\   'vue': { 'left': '/** ','right': '*/' }
\}
let g:NERDCommentEmptyLines = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

""""
"general options
""""
set statusline=%l:%f
let mapleader=","

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

"" Key Mappins"
map <C-S-H> <C-w>h
map <C-S-J> <C-w>j
map <C-S-K> <C-w>k
map <C-S-L> <C-w>l

" kicks you out of insert when typing jk
inoremap jk <esc>
" visual selection of matching braces
nnoremap <C-T> v%

" Selects the current word, pastes the current buffer, then yanks the word
" under the cursor, hacky find and replace substitute
map <C-p> viwpviwy

autocmd FileType javascript noremap <leader>d :JsDoc<CR>
autocmd FileType typescript noremap <leader>d :JsDoc<CR>
autocmd FileType javascript noremap <leader>ci :NERDCommenterInsert<CR>
autocmd FileType typescript noremap <leader>ci :NERDCommenterInsert<CR>

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

" Use underline instead of reversing for errors and warnings
hi clear SpellBad
hi SpellBad cterm=bold,underline ctermfg=Red ctermbg=Black
hi clear SpellCap
hi SpellCap cterm=bold,underline ctermfg=Yellow ctermbg=Black
set signcolumn=yes

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
