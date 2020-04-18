" 用来设置vim 显示行号。
" Line number {{{
set nu
" }}}


" 这是自动保存的命令，用来触发vim的实时编译
" TeX live preiview {{{
fu! TexLivePreview()
  if filewritable( bufname( '%' ) )
    silent update %
  endif
endfu
au CursorHoldI,TextChangedI,CursorHold *.tex call TexLivePreview()
" }}}



call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode= 2
let g:vimtex_view_method='skim'
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtex_latexmk_options='-pdf -pdflatex="xelatex -synctex=1 \%S \%O" -verbose -file-line-error -interaction=nonstopmode'
let g:vimtex_compiler_latexrun_engines = {
        \ '-' : 'xelatex'
        \}
let g:vimtex_view_general_options_latexmk = '-reuse-instance' 
call plug#end() 
