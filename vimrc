set nocompatible								"We want the latest Vim settings/options.
syntax enable
let mapleader=" "								"The default leader is \ but space is better for me.
let NERDTreeHijackNetrw = 0							"Avoids NerdTree to hijack Netrw (and Vinegar) functionality.
let g:NERDTreeChDirMode       = 2						"make CtrlP's search directory change according to NerdTree's root.
let g:ctrlp_working_path_mode = 'rw'						"make CtrlP's search directory change according to NerdTree's root.
set backspace=indent,eol,start 							"Make backspace behave like every other editor.
let g:netrw_localrmdir='rm -r'							"Alloud remove non empty directories or folders.

"------------Visuals---------------"
set number									"Activate line numbers.
set linespace=12								"Set interline separation.
colorscheme atom-dark-256
set t_CO=256
set guifont=Fira_Code:h15							"This just works with macvim.
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

"------------Search----------------"
set hlsearch
set incsearch

"----------Split Management--------"
set splitbelow
set splitright

"------------Mappings--------------"
nmap <leader>ev :tabedit ~/.vim/vimrc<cr>					"Makes it easy to to edit the Vimrc file.
nmap <leader>tc :tabc<cr>							"Close the open tag.
nmap <leader>nt :NERDTreeToggle<cr>
nmap <leader><space> :nohlsearch<cr>						"Adds simple highlight removal.
nmap <leader>tn :tab new<cr>							"Creates a new tab.
nmap <leader>tt :tabn<cr>							"Switch between open tabs.

"-----------Auto-Comands----------"
"Automatically source the Vimrc file on save
augroup autosourcing							
	autocmd!							
	autocmd BufWritePost vimrc source %				
augroup END

"Start of Vim-plug manager
call plug#begin()
	Plug 'tpope/vim-vinegar'
	Plug 'ctrlpvim/ctrlp.vim'
call plug#end()
"End Vim-plug manager

