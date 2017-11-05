" VIM Configuration - Cas Eliëns
" ---

" Install vim-plug if it is not yet installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Load vim-plug
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'

call plug#end()


" -- Display
set title               " Update terminal title
set number              " Display line number of current line
set relativenumber      " Display relative line numbers for other lines
set ruler               " Display cursor position
set wrap                " Wrap long lines
set scrolloff=3         " Display at least 3 lines around cursor
set guioptions=T        " Enable the toolbar
colorscheme slate	" Use slate color scheme
set showcmd

" -- Search
set ignorecase          " Ignore case when searching
set smartcase           " Become case sensitive when search includes capital letters
set incsearch           " Highlight search results live
set hlsearch            " Highlight search results

" -- Beep
set visualbell          " Don't beep please
set noerrorbells        " Seriously, don't beep please
set t_vb=

" -- Command completion
set wildmenu            " Enable command completion
" set wildmode=longest:list,full

" -- Editing convenience
filetype indent plugin on
syntax on
set autoindent
set backspace=indent,eol,start
set hidden
set nostartofline
set laststatus=2        " Always show status line
set confirm             " Ask for confirmation when a command could otherwise fail 
set cmdheight=2         " Make command input height 2 lines tall
set notimeout ttimeout ttimeoutlen=200 " Make entering commands less of a pain
set pastetoggle=<F11>   " F11 toggles paste mode (stop auto indentation)
set mouse=a
set shiftwidth=4
set softtabstop=4
set expandtab

" -- NERDTree
" Close vim if only NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" -- Key bindings
" ctrl-L to clear search
nnoremap <C-L> :nohl<CR><C-L>
" Yank to end of line
map Y y$
" Open NERDTree file explorer
map <C-n> :NERDTreeToggle<CR>
