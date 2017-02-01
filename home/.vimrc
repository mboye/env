execute pathogen#infect()

syntax on
filetype plugin indent on
syntax enable
set background=dark
colorscheme solarized

set tabstop=4
set shiftwidth=4
set expandtab
set hlsearch
highlight OverLength ctermbg=red ctermfg=white guibg=#592929

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

set colorcolumn=81
set path=.,,**
set ruler
set autoread

autocmd BufWritePre * :%s/\s\+$//e
set formatoptions-=r

" YCM options
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_completion=1

" Syntastic options
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_python_checker="pep8"

" Shortcuts
:nnoremap <Leader>r :%s/\<<C-r><C-w>\>/<C-r><C-w>
:nnoremap <Leader>g :grep --exclude-dir .git -rnI <C-r><C-w> .

map <F6> :cnext <CR>
map <F12> :cwindow <CR>
map <F5> :make clean unit-test-run <CR>
map <F1> :wa<CR>:make <Up><CR>
map <F2> :wa<CR>:! <Up><CR>
