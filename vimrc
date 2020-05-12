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


" colorscheme
Plugin 'rafi/awesome-vim-colorschemes' 

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""
" GENERAL "
"""""""""""
" colors

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
vnoremap [y "+y
nnoremap [p "+p

" Highlight search
nnoremap ,s :set hlsearch!<CR>

" Change wrapped line
nnoremap zj gj
nnoremap zk gk

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
nnoremap <space> viw<left> 

" Add blank line
nnoremap <Enter> o<Esc>


" Update .vimrc easily
nnoremap ,r :split $MYVIMRC<cr> 
nnoremap <c-z> :source $MYVIMRC<cr>

" New split open on the right
set splitright

" Move cursor to different panel
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-h> <c-w><c-h>
nnoremap <c-l> <c-w><c-l>

" Resize panels
nnoremap zl :vertical resize +5<CR>
nnoremap zh :vertical resize -5<CR>
nnoremap zj :resize +2<CR>
nnoremap zk :resize -2<CR>

" disable mouse
"set mouse=
set mouse=a
"set ttymouse=

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
autocmd FileType python :ALEToggle
"autocmd FileType tex :ALEToggle
"let g:ale_linters = {'python': ['flake8'],'tex': ['chktex']}
let g:ale_linters = {'python': ['flake8']}
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_echo_msg_format = '[%linter%] (%code%) %s'
let g:ale_python_black_options ='-l 79' 
let b:ale_fixers = {
            \'python': ['trim_whitespace', 'remove_trailing_lines', 'black'],
            \'tex': ['trim_whitespace', 'remove_trailing_lines', 'latexindent']
            \}
"ignore warning whitespace before colon (black compatibility)
let g:ale_python_flake8_options ='--ignore=E203,W605' 
nmap <silent> ,d <Plug>(ale_previous_wrap)
nmap <silent> ,f <Plug>(ale_next_wrap)
nmap <silent> ,g <Plug>(ale_fix)

" jedi-vim
autocmd FileType python setlocal completeopt-=preview
let mapleader=","
let g:jedi#show_call_signatures = "1"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = ""
let g:jedi#goto_stubs_command = "<leader>s"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "<leader>e"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"


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
let g:vimtex_quickfix_ignore_filters = ['Font Warning']
" should be "\ "

"""""""""""""""""
" OTHER PLUGINS "
"""""""""""""""""


" NerdCommenter
nnoremap ,<space> :call NERDComment(0,"toggle")<CR>
vnoremap ,<space> :call NERDComment(0,"toggle")<CR>

" Notes
let g:vim_markdown_folding_disabled = 1
nnoremap ,ww :e ~/Documents/notes/index.md<cr>
nnoremap ,v :MarkdownPreview<cr> 

"let cmd = "detex " . filename . " | wc -w | tr -d [:space:]"
" count number of words
function! WC()
    let filename = expand("%")
    let cmd = "detex " . filename . " | wc -w"
    let result = system(cmd)
    echo result 
endfunction

command WC call WC()

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
