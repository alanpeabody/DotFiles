"Must be set first - Makes Vim behave in a way not compatible with Vi. Needed for most modern plugins
set nocompatible

" auto load all plugins in .vim/bundle/
source ~/.vim/bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()

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
set gfn=Droid\ Sans\ Mono\ 10

" Use 256 color terminal
" sudo apt-get install ncurses-term
set term=xterm-256color

syntax enable
set background=dark

"colorscheme vividchalk
"colorscheme railscasts
"colorscheme dark-ruby
"let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized


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

" Use wildmenu!
set wildmenu
set wildmode=list:longest,full

" Show trailing whitespace
set list listchars=tab:\ \ ,trail:·

" Better auto indenting?
filetype off
filetype plugin indent on

" Code folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" Ubuntu uses ack-grep instead of ack.
let g:ackprg="ack -H --nocolor --nogroup --column"

" Command T settings
set wildignore+=tmp/*,logs/*,.git,coverage/*,.log
let g:CommandTMaxHeight=15

" Edit routes
command! Rroutes :R config/routes.rb
command! RSroutes :RS config/routes.rb
command! RTroutes :RT config/routes.rb
command! RVroutes :RV config/routes.rb

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
" On Linux you need to install the package 'autocutsel' and add the following
" to xinit.rc:
" autocutsel -fork &
" autocutsel -selection PRIMARY -fork &
" This fixes some wonky behavior due to X11s remote desktop history and keeps
" all your clipboards the same across all your apps. See:
" http://mutelight.org/articles/subtleties-of-the-x-clipboard
set clipboard=unnamed

noremap <leader>n :NERDTreeToggle<CR>

" Change ruby 1.8 hash syntax to 1.9, with confirmation
map <leader>h :%s/:\(\w*\)\(\s*\)=>\(\s*\)/\1:\3/gc<CR>

" Change ruby 1.8 hash syntax to 1.9, without confirmation
map <leader>H :%s/:\(\w*\)\(\s*\)=>\(\s*\)/\1:\3/g<CR>

" Remove trailing whitespace
map <leader>w :%s/\s\+$//g<CR>

" Replace tabs with two spaces
map <leader>W :retab<CR>

" Align cucumber tables.
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
