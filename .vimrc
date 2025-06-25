" add custom colorscheme
syntax on
colorscheme habamax

" Output the current syntax group
nnoremap <F5> :echo synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')<CR>

" add line numbers
set number
set relativenumber

" deactivate default mode hints
set noshowmode

" set tabstops and autoindent
set autoindent
set smarttab
set tabstop=4
set shiftwidth=4
set encoding=UTF-8

" set cursor style
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" install plugins
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
    Plug 'psf/black'
    Plug 'sheerun/vim-polyglot'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
call plug#end()

let g:airline_powerline_fonts = 1
let g:airline_theme='base16'
let g:airline_section_a = airline#section#create(['mode'])
let g:airline_section_b = airline#section#create(['branch'])
let g:airline_section_c = airline#section#create(['%f'])
let g:airline_section_x = airline#section#create(['filetype'])
let g:airline_section_y = airline#section#create(['%{&fileencoding}'])
let g:airline_section_z = airline#section#create(['%l:%c'])
