  set number norelativenumber
  set expandtab
  set tabstop=2
  autocmd FileType python setlocal tabstop=2
  set softtabstop=2
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
highlight CursorLine cterm=none ctermbg=237
highlight YcmErrorSection ctermbg=237

" Apply YCM FixIt
map <F9> :YcmCompleter FixIt<CR>

" CRTL-P
let g:ctrlp_working_path_mode = 'ra'

" CamelCase to snake_case
nnoremap _ :s#\(\<\u\l\+\<bar>\l\+\)\(\u\)#\l\1_\l\2#g<CR>

" NERDTree
nmap <silent> <F2> :NERDTreeToggle<CR>
nmap <silent> <F3> :NERDTreeFind<CR>

" clang format options
let g:clang_format#command = 'clang-format'
let g:clang_format#detect_style_file = 1
let g:clang_format#code_style = 'file'
autocmd FileType c,cpp setlocal equalprg=clang-format-6.0
" autocmd FileType c,cpp,objc map = <Plug>(operator-clang-format)

" disable auto folding for rvim plugin
set nofoldenable
let g:riv_fold_auto_update = 0

" RST Shortcuts for inserting code
" nnoremap <leader>c i:code:``<ESC>i
nnoremap <leader>C o<CR>.. code-block:: bash<CR><CR>   

" Use Markdown compatible table corners
let g:table_mode_corner='|'


call plug#begin('~/.vim/plugged')

" Plug 'https://github.com/taketwo/vim-ros.git'
Plug 'https://github.com/gu-fan/riv.vim.git'
Plug 'https://github.com/jiangmiao/auto-pairs.git'
Plug 'https://github.com/Valloric/YouCompleteMe.git'
Plug 'https://github.com/rhysd/vim-clang-format.git'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'https://github.com/kana/vim-operator-user.git'
Plug 'https://github.com/vim-scripts/DoxygenToolkit.vim'
Plug 'dhruvasagar/vim-table-mode'

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

" VimDiff color scheme
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
