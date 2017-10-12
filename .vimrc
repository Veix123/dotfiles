set number relativenumber
set expandtab
set tabstop=2
set shiftwidth=2
set splitbelow
set splitright
set syntax=on
set lazyredraw
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
set completeopt-=preview
set cursorline 
set ignorecase
highlight CursorLine cterm=none ctermbg = darkgrey
highlight YcmErrorSection ctermbg=darkgrey

" Apply YCM FixIt
map <F9> :YcmCompleter FixIt<CR>

" CamelCase to snake_case
nnoremap _ :s#\(\<\u\l\+\<bar>\l\+\)\(\u\)#\l\1_\l\2#g<CR>

" NERDTree
nmap <silent> <F2> :NERDTreeToggle<CR>
nmap <silent> <F3> :NERDTreeFind<CR>

" clang format options
let g:clang_format#command = 'clang-format-4.0'
let g:clang_format#detect_style_file = 1
" autocmd FileType c,cpp setlocal equalprg=clang-format-4.0
autocmd FileType c,cpp,objc map = <Plug>(operator-clang-format)


call plug#begin('~/.vim/plugged')

Plug 'https://github.com/taketwo/vim-ros.git'
Plug 'https://github.com/jiangmiao/auto-pairs.git'
Plug 'https://github.com/Valloric/YouCompleteMe.git'
Plug 'https://github.com/rhysd/vim-clang-format.git'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'https://github.com/kana/vim-operator-user.git'

call plug#end()

autocmd BufEnter * let &titlestring = ' %F'              
set title


" temp fix for clang undo problem
function! SafeUndo()
  let s:pos = getpos( '. ' )
  let s:view = winsaveview()        
  undo
  call setpos( '.', s:pos  )
  call winrestview( s:view  )
endfunc

function! SafeRedo()
  let s:pos = getpos( '.'  )
  let s:view = winsaveview()
  redo
  call setpos( '.', s:pos  )
  call winrestview( s:view  )
endfunc

" nnoremap u :call SafeUndo() <CR>
" nnoremap <C-r> :call SafeRedo() <CR>
