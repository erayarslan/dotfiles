scriptencoding utf-8

set encoding=utf-8
set background=dark
set number
set statusline=%F%m%r%h%w\ [TYPE=%Y]\ %l:%v:%L
set laststatus=2
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

colorscheme sunburst
syntax enable

function! NERDTreeQuit()
  redir => buffersoutput
  silent buffers
  redir END
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0

  for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)

    if (len(m) > 0)
      if (m[2] =~ '..a..')
        let windowfound = 1
      endif
    endif
  endfor

  if (!windowfound)
    quitall
  endif
endfunction

autocmd WinEnter * call NERDTreeQuit()

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
let NERDTreeMinimalUI=1
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'

call vundle#end()
filetype plugin indent on

autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
