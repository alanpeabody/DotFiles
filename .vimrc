"Must be set first - Makes Vim behave in a way not compatible with Vi. Needed for most modern plugins
set nocompatible

" auto load all plugins in .vim/bundle/
call pathogen#runtime_append_all_bundles()

" Buffers do not have to be saved before they can be hidden. Might be confusing for some.
set hidden

"always set terminal title
set title

" guioptions e = show tabs, m = show menu
set guioptions=e

" Always show status line
set laststatus=2

" Show file name first in status bar
set statusline=%t

" Show rvm version in status line
set statusline+=%{rvm#statusline()}

" Show git info in status lines
set statusline+=%{fugitive#statusline()}

" My preferred font and size (open source)
" set gfn=DejaVu\ Sans\ Mono\ 11
set gfn=Droid\ Sans\ Mono\ 11

" Use 256 color terminal
" sudo apt-get install ncurses-term
" set term=xterm-256color

"colorscheme vividchalk
"colorscheme railscasts
"colorscheme dark-ruby

" Remember last 1000 commands
set history=1000

" Show line numbers
set number
set ruler

" Searches are case insensitive unless you use a capital letter. /str/i forces case sensitivity
set ignorecase
set smartcase

" Turn on spell checking (i need it)
set spell

" Tabs set to always be two spaces
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
set autoindent

" Better auto indenting?
filetype off
filetype plugin indent on

" Ubuntu uses ack-grep instead of ack.
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" Command T settings
set wildignore+=tmp/*,logs/*,.git
let g:CommandTMaxHeight=15

" Edit routes
command! Rroutes :Redit config/routes.rb
command! RSroutes :RSedit config/routes.rb
command! RTroutes :RTedit config/routes.rb
command! RVroutes :RVedit config/routes.rb

" store backups in central location
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Automatically highlight scss as css.
autocmd BufNewFile,BufRead *.scss set filetype=css

" highlight thor as ruby
autocmd BufNewFile,BufRead *.thor set filetype=ruby


" Map jj to escape
imap jj <Esc>

" Change the leader to ,
let mapleader=","

" Map ; to :
nnoremap ; :

" Easy window nav
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Easy tab nav
map <C-n> :tabnext<CR>
map <C-p> :tabprev<CR>

" up and down by visual line, not line number
nnoremap j gj
nnoremap k gk

" Move current line up or down
nnoremap <leader>k ddkP
nnoremap <leader>j ddp

" Move current work left or right
nnoremap <leader>h "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><C-o><C-l>
nnoremap <leader>l "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><C-o>/\w\+\_W\+<CR><C-l>

" Quickly edit/reload the .vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Disable arrow keys.
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Use global clipboard so you can interact with the world
set clipboard=unnamed

" ConqueTerm terminals update when not focused.
let g:ConqueTerm_ReadUnfocused = 1
