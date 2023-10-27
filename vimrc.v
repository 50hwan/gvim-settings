" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

" use extended function of vim (no compatible with vi)
set nocompatible
 
" specify encoding
set encoding=utf-8
 
" specify file encoding
set fileencodings=utf-8,euc-kr,cp949,cp932,euc-jp,shift-jis,big5,latin1,ucs-2le
 
" specify file formats
set fileformats=unix,dos
 
" 자동으로 들여쓰기
set autoindent
 
" 자동 들여쓰기 4칸
set shiftwidth=4

"tab키 4칸
set tabstop=4
 
" 붙여넣기시 계단 현상 제거
set paste
 
" 줄 수 line numbe
set number
 
" take backup
" if not, specify [ set nobackup ]
set nobackup
 
" specify backup directory
" set backupdir=~/backup
 
" take 50 search histories
set history=50
 
"파일 형식에 따른 신택스 하이라이팅 켜기
sy enable
 
" ignore Case
set ignorecase
 
" distinct Capital if you mix it in search words
set smartcase
 
" highlights matched words
" if not, specify [ set nohlsearch ]
set hlsearch
 
" use incremental search 
" if not, specify [ set noincsearch ]
set incsearch
 
" 줄 번호 표시 너비 설정
set nuw=5

" 줄간격
set linespace=3

" 백스페이스 왜안되노
set backspace=indent,eol,start

" 화면크기
set lines=40
set columns=150
 
" 화면 우측 하단에 현재 커서의 위치(줄, 칸)을 보여준다.
set ruler
 
" highlights parentheses
set showmatch
 
" show color display
" if not, specify [ syntax off ]
syntax on
 
" change colors for comments if it's set [ syntax on ]
highlight Comment ctermfg=LightCyan
 
" wrap lines
" if not, specify [ set nowrap ]
set wrap
   
" Set the background tone.
set background=dark

" Set the color scheme.
colorscheme slate

" Set a custom font you have installed on your computer.
set guifont=나눔고딕코딩:h12:cHANGEUL:qDEFAULT
set guifont=Fira_Code_Retina:h12:cANSI:qDEFAULT

" 항상 status 라인을 표시하도록 함
set ls=2

" status 라인이 어떻게 나오게 할 지 지정
set statusline=%<%F%h%m%r%h%w%y\ %=\ \[%l\,\ %c]\ \ %P
set laststatus=2

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
set cursorcolumn

:cd C:\Users\master\iCloudDrive\
