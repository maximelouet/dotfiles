"Manage plugins with Vundle
set nocompatible
filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Load all plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ervandew/supertab'
Plugin 'raimondi/delimitmate'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'sjl/gundo.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/goyo.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'vim-airline/vim-airline'

"End loading plugins
call vundle#end()

"256 colors
set t_Co=256

"Snippets
let g:UltiSnipsSnippetsDir = "~/.vim/my_snippets"
let g:UltiSnipsSnippetDirectories=["my_snippets", "UltiSnips"]
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-b>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"

"Syntax coloration
set background=dark
colorscheme solarized

"Syntax processing
syntax on

"Powerline
let g:airline_powerline_fonts = 1

"Syntaxt check with Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_jump = 1

"vim-markdown configuration
let g:vim_markdown_folding_disabled = 1

"Correct indentation
filetype plugin indent on

"Invisibles
set listchars=tab:..,eol:¬,trail:~
set list
hi NonText ctermfg=241 ctermbg=none
hi SpecialKey ctermfg=241 ctermbg=none

"Correct indentation (for Epitech currently)
set softtabstop=2
set shiftwidth=2

"But still insert tab
inoremap <F2> <C-V><Tab>

"Show line numbers
set number
set relativenumber
hi linenr ctermbg=none

"Set line cursor
set cursorline
hi cursorlinenr ctermbg=0

"Wildmenu
set wildmenu

"Show matching chars
set showmatch
hi MatchParen ctermfg=5 ctermbg=none

"Better search
set incsearch
set hlsearch

set laststatus=2

"More than 80 chars is bad
if exists('+colorcolumn')
  hi colorcolumn ctermbg=0
  set colorcolumn=80
else
  match OverLength /\%81v.\+/
endif

"Keyboard shortcuts
nnoremap <F6> :GundoToggle<CR>
nnoremap <F5> :NERDTreeTabsToggle<CR>



" because that happens way too much
imap :w<Enter> <Esc>:w<Cr> i
imap :x<Enter> <Esc>:x<Cr> i
imap :wq<Enter> <Esc>:wq<Cr> i
imap :wa<Enter> <Esc>:wa<Cr> i
imap :wqa<Enter> <Esc>:wqa<Cr> i
