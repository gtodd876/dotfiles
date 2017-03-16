" Configuration file for VIM

" Basic options
set nocompatible              " The most important VIM option
set incsearch                 " If the terminal is slow, turn this off
"set digraph                   " required for umlauts
"set textwidth=76              " widths no longer than this
set nostartofline             " on paging, don't go to start of line
set tabstop=2                 " set the default tabstops
set shiftwidth=2              " set the default autoindent
set ai                        " turn on auto indent
set formatoptions=cqt         " text formatting command options "gq"
set ignorecase                " ignore case in searches ... (\c\C override)
set nonumber                    " show line numbers
set smartcase                 " ... unless there are caps in the search
set report=0                  " on s/// report all changes
set showmatch                 " Show the matching bracket
set wildmode=longest,list     " Completion for wildchar (see help)

" viminfo is really neat.  It stores the the state of your previous
" editing sessions so that next start is as if you never quit.
set viminfo=%,'50,\"100,:100,n~/.viminfo
" Go to last cursor location, ie. goto mark(double_quote) 
" When used with viminfo, it's as if you never left VIM at all!
:au BufReadPost * if
    \ line("'\"")
    \ && line("'\"") <= line("$")
    \ | exe "normal `\""
    \ | endif

" Set up the terminal  -- use ttytype to override the terminal
set laststatus=2              " show status line all the time
set ruler                     " we want to know where we are
set rulerformat=\L%l\ \C%c%V%=\ %P
set scrolloff=5               " don't scroll any closer to top/bottom
set sidescrolloff=20          " don't scroll any closer to left/right
set ttyscroll=25              " turning off scrolling makes the tty faster
set nottybuiltin              " Most of the systems I use have good termcaps
set ttyfast                   " The terminal is probably fast
" set title                     " Sets the title bar
set hlsearch                  " highlight search
set background=dark           " I almost always use dark backgrounds
syntax on                     " I love syntax highlighting
"highlight Normal guibg=Black guifg=White
colorscheme Tomorrow-Night 
set guifont=Source\ Code\ Pro:h13
set backspace=2               " Set for maximum backspace smartness
if(v:version >= 500)
    set lazyredraw            " don't redraw during macros
endif

" Errors and bells
set errorbells                " ring bell for errors

" Backup/File options
"set autowrite                 " write automatically on :next, etc.
set nowritebackup             " don't make a backup while saving file
set nobackup                  " don't save backups (*~ files)

" Settings for the spell plugin
let spell_executable="aspell"
let spell_root_menu   = '-'
let spell_auto_type   = ''
let spell_insert_mode = 0

" Turn off highlighting after moving
:map j <Down>:nohlsearch<CR>
:map k <Up>:nohlsearch<CR>
:map h <Left>:nohlsearch<CR>
:map l <Right>:nohlsearch<CR>

" Handy maps
" emacs style movement keys
cnoremap <C-A> <Home>
cnoremap <C-B> <Left>
cnoremap <ESC>b <S-Left>
cnoremap <ESC>f <S-Right>
cnoremap <ESC><C-H> <C-W>

nnoremap <C-D>  <Del>
"nnoremap <C-F>  <Right>
"nnoremap <C-B>  <Left>
nnoremap <C-A>  <Home>
nnoremap <C-E>  <End>
nnoremap <C-N>  <Down>
nnoremap <C-P>  <Up>

inoremap <C-D>  <Del>
inoremap <C-F>  <Right>
inoremap <C-B>  <Left>
inoremap <C-A>  <Home>
inoremap <C-E>  <End>
inoremap <C-N>  <Down>
inoremap <C-P>  <Up>

vnoremap <C-D>  <Del>
vnoremap <C-F>  <Right>
vnoremap <C-B>  <Left>
vnoremap <C-A>  <Home>
vnoremap <C-E>  <End>
vnoremap <C-N>  <Down>
vnoremap <C-P>  <Up>

"vnoremap <C-F>  <PageDown>
"vnoremap <C-B>  <PageUp>
"noremap <C-F>  <PageDown>
"noremap <C-B>  <PageUp>

" Git
hi def link gitcommitOverflow Error
au FileType gitcommit set tw=72
au FileType gitcommit call setpos('.', [0, 1, 1, 0])

if has("unix")
  let vimrc='~/.vimrc'
else
  let vimrc='$VIM\_vimrc'
endif
if(v:version >= 600)
  nnoremap <Leader>u          :source <C-R>=vimrc<CR><CR>
  nnoremap <Leader>v          :edit   <C-R>=vimrc<CR><CR>
  cmap     <Leader>dedos      %s/<C-M>//g
else
  nnoremap ,u                 :source <C-R>=vimrc<CR><CR>
  nnoremap ,v                 :edit   <C-R>=vimrc<CR><CR>
  cmap     ,dedos             %s/<C-M>//g
endif

" ------------------>8--------cut--------8<--------------------
" vim modeline -- sets the width to 70, expands tabs,
"                 sets the shiftwidth to 4 and sets legit comment characters
"       vim:tw=70 et sw=4 comments=\:\"
