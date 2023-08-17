syntax enable
set runtimepath^=$XDG_CONFIG_HOME/vim
set runtimepath+=$XDG_DATA_HOME/vim
set runtimepath+=$XDG_CONFIG_HOME/vim/after

set packpath^=$XDG_DATA_HOME/vim,$XDG_CONFIG_HOME/vim
set packpath+=$XDG_CONFIG_HOME/vim/after,$XDG_DATA_HOME/vim/after

let g:netrw_home = $XDG_DATA_HOME."/vim"
call mkdir($XDG_DATA_HOME."/vim/spell", 'p')
set viewdir=$XDG_DATA_HOME/vim/view | call mkdir(&viewdir, 'p')

set backupdir=$XDG_CACHE_HOME/vim/backup | call mkdir(&backupdir, 'p')
set directory=$XDG_CACHE_HOME/vim/swap   | call mkdir(&directory, 'p')
set undodir=$XDG_CACHE_HOME/vim/undo     | call mkdir(&undodir,   'p')

set viminfofile=$XDG_STATE_HOME/vim/viminfo

set nu
set relativenumber
set swapfile
set nobackup
set noundofile
set smartindent
set autoindent
set tabstop=4
set shiftwidth=4
set background=dark
set laststatus=2
set noshowmode
set encoding=UTF-8
set mouse=a
set cursorline
set splitbelow
set showmatch
"set termguicolors
let g:ycm_clangd_uses_ycmd_caching = 0
let g:ycm_clangd_binary_path = exepath("clangd")
"let g:lightline = {
"	\ 'colorscheme' : 'gruvbox',
"	\}
let airline_theme='wal'
colorscheme colors-wal
packadd termdebug
inoremap yy <esc>
nmap <C-k> "+y
" k for copy like kopy
nmap <C-b> "+p
" b is upside down p comments are here for me to remember 
nmap <C-h> :NERDTree<cr>
nnoremap <C-Tab> :tabn<cr>
nnoremap <C-S-Tab> :tabprevious<cr>
function! s:cpp()
	command! Build :!g++ -o test -ggdb %
	inoremap \w while( ){}<esc>:ClangFormat<cr>
	inoremap \f for(<Space>;<Space>;<Space>){}<esc>:ClangFormat<cr>
	inoremap \i if(<Space>){}<esc>:ClangFormat<cr>
	nnoremap gt :YcmCompleter GoTo<cr>
	nnoremap gd :YcmCompleter GoToDefinition<cr>
	nnoremap gi :YcmCompleter GoToInclude<cr>
	nnoremap gy :YcmCompleter GoToDeclaration<cr>
	nnoremap gs :YcmCompleter GoToSymbol
	nnoremap gr :YcmCompleter GoToReference<cr>
	nnoremap <F2> :YcmCompleter RefactorRename
	nnoremap <F3> :YcmCompleter FixIt<cr>
	nnoremap <F6> :ClangFormat<cr>
	nnoremap <space>b :Break<cr>
	nmap <C-s> :Termdebug
endfunction
autocmd FileType cpp call s:cpp()

call plug#begin('$XDG_CONFIG_HOME/vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dylanaraps/wal.vim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ycm-core/YouCompleteMe'
"Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'calviken/vim-gdscript3'
Plug 'tikhomirov/vim-glsl'
Plug 'rhysd/vim-clang-format'
Plug 'kien/ctrlp.vim'
Plug 'habamax/vim-godot'
call plug#end()
