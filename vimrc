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
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-commentary'

call plug#end()


" -- Display
set title               " Update terminal title
set number              " Display line number of current line
set relativenumber      " Display relative line numbers for other lines
set ruler               " Display cursor position
set wrap                " Wrap long lines
set scrolloff=3         " Display at least 3 lines around cursor
set guioptions=T        " Enable the toolbar
" colorscheme slate       " Use slate color scheme
set showcmd
set background=dark     " Dark background

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

" -- Goyo / Limelight

function! s:goyo_enter()
    Limelight
endfunction

function! s:goyo_leave()
    Limelight!
endfunction

" Enable and disable Limelight with Goyo
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" -- Limelight
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7


" -- Key bindings
" ctrl-L to clear search
nnoremap <C-L> :nohl<CR><C-L>
" Yank to end of line
map Y y$
" Open NERDTree file explorer
map <C-n> :NERDTreeToggle<CR>

" -- True color support
"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

