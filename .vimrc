scriptencoding utf-8

set nocompatible        " Use Vim defaults (much better!)
set bs=2                " Allow backspacing over everything in insert mode
set ai                  " Always set auto-indenting on
set history=50          " keep 50 lines of command history
set ruler               " Show the cursor position all the time

set viminfo='20,\"500   " Keep a .viminfo file.

set rtp+=$GOROOT/misc/vim
filetype plugin indent on
set ofu=syntaxcomplete#Complete
syntax on

" When displaying line numbers, don't use an annoyingly wide number column. This
" doesn't enable line numbers -- :set number will do that. The value given is a
" minimum width to use for the number column, not a fixed size.
if v:version >= 700
  set numberwidth=3
endif
set nomodeline

" Cyberroadie specific stuff 
set expandtab
set tabstop=2
set expandtab ts=2 sw=2 ai
set number
" substitute all occurrences of the word under the cursor:
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
set tags+=~/.vim/tags/cpp
map <F6> :!exctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Looks for tags file in current directory, traverses up until it finds one
set tags=./tags;/

" NERDTree
map <F2> :NERDTreeToggle<CR>
map <F3> :TlistToggle<CR>
map <F4> :BufExplorer<CR>
map <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

fun! ReadMan(num)
  " Assign current word under cursor to a script variable:
  let s:man_word = expand('<cword>')
  " Open a new window:
  " :exe ":wincmd n"
  :exe ":vne"
  " Move window to far right
  :exe ":wincmd L"
  :exe ":vertical resize 90"
  " Read in the manpage for man_word (col -b is for formatting):
  :exe ":r!man " a:num " " . s:man_word . " | col -b"
  " Goto first line...
  :exe ":goto"
  " and delete it:
  :exe ":delete"
  " set file type to 'man':
  :exe ":set filetype=man"
  :exe ":w! /tmp/mantxt"
endfun

" Map the K key to the ReadMan function:
map K :call ReadMan(2)<CR>
map L :call ReadMan(3)<CR>


