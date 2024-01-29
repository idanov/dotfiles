set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required Plugin 'gmarik/Vundle.vim'

" installed plugins
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'valloric/youcompleteme'
Plugin 'bling/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mbbill/undotree'
Plugin 'plasticboy/vim-markdown'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'sjl/vitality.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'ryanoasis/vim-devicons'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" Plugins' configuration
nnoremap <F3> :NERDTreeToggle<cr>
nnoremap <F5> :UndotreeToggle<cr>
let mapleader = ","
let g:undotree_WindowLayout = 3
let g:csv_autocmd_arrange = 1

" Remap ESC key in insert mode
inoremap jk <Esc>

" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78

set number			" show line number
syntax enable
let g:solarized_termcolors=256
colorscheme solarized
set background=dark
set clipboard^=unnamed,unnamedplus      " alias unnamed register to the * and + register
set smartcase                           " only be case sensitive when it matters!
set mouse=a                             " in most terminal emulators this works fine!

" Load local configuration for vim, if available
let $LOCALFILE=expand("~/.vimrc.local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif
