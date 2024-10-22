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
"Plugin 'vim-airline/vim-airline'

" class outline
Plugin 'preservim/tagbar'

" Python Autocompletion
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'

" closing brackets
Plugin 'jiangmiao/auto-pairs'

" syntax highlighting
"Plugin 'sheerun/vim-polyglot'

" linting
Plugin 'dense-analysis/ale'

" Latex plugin
Plugin 'lervag/vimtex'

Plugin 'vimwiki/vimwiki'

" Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
""Plugin 'masukomi/vim-markdown-folding' 

" colorscheme
Plugin 'rafi/awesome-vim-colorschemes' 

"start page
Plugin 'mhinz/vim-startify'

"fzf
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

Plugin 'tpope/vim-fugitive'

Plugin 'chrisbra/Recover.vim' 

Plugin 'mbbill/undotree'

"Plugin 'evansalter/vim-checklist'

Plugin 'junegunn/goyo.vim'

Plugin 'SirVer/ultisnips'

"Plugin 'https://gitlab.com/dbeniamine/todo.txt-vim'
Plugin 'dbeniamine/todo.txt-vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

if has("autocmd")
  filetype plugin indent on
endif
"""""""""""
" GENERAL "
"""""""""""
let mapleader=" "

" git / fugitive
command Gc Git commit -v

"enclose in quotes
vnoremap mq c""<esc>P
vnoremap ms c''<esc>P
vnoremap mp c()<esc>P
nnoremap <leader>mq viwc""<esc>P

"ultisnips
nnoremap <leader>; :UltiSnipsEdit<cr>
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

set wildmenu
set wildignorecase
set ignorecase
set smartcase
"avoid tmux typo
nnoremap <C-a> <nop>

" fix backspace
set backspace=indent,eol,start

"remap space key
nnoremap <SPACE> <Nop>

"fzf
let g:fzf_action = {
\ 'ctrl-x': 'split',
\ 'ctrl-v': 'vsplit' }
nnoremap <leader>y :GFiles<CR>
nnoremap <leader>s :Files<CR>
nnoremap <leader>v :Buffers<CR>
nnoremap <leader>w :Rg<CR>
"let g:fzf_preview_window = ['up:0%:hidden', 'ctrl-/']
let g:fzf_layout = { 'down': '~25%' }
"let g:AutoPairsShortcutToggle = '<leader>p'
let g:AutoPairsShortcutToggle = '<F4>'

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
"colorscheme PaperColor
"colorscheme lightning
"colorscheme nord
"colorscheme anderson
let g:gruvbox_contrast_dark='medium'

" change color foreground to white
hi Normal ctermfg=15
"hi Normal ctermfg=7
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
"nnoremap K 5kz.
"nnoremap J 5jz.


" Indent blocks
vnoremap > >gv
vnoremap < <gv

" Go to normal mode
inoremap jk <esc>
inoremap JK <esc>
inoremap jK <esc>
noremap K <nop>
noremap J <nop>

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


"makefiles
autocmd FileType make set list listchars=tab:>-

" todo.txt
" sort : tsp
let g:TodoTxtUseAbbrevInsertMode=1
"completion
au filetype todo setlocal omnifunc=todo#Complete

"""""""
"NOTES"
"""""""
function! MyMarkdownLint() abort
    setlocal shiftwidth=2 softtabstop=2 expandtab
    "let g:markdown_folding=1
    let g:markdown_folding=0
    let g:markdown_flavor='github'
    let g:vim_markdown_folding_style_pythonic = 1
    "set conceallevel=0
    set conceallevel=1
    let g:vim_markdown_conceal_code_blocks = 0
    "let g:vim_markdown_math = 1
    let g:vim_markdown_math = 0
    let g:vim_markdown_new_list_item_indent = 2
    "set foldlevelstart=20
    let g:vim_markdown_folding_level = 6
    hi! link htmlH1 GruvboxRedBold
    hi! link htmlH2 GruvboxOrangeBold
    hi! link htmlH3 GruvboxYellow
    hi! link htmlH4 GruvboxAqua
    hi! link htmlH5 GruvboxBlue
    hi! link htmlH6 GruvboxGray
    hi! link mkdHeading GruvboxGray
endfunction
autocmd BufNewFile,BufReadPost *.md call MyMarkdownLint() | set filetype=markdown
au BufNewFile,BufRead *.tex setlocal tabstop=2 softtabstop=2 shiftwidth=2

"hi! link mkdListItem markdownListMarker
"hi! link mkdListItemLine markdownListMarker
"hi! link mkdBold Bold
"hi! link mkdItalic Italic
"call s:hi("mkdCode", s:nord7_gui, "", s:nord7_term, "", "", "")
"call s:hi("mkdFootnote", s:nord8_gui, "", s:nord8_term, "", "", "")
"call s:hi("mkdRule", s:nord10_gui, "", s:nord10_term, "", "", "")
"call s:hi("mkdLineBreak", s:nord9_gui, "", s:nord9_term, "", "", "")
"hi! link mkdBold Bold
"hi! link mkdItalic Italic
"hi! link mkdString Keyword
"hi! link mkdCodeStart mkdCode
"hi! link mkdCodeEnd mkdCode
"hi! link mkdBlockquote Comment
"hi! link mkdListItem Keyword
"hi! link mkdListItemLine Normal
"hi! link mkdFootnotes mkdFootnote
"hi! link mkdLink markdownLinkText
"hi! link mkdURL markdownUrl
"hi! link mkdInlineURL mkdURL
"hi! link mkdID Identifier "CHECK
"hi! link mkdLinkDef mkdLink
"hi! link mkdLinkDefTarget mkdURL
"hi! link mkdLinkTitle mkdInlineURL
"hi! link mkdDelimiter Keyword

let g:startify_file_number = 2
"let g:startify_lists = [\ { 'type': 'bookmarks', 'header': [   'Bookmarks:']      },\ { 'type': 'files', 'header': [   'Remember Me:']       },\ ]
let g:startify_custom_header=[]
let g:startify_bookmarks = [{'r':'~/.config/vim/vimrc'},
            \ {'nm':'~/notes/meeting_notes.md'},
            \ {'ns':'~/notes/self.md'},
            \ {'v':'~/.config/env'},
            \ {'w':'~/vimwiki/index.md'},
            \ {'t':'.'},
            \ {'z':'~/.config/zsh/.zshrc'}]
"let g:vim_markdown_folding_disabled=0
"let g:vim_markdown_folding_style_pythonic=1


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

"highlight self
augroup python
    autocmd!
    autocmd FileType python
                \   syn keyword pythonSelf self
                \ | highlight def link pythonSelf Special
augroup end


"vim polyglot
let g:python_highlight_all = 1
"to avoid conflict with vimtex
"let g:polyglot_disabled = ['latex', 'markdown']

"vim ale
":ALEInfo
":ALEDetail
":ALEFix
let g:ale_enabled = 0
let g:ale_echo_cursor = 1
let g:ale_set_balloons = 1
"autocmd FileType python :ALEToggle
"autocmd FileType tex :ALEToggle
"let g:ale_linters = {'python': ['flake8'],'tex': ['chktex']}
"let g:ale_linters = {'python': ['flake8'], 'markdown':['languagetool']}
let g:ale_echo_msg_format = '[%linter%] (%code%) %s'
let g:ale_python_black_options ='-l 79' 
let b:ale_linter_aliases = {'tex': ['tex', 'text']}
let g:vimtex_compiler_latexmk = {'build_dir' : 'build'}
let g:ale_linters = {'python': ['flake8'], 'tex':['languagetool']}
let g:ale_fixers = {
            \'python': ['trim_whitespace', 'remove_trailing_lines', 'black'],
            \'tex': ['trim_whitespace', 'remove_trailing_lines', 'latexindent']
            \}
"let g:ale_fixers = {
            "\'python': ['trim_whitespace', 'remove_trailing_lines'],
            "\'tex': ['trim_whitespace', 'remove_trailing_lines', 'latexindent']
            "\}
"ignore warning whitespace before colon (black compatibility)
let g:ale_python_flake8_options ='--ignore=E203,W605,W503' 
"let g:ale_lint_on_text_changed = 'never'
"let g:ale_lint_on_insert_leave = 1
"let g:ale_lint_on_save = 1
"let g:ale_lint_on_enter = 0
nmap <silent> <leader>d <Plug>(ale_previous_wrap)
nmap <silent> <leader>f <Plug>(ale_next_wrap)
nmap <silent> <leader>g <Plug>(ale_fix)
nnoremap <leader>at :ALEToggle<CR>

" ALE LanguageTool
let g:ale_languagetool_executable="java"
"let g:ale_languagetool_options="-jar ~/Downloads/LanguageTool-4.7/languagetool-commandline.jar -l en-GB"
let g:ale_languagetool_options="-jar ~/Downloads/LanguageTool-5.5/languagetool-commandline.jar -l en-US -d MORFOLOGIK_RULE_EN_US"
"MORFOLOGIK_RULE_EN_US
"let g:ale_languagetool_options="-cp ~/Downloads/LanguageTool-4.7/languagetool-server.jar org.languagetool.server.HTTPServer --port 8081"

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
            "
" undotree
let g:undotree_ShortIndicators=1
nnoremap <leader>u :UndotreeToggle<cr>
"function g:Undotree_CustomMap()
"nnoremap J <nop>
"nnoremap K <nop>
function g:Undotree_CustomMap()
    nmap <buffer> J <plug>UndotreeNextState
    nmap <buffer> K <plug>UndotreePreviousState
endfunc

"""""""""
" LATEX "
"""""""""

" For Latex files
let g:tex_flavor = 'latex'
let maplocalleader = "t" " also for todo.txt-vim
let g:vimtex_fold_enabled=1
set fillchars=fold:\ 
let g:vimtex_quickfix_ignore_filters = ['Font Warning', 'Missing', 'nips']
"let g:vimtex_latexmk_options = '-pdf -shell-escape -verbose -file-line-error -synctex=1 -interaction=nonstopmode'
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

"jump quickfix
nnoremap [q :cp<CR>
nnoremap ]q :cn<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>
nnoremap <leader>m :ccl<CR>
nnoremap <BS> <C-^>


" custom commands

"print syntax item id under cursor
command  Syid :echo synIDattr(synID(line("."), col("."), 1), "name")

function! s:syntax_query() abort
  for id in synstack(line("."), col("."))
    "echo synIDattr(id, "name")
    execute 'hi' synIDattr(id, "name")
  endfor
endfunction
command! SyntaxQuery call s:syntax_query()
nnoremap <leader>, :SyntaxQuery<CR>


"checkboxes
"let mapleader=" "
"nnoremap <leader>cg :ChecklistToggleCheckbox<cr>
""nnoremap <leader>ce :ChecklistEnableCheckbox<cr>
""nnoremap <leader>cd :ChecklistDisableCheckbox<cr>
"vnoremap <leader>cg :ChecklistToggleCheckbox<cr>
"vnoremap <leader>ce :ChecklistEnableCheckbox<cr>
"vnoremap <leader>cd :ChecklistDisableCheckbox<cr>
"
" VIMWIKI
nmap <Plug>NoVimwikiIndex                  <Plug>VimwikiIndex
nmap <Plug>NoVimwikiTabIndex               <Plug>VimwikiTabIndex
nmap <Plug>NoVimwikiUISelect               <Plug>VimwikiUISelect
nmap <Plug>NoVimwikiDiaryIndex             <Plug>VimwikiDiaryIndex
nmap <Plug>NoVimwikiMakeDiaryNote          <Plug>VimwikiMakeDiaryNote
nmap <Plug>NoVimwikiTabMakeDiaryNote       <Plug>VimwikiTabMakeDiaryNote
nmap <Plug>NoVimwikiMakeYesterdayDiaryNote <Plug>VimwikiMakeYesterdayDiaryNote
nmap <Plug>NoVimwikiMakeTomorrowDiaryNote  <Plug>VimwikiMakeTomorrowDiaryNote
nmap <Plug>NoVimwiki2HTML                  <Plug>Vimwiki2HTML
nmap <Plug>NoVimwiki2HTMLBrowse            <Plug>Vimwiki2HTMLBrowse
nmap <Plug>NoVimwikiDiaryGenerateLinks     <Plug>VimwikiDiaryGenerateLinks
nmap <Plug>NoVimwikiDeleteFile             <Plug>VimwikiDeleteFile
nmap <Plug>NoVimwikiRenameFile             <Plug>VimwikiRenameFile
nmap <Plug>NoVimwikiRenameFile             <Plug>VimwikiRenameFile
nmap <Plug>NoVimwikiGoBackLink             <Plug>VimwikiGoBackLink
"nmap <Plug>NoVimwikiFollowLink             <Plug>VimwikiFollowLink
nmap <SPACE>l             <Plug>VimwikiFollowLink

nmap <leader>nw                  <Plug>VimwikiIndex
let g:vimwiki_list = [{'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_ext2syntax = {'.md': 'markdown'}
let g:vimwiki_markdown_link_ext = 1
let g:vimwiki_global_ext = 1
let g:vimwiki_key_mappings = { 'table_mappings': 0 }

" vimwiki checklist checkbox todo list leader
" gln or glp to change status

"let g:vimwiki_list = [{'path': $HOME, 'syntax': 'markdown', 'ext': '.md'}]

let g:vimwiki_folding = 'expr'

autocmd FileType vimwiki setlocal syntax=markdown

autocmd FileType vimwiki setlocal foldenable

"nmap <silent> <Plug>VimwikiTabIndex
"nmap <silent> <Plug>VimwikiUISelect
"nmap <silent> <Plug>VimwikiDiaryIndex
"nmap <silent> <Plug>VimwikiMakeDiaryNote
"nmap <silent> <Plug>VimwikiTabMakeDiaryNote
"nmap <silent> <Plug>VimwikiMakeYesterdayDiaryNote
"nmap <silent> <Plug>VimwikiMakeTomorrowDiaryNote
"nmap <silent> <Plug>Vimwiki2HTML
"nmap <silent> <Plug>Vimwiki2HTMLBrowse
"nmap <silent> <Plug>VimwikiDiaryGenerateLinks
"nmap <silent> <Plug>VimwikiDeleteFile
"nmap <silent> <Plug>VimwikiRenameFile

augroup encrypted
  au!

  " First make sure nothing is written to ~/.viminfo while editing
  " an encrypted file.
  autocmd BufReadPre,FileReadPre *.gpg set viminfo=
  " We don't want a swap file, as it writes unencrypted data to disk
  autocmd BufReadPre,FileReadPre *.gpg set noswapfile

  " Switch to binary mode to read the encrypted file
  autocmd BufReadPre,FileReadPre *.gpg set bin
  autocmd BufReadPre,FileReadPre *.gpg let ch_save = &ch|set ch=2
  " (If you use tcsh, you may need to alter this line.)
  autocmd BufReadPost,FileReadPost *.gpg '[,']!gpg2 --decrypt 2> /dev/null

  " Switch to normal mode for editing
  autocmd BufReadPost,FileReadPost *.gpg set nobin
  autocmd BufReadPost,FileReadPost *.gpg let &ch = ch_save|unlet ch_save
  autocmd BufReadPost,FileReadPost *.gpg execute ":doautocmd BufReadPost " . expand("%:r")

  " Convert all text to encrypted text before writing
  " (If you use tcsh, you may need to alter this line.)
  "autocmd BufWritePre,FileWritePre *.gpg '[,']!gpg --default-recipient-self -ae 2>/dev/null
  autocmd BufWritePre,FileWritePre *.gpg '[,']!gpg2 -c 2>/dev/null
  " Undo the encryption so we are back in the normal text, directly
  " after the file has been written.
  autocmd BufWritePost,FileWritePost *.gpg u
augroup END

"remote sync
"let rsync_remotepath="vasher:/home/tbodrito/sparse/baseline/"
"let rsync_localpath="~/thoth/sync/baseline/"
"nnoremap <expr>  <C-b> ":w<CR>:!rsync -avr " . rsync_localpath . " " . rsync_remotepath
"
"

" tagbar
nmap <F8> :TagbarToggle<CR>
"let g:tagbar_width = max([25, winwidth(0) / 1])
let g:tagbar_width = 40

set complete=.


" highlight word under cursor without jumping to it 
nnoremap * :keepjumps normal! mi*`i<CR>

" do not jump to word after search
nnoremap / :setl hls \| let @/ = input('/')<cr>

augroup SetCMS
    autocmd FileType vimwiki let &l:commentstring='<!-- %s -->'
augroup END
