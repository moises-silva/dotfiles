set background=dark
set cindent
set nowrap
set number
set foldmethod=marker
set encoding=utf-8
set hls
syntax enable

syntax enable

" enable omnicpp plugin
set nocp
filetype plugin on
" search namespaces in the current buffer and in included files
let OmniCpp_NamespaceSearch = 2

" this closes the preview Window of omnicppcomplete
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

set complete-=k complete+=k

function InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

" Remap the tab key to select action with InsertTabWrapper
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" CTRL + t open a new tab
nnoremap <C-o> <ESC>:tabnew<CR>

" CTRL + c closes the file
nnoremap <C-c> <ESC>:wq<CR>

" CTRL + x closes without saving the file
nnoremap <C-x> <ESC>:q!<CR>

" run ctags with ctrl + F12
nnoremap <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

"set spell spelllang=en

let &titleold="bash"
let &titlestring = expand("%:t")
if &term == "screen"
  set t_ts=k
  set t_fs=\
endif
if &term == "screen" || &term == "xterm"
  set title
endif

" It seems some options screw up modeline,
" better to set this at the very end of all settings
set nocompatible
set modeline
set modelines=5

