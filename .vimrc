" I need to see tabs: confirms that indentation is what I expect, easier to
" fix mixed indentations when they occur, and make sure alignement versus
" indentation use spaces rather than tabs.
set list listchars=tab:>-,trail:.,extends:>,precedes:<

"Show 80 columns violation on <Leader>H
nnoremap <Leader>H :call<SID>LongLineHLToggle()<cr>
hi OverLength ctermbg=none cterm=none
match OverLength /\%>80v/
fun! s:LongLineHLToggle()
 if !exists('w:longlinehl')
  let w:longlinehl = matchadd('ErrorMsg', '.\%>80v', 0)
  echo "Long lines highlighted"
 else
  call matchdelete(w:longlinehl)
  unl w:longlinehl
  echo "Long lines unhighlighted"
 endif
endfunction

let g:rainbow_active = 1

" Enable true color 启用终端24位色
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

colorscheme molokai

imap kj <Esc>
imap jk <Esc>
imap ii <Esc>

filetype plugin indent on
" Good for aligning stuff
set copyindent

" Show trailing whitespace
" Note: Keep this AFTER the filetype based syntax rules
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
let loaded_matchparen = 1

" show command as it is being typed. Very useful when repeating macro N times,
" etc., when touch typing (and especially with layered and unfamiliar keebs).
set showcmd

" git grepping is a huge part of my workflow
:command! GG execute "!git grep -nHI <cword>"

" Show line number (I like them hidden on the left, too much clutter), and the
" column number (good for confirmation that textwidth is ok)
set ruler

set foldmethod=syntax
set foldnestmax=20 "20 is default

" with syntax foldmethod, invalid syntax (such as inserting an opening brace
" before its corresponding closing brace) cause massive unfolds, which do not
" refold automatically.
" This attempts to stop this unfold.
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

" set 'updatetime' to X seconds when in insert mode
au InsertEnter * let updaterestore=&updatetime | set updatetime=4200
au InsertLeave * let &updatetime=updaterestore
" automatically leave insert mode after 'updatetime' milliseconds of inaction
au CursorHoldI * stopinsert


