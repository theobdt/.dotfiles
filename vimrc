"set environment variables
set undodir=$XDG_DATA_HOME/vim/undo
set directory=$XDG_DATA_HOME/vim/swap
set backupdir=$XDG_DATA_HOME/vim/backup
set viewdir=$XDG_DATA_HOME/vim/view
set viminfo+='1000,n$XDG_DATA_HOME/vim/viminfo
set runtimepath=$XDG_CONFIG_HOME/vim,$VIMRUNTIME,$XDG_CONFIG_HOME/vim/after

"package manager
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
"set runtimepath+=~/.vim/bundle/Vundle.vim
set runtimepath+=$XDG_CONFIG_HOME/vim/bundle/Vundle.vim
"call vundle#begin()
call vundle#begin('$XDG_CONFIG_HOME/vim/bundle')
" alternatively, pass a path where Vundle should install plugins

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'

" Python Autocompletion
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'

" syntax highlighting
"Plugin 'sheerun/vim-polyglot'

" linting
Plugin 'dense-analysis/ale'

" Latex plugin
Plugin 'lervag/vimtex'

" Markdown
"Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown'
"Plugin 'masukomi/vim-markdown-folding' 

" colorscheme
Plugin 'rafi/awesome-vim-colorschemes' 

"start page
Plugin 'mhinz/vim-startify'

"fzf
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

Plugin 'tpope/vim-fugitive'

Plugin 'chrisbra/Recover.vim' 

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

if has("autocmd")
  filetype plugin indent on
endif
"""""""""""
" GENERAL "
"""""""""""
set wildmenu
set wildignorecase
set smartcase
"jump quickfix
nnoremap <leader>j :cn<CR>
nnoremap <leader>k :cp<CR>
nnoremap <leader>q :ccl<CR>
nnoremap <BS> <C-^>

"remap space key
nnoremap <SPACE> <Nop>
let mapleader=" "

"fzf
nnoremap <leader>s :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>w :Rg<CR>

"netrw
let g:netrw_banner=0
"let g:netrw_list_hide= '.*\.swp$,.DS_Store,*/tmp/*,*.so,*.swp,*.zip,*.git,^\.\.\=/\=$'
"let g:netrw_hide=1
let g:netrw_liststyle=3

""""""""""
" VISUAL "
""""""""""
syntax enable
set background=dark
set number relativenumber
set wrap
colorscheme gruvbox
let g:gruvbox_contrast_dark='medium'
" change color foreground to white
hi Normal ctermfg=15
"set termguicolors


"""""""""""""""""""
" CUSTOM BINDINGS "
"""""""""""""""""""

" system clipboard
set clipboard=unnamedplus
vnoremap [y "+y
nnoremap [p "+p

"insert date
nnoremap <F3> i<C-R>=strftime("%Y-%m-%d %a %H:%M")<CR><Esc>
inoremap <F3> <C-R>=strftime("%Y-%m-%d %a %H:%M")<CR>

" Highlight search
nnoremap <leader>a :set hlsearch!<CR>

" Change wrapped line
"nnoremap zj gj
"nnoremap zk gk

" Move faster
nnoremap K 5kz.
nnoremap J 5jz.


" Indent blocks
vnoremap > >gv
vnoremap < <gv

" Go to normal mode
inoremap jk <esc>
inoremap JK <esc>
inoremap jK <esc>

set timeoutlen=1000 ttimeoutlen=0
vnoremap <C-[> <esc>
inoremap <C-[> <esc>

" Select word
"nnoremap <space> viw<left> 

" Add blank line
nnoremap <Enter> o<Esc>


" Update .vimrc easily
nnoremap <leader>r :split $MYVIMRC<cr> 
nnoremap <c-z> :source $MYVIMRC<cr>

" New split open on the right
set splitright

" Move cursor to different panel
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-h> <c-w><c-h>
nnoremap <c-l> <c-w><c-l>

" Resize panels
"nnoremap zl :vertical resize +5<CR>
"nnoremap zh :vertical resize -5<CR>
"nnoremap zj :resize +2<CR>
"nnoremap zk :resize -2<CR>

" disable mouse
"set mouse=
set mouse=a
"set ttymouse=

"""""""
"NOTES"
"""""""
autocmd BufNewFile,BufReadPost *.md let g:markdown_folding=1 | set filetype=markdown
set foldlevelstart=20
let g:startify_file_number = 2
"let g:startify_lists = [\ { 'type': 'bookmarks', 'header': [   'Bookmarks:']      },\ { 'type': 'files', 'header': [   'Remember Me:']       },\ ]
let g:startify_custom_header=[]
let g:startify_bookmarks = [{'r':'~/.config/vim/vimrc'},
            \ {'nm':'~/notes/meeting_notes.md'},
            \ {'ns':'~/notes/self.md'},
            \ {'v':'~/.config/env'},
            \ {'t':'.'},
            \ {'z':'~/.config/zsh/.zshrc'}]
"let g:vim_markdown_folding_disabled=0
"let g:vim_markdown_folding_style_pythonic=1
""""""""""
" PYTHON "
""""""""""

" Python setup
filetype indent on
set et
set sw=4
set smarttab
"map <f2> :w\|!ipython %<CR>
set encoding=utf-8
autocmd FileType python set colorcolumn=80


"vim polyglot
let g:python_highlight_all = 1
"to avoid conflict with vimtex
let g:polyglot_disabled = ['latex', 'markdown']

"vim ale
":ALEInfo
":ALEDetail
":ALEFix
let g:ale_enabled = 0
let g:ale_set_balloons = 1
"autocmd FileType python :ALEToggle
"autocmd FileType tex :ALEToggle
"let g:ale_linters = {'python': ['flake8'],'tex': ['chktex']}
let g:ale_linters = {'python': ['flake8']}
let g:ale_echo_msg_format = '[%linter%] (%code%) %s'
let g:ale_python_black_options ='-l 79' 
let g:ale_fixers = {
            \'python': ['trim_whitespace', 'remove_trailing_lines', 'black'],
            \'tex': ['trim_whitespace', 'remove_trailing_lines', 'latexindent']
            \}
"ignore warning whitespace before colon (black compatibility)
let g:ale_python_flake8_options ='--ignore=E203,W605' 
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 0
nmap <silent> <leader>d <Plug>(ale_previous_wrap)
nmap <silent> <leader>f <Plug>(ale_next_wrap)
nmap <silent> <leader>g <Plug>(ale_fix)
nnoremap <leader>at :ALEToggle<CR>

" jedi-vim
autocmd FileType python setlocal completeopt-=preview
let g:jedi#show_call_signatures = "1"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>c"
let g:jedi#goto_stubs_command = "<leader>x"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "<leader>e"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>q"
nnoremap <leader>q :ccl<CR>


"let g:ale_lint_delay
"let g:ale_python_pylint_options = '--disable=missing-function-docstring,
            "\invalid-name,
            "\redefined-outer-name,
            "\using-constant-test --enable=line-too-long'

"""""""""
" LATEX "
"""""""""

" For Latex files
let maplocalleader = "t"
let g:vimtex_fold_enabled=1
set fillchars=fold:\ 
let g:vimtex_quickfix_ignore_filters = ['Font Warning', 'Missing', 'nips']
"let g:vimtex_quickfix_open_on_warning = 0
" should be "\ "

"""""""""""""""""
" OTHER PLUGINS "
"""""""""""""""""


" NerdCommenter
"nnoremap ,<space> :call NERDComment(0,"toggle")<CR>
"vnoremap ,<space> :call NERDComment(0,"toggle")<CR>

" Notes
"let g:vim_markdown_folding_disabled = 1
"nnoremap ,ww :e ~/Documents/notes/index.md<cr>
"nnoremap ,v :MarkdownPreview<cr> 

" count number of words
"function! WC()
    "let filename = expand("%")
    "let cmd = "detex " . filename . " | wc -w"
    "let result = system(cmd)
    "echo result 
"endfunction

"command WC call WC()

" spell checking
" 1) :set spell
" 2) :set spelllang=es
"    :set spelllang=en
"    :set spelllang=fr
" 3) :set nospell
" z= suggestions
" zg add word
" zw remove word
" zG add word temporarily
" ]s next
" [s previous

"function! ToggleSpellLang()
    "" toggle between en and fr
    "if &spelllang =~# 'en'
        ":set spelllang=es
    "else
        ":set spelllang=en
    "endif
"endfunction
"nnoremap <F7> :setlocal spell!<CR> " toggle spell on or off
"nnoremap <F8> :call ToggleSpellLang()<CR> " toggle language

" grammar checking language tool
"let g:languagetool_jar='$HOME/.vim/LanguageTool-4.7/languagetool-commandline.jar'
"let g:languagetool_lang='fr'


"change cursor shape
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[5 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[3 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif
