" Saumon NeoVim config

let $VIMHOME = glob('/data/.config/nvim')

" Plug (owi)
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/syntastic'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'airblade/vim-gitgutter'
Plug 'arakashic/nvim-colors-solarized'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
call plug#end()

" Plugins configurations

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1 " needed for powerline

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
filetype plugin indent on

"Syntax check
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_jump = 0

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark " or light
colorscheme solarized




set termguicolors

set shell=/usr/bin/zsh
set t_Co=256

set showmode          	" display current mode blow the status line
set showtabline=2     	" show tabbar even for a single buffer
set laststatus=2      	" always show the status line
set ruler             	" display line/col position in the status line
set cursorline        	" highlight current line
set splitbelow        	" consistency with most tiling WMs (wmii, i3…)
set splitright        	" consistency with most tiling WMs (wmii, i3…)
set virtualedit=block 	" easier rectangular selections

" Display relative line numbers
set relativenumber
" display the absolute line number at the line you're on
set number


set scrolloff=3       	" number of screen lines to show around the cursor


set encoding=utf-8

" this should be the default but some distros disable modelines by default…
set modeline
set modelines=5

set showmatch         	" when inserting a bracket, briefly jump to its match


" 80-character lines (= Mozilla guidelines)
set textwidth=80      	" line length above which to break a line
set colorcolumn=+0    	" highlight the textwidth limit
set nowrap

" search settings
set ignorecase      	" search is case-insensitive…
set smartcase           " wtf is that
set hlsearch        	" highlight search results
set incsearch       	" incremental search: find as you type



"Invisibles
set listchars=tab:..,eol:¬,trail:~
set list
hi NonText ctermfg=241 ctermbg=none
hi SpecialKey ctermfg=241 ctermbg=none

"Correct indentation (for Epitech currently)
set softtabstop=2
set shiftwidth=2

"But still insert tab
inoremap ² <C-V><Tab>
inoremap <F2> <C-V><Tab>

"Show line numbers
hi linenr ctermbg=0

"Set line cursor
set cursorline
hi cursorlinenr ctermbg=0
hi CursorLine cterm=NONE ctermbg=0
hi linenr ctermbg=NONE


" I don't like mouse
set mouse=

" swap files
set directory=~/.local/share/nvim/swapfiles

" persistent undo across sessions
if has('persistent_undo')
    set undodir=~/.local/share/nvim/undodir
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

" because that happens way too much
imap :w<Enter> <Esc>:w<Cr> i
imap :x<Enter> <Esc>:x<Cr> i
imap :wq<Enter> <Esc>:wq<Cr> i
imap :wa<Enter> <Esc>:wa<Cr> i
imap :wqa<Enter> <Esc>:wqa<Cr> i


" wtf
let g:netrw_dirhistmax = 0
