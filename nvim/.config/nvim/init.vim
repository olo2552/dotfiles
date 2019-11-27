" Fuck the backwards compatibility with Vi
set nocp

" Use UTF-8 as default encoding
set encoding=utf-8

" Keep 10000 items in the history
set history=10000

" Show cursor position
set ruler

" Show incomplete commands
set showcmd

" Enable IntelliSense for Normal Mode commands
set wildmenu

" When z+Enter text scrolling, keep the 5 lines offset
set scrolloff=5

" Enable hybrid line numbers 
:set number relativenumber

" Enable better line breaks
set lbr

" Enable smart indent
set si

" Set Tab as 
set tabstop=2
" Set indent width as 2 spaces
set shiftwidth=2
" Treat 2 sapces as single Tab
set softtabstop=2
" Expand Tab character to spaces
set expandtab

" Share unnamed + register with system clipboard
set clipboard+=unnamedplus

" ~~~ Snippet for making navigation by screen lines, rather than file lines
" mapping to make movements operate on 1 screen line in wrap mode

let b:gmove = "yes"

function! ScreenMovement(movement)
  if &wrap && b:gmove == "yes"
    return "g" . a:movement
  else
    return a:movement
  endif
endfunction

onoremap <silent> <expr> j ScreenMovement("j")
onoremap <silent> <expr> k ScreenMovement("k")
onoremap <silent> <expr> 0 ScreenMovement("0")
onoremap <silent> <expr> ^ ScreenMovement("^")
onoremap <silent> <expr> $ ScreenMovement("$")
nnoremap <silent> <expr> j ScreenMovement("j")
nnoremap <silent> <expr> k ScreenMovement("k")
nnoremap <silent> <expr> 0 ScreenMovement("0")
nnoremap <silent> <expr> ^ ScreenMovement("^")
nnoremap <silent> <expr> $ ScreenMovement("$")
vnoremap <silent> <expr> j ScreenMovement("j")
vnoremap <silent> <expr> k ScreenMovement("k")
vnoremap <silent> <expr> 0 ScreenMovement("0")
vnoremap <silent> <expr> ^ ScreenMovement("^")
vnoremap <silent> <expr> $ ScreenMovement("$")
vnoremap <silent> <expr> j ScreenMovement("j")

" toggle showbreak
function! TYShowBreak()
  if &showbreak == ''
    set showbreak=>
  else
    set showbreak=
  endif
endfunction

function! TYToggleBreakMove()
  if exists("b:gmove") && b:gmove == "yes"
    let b:gmove = "no"
  else
    let b:gmove = "yes"
  endif
endfunction

nmap  <expr> ,b  TYShowBreak()
nmap  <expr> ,bb  TYToggleBreakMove()<Paste>
" ~~~ End of Snippet for screen lines

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" ~~~ Place the plugins here ~~~
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'iCyMind/NeoSolarized'
Plug 'morhetz/gruvbox'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'kana/vim-surround'

" Initialize plugin system
call plug#end()

" Set GruvBox theme
set termguicolors
set background=dark
colorscheme gruvbox

" NERDTree - show hidden files
let NERDTreeShowHidden=1

" write sudo-permitted files from normal nvim
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
