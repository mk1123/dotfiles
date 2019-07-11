" Manan Khattar
" Colors {{{
syntax enable
set termguicolors
" }}}
" Misc {{{
set backspace=indent,eol,start
set clipboard=unnamed	" makes the clipboard correspond to the unnamed register
" }}}
" Spaces & Tabs {{{
set tabstop=4	" 4 space tab
set softtabstop=4	" use spaces for tabs
set expandtab	" 4 space tab
set shiftwidth=4
set modelines=1
filetype plugin indent on
set autoindent
" }}}
" UI Layout {{{
set number	" show line numbers
set showcmd 	" show command in bottom bar
set nocursorline " highlight current line
set wildmenu
set lazyredraw
set showmatch 	" highlight matching parenthesis
" }}}
" Searching {{{
set ignorecase	" ignore case when searching
set incsearch	" search as characters are entered
set hlsearch 	" highlight all matches
" }}}
" Folding {{{
"=== folding ===
set foldmethod=indent	" fold based on indent level
set foldnestmax=10	" max 10 depth
set foldenable 		" don't fold files by default on open
nnoremap <space> za
set foldlevelstart=10 	" start with fold level of 1
" }}}
" Line Shortcuts {{{
nnoremap j gj
nnoremap k gk
" move to beginning/end of line
nnoremap B ^
nnoremap E $
" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>
nnoremap gB `[v`]
" }}}
" Fixing ag.vim {{{
let g:ackprg = 'ag --vimgrep --smart-case'                                                   
cnoreabbrev ag Ack                                                                           
cnoreabbrev aG Ack                                                                           
cnoreabbrev Ag Ack                                                                           
cnoreabbrev AG Ack 
" }}}
" Leader Shortcuts {{{
let mapleader=","
nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :so $MYVIMRC<CR>
nnoremap <leader>s :mksession<CR>
nnoremap <leader>a :Ag
nnoremap <leader>1 :set number!<CR>
nnoremap <leader>l :call <SID>ToggleNumber()<CR>
nnoremap <leader>j <C-z>
nnoremap <leader>m :CtrlP<CR>
nnoremap <silent> <leader>f :FZF<cr>
nnoremap <silent> <leader>F :FZF ~<cr>
" }}}

" CtrlP (commented out) {{{
"let g:ctrlp_match_window = 'bottom,order:ttb'
"let g:ctrlp_switch_buffer = 0
"let g:ctrlp_working_path_mode = 0
"let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|go\|Library\|temp\|Music\|iTerm'
"let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"set wildignore+=*/tmp/*,*/node_modules/*,*/go/*,*/temp/*,Music/*,.so,*.swp,*.zip     " MacOSX/Linux
"let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
"if executable('ag')
  "let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"endif
"set -gx FZF_DEFAULT_COMMAND  'rg --files --no-ignore-vcs --hidden'
let g:rg_command = "rg --files --no-ignore --follow -g '!{.git,node_modules,Library,env,Movies,Pictures,Applications,Pods}'"
"command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)
"
" }}}
" Autogroups {{{
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    "autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
                "\:call <SID>StripTrailingWhitespaces()
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END
" Reload on save
if has ('autocmd') " Remain compatible with earlier versions
 augroup vimrc     " Source vim configuration upon save
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
    autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
  augroup END
endif " has autocmd
" }}}
" Backups {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}
" Vim Plug {{{
call plug#begin('~/.vim/plugged')
Plug 'valloric/youcompleteme'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'damage220/vim-finder'
Plug 'nvie/vim-flake8'
Plug 'vim-scripts/DeleteTrailingWhitespace'
Plug 'bling/vim-airline'
Plug 'derekwyatt/vim-scala'
Plug 'elixir-editors/vim-elixir'
Plug 'fatih/vim-go'
Plug 'janko-m/vim-test'
Plug 'keith/swift.vim'
Plug 'kien/ctrlp.vim'
Plug 'leafgarland/typescript-vim'
Plug 'moll/vim-node'
Plug 'bling/vim-bufferline'
Plug 'scrooloose/syntastic'
Plug 'simnalamburt/vim-mundo'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'sjl/gundo.vim'
Plug 'mileszs/ack.vim'
call plug#end()
" }}}
" Airline {{{
set laststatus=2
let g:airline_theme = 'wombat'
let g:airline_left_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_sep = ''
" }}}
" Custom Functions {{{
function! <SID>ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunc

function! <SID>CleanFile()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %!git stripspace
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunc

function! <SID>RunFile()
    let ext = expand("%:e")
    if(ext == "go") 
        :GoRun
    endif
endfunc

function! <SID>BuildFile()
    let ext = expand("%:e")
    if(ext == "go") 
        :GoBuild
    endif
endfunc
" }}}
" Gundo {{{
let g:gundo_close_on_revert=1
" }}}
" Testing {{{
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>
" cycle through buffers
" }}}
" vim:foldmethod=marker:foldlevel=0
