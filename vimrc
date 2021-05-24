set nocompatible								"We want the latest Vim settings/options.
syntax enable
set path+=**        								"Search down into subfolders. Use it with :find yourfile.
set wildmenu  									"Display all matching files when tab complete.
let mapleader=" "								"The default leader is \ but space is better for me.
let NERDTreeHijackNetrw = 0							"Avoids NerdTree to hijack Netrw (and Vinegar) functionality.
let g:NERDTreeChDirMode       = 2						"make CtrlP's search directory change according to NerdTree's root.
"let g:ctrlp_working_path_mode = 'rw'						"make CtrlP's search directory change according to NerdTree's root.
set backspace=indent,eol,start 							"Make backspace behave like every other editor.
"let g:netrw_localrmdir='rm -r'							"Alloud remove non empty directories or folders.
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
scriptencoding utf-8								"Resolve strange characters on NerdTree.
set encoding=utf-8								"Resolve strange characters on NerdTree.
set noerrorbells visualbell t_vb= 						"No damm bells!
set encoding=utf-8								"Support UTF-8
set showmatch
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0
"autocmd BufWritePost *.py call Flake8()
autocmd BufWritePre * :%s/\s\+$//e						"Avoid leaving trailing spaces (python PEP8).

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
set wrap!

"------------Search----------------"
set hlsearch
set incsearch

"----------Split Management--------"
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>							"Move the split below.
nnoremap <C-K> <C-W><C-K>							"Move the split above.
nnoremap <C-L> <C-W><C-L>							"Move the split right.
nnoremap <C-H> <C-W><C-H>							"Move the split left.

"------------Mappings--------------"
nmap <leader>ev :tabedit ~/.vim/vimrc<cr>					"Makes it easy to to edit the Vimrc file.
nmap <leader>tc :tabc<cr>							"Close the open tag.
nmap <leader>nt :NERDTreeToggle<cr> 						"Opens Nerd Tree.
nmap <leader><space> :nohlsearch<cr>						"Adds simple highlight removal.
nmap <leader>tn :tab new<cr>							"Creates a new tab.
nmap <leader>tt :tabn<cr>							"Switch between open tabs.
nmap <leader>honza :tabedit ~/.vim/plugged/vim-snippets/UltiSnips<cr>
inoremap jj <ESC>

"-----------Auto-Comands----------"
"Automatically source the Vimrc file on save
augroup autosourcing
	autocmd!
	autocmd BufWritePost vimrc source %
augroup END

"------PDV - PHP Documentator-----"
let g:pdv_template_dir = $HOME ."/.vim/plugged/pdv/templates_snip"
nnoremap <leader>d :call pdv#DocumentWithSnip()<CR>

"-----Ultisnips------------------"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"Searches first on this directory for personal custom snippets. Do not put
"this directory on UltiSnipsSnippetDirectories
let g:UltiSnipsSnippetsDir = "~/.vim/ultisnips"
"Use these directories for searching snippets, comma separated
let g:UltiSnipsSnippetDirectories=["~/.vim/plugged/vim-snippets/UltiSnips"]

" ncm2 settings
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=menuone,noselect,noinsert
" make it FAST
let ncm2#popup_delay = 5
let ncm2#complete_length = [[1,1]]
let g:ncm2#matcher = 'substrfuzzy'

" jedi options
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"
let g:jedi#show_call_signatures_delay = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#show_call_signatures_modes = 'i'  " ni = also in normal mode xxx
let g:jedi#enable_speed_debugging=0

"Start of Vim-plug manager
call plug#begin()
	Plug 'tpope/vim-vinegar'
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'scrooloose/nerdtree'
	Plug 'sirver/ultisnips'
	Plug 'prettier/vim-prettier'
	Plug 'tobyS/vmustache' 							"Dependency needed for tobyS/pdv.
	Plug 'tobyS/pdv'
	Plug 'honza/vim-snippets'
	Plug 'tpope/vim-surround'
	Plug 'jiangmiao/auto-pairs'
	Plug 'davidhalter/jedi-vim'
	Plug 'scrooloose/syntastic'
	Plug 'nvie/vim-flake8'
	Plug 'roxma/nvim-yarp'  						"dependency of ncm2
	Plug 'ncm2/ncm2' 							"awesome autocomplete plugin
	Plug 'HansPinckaers/ncm2-jedi' 						"fast python completion (use ncm2 if you want type info or snippet support)
	Plug 'ncm2/ncm2-bufword' 						"buffer keyword completion
	Plug 'ncm2/ncm2-path'  							"filepath completion
call plug#end()
"End Vim-plug manager
