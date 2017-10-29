" my plugin list
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/vim-github-dashboard'
Plug 'pangloss/vim-javascript'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'flazz/vim-colorschemes'
Plug 'w0rp/ale'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mbbill/undotree'
Plug 'scrooloose/nerdcommenter'
Plug 'altercation/vim-colors-solarized'
Plug 'mileszs/ack.vim'
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar'

call plug#end()

set expandtab
set backspace=indent,eol,start
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " a
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.,eol:$


" Tabular
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

" Tagbar
nmap <F8> :TagbarToggle<CR>

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction


" ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" resolve redraw issues under case maximum terminal size
set nolazyredraw

if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif


syntax enable
let g:solarized_termcolors=256
colorschem solarized
set background=dark
" my nvim config
set nu
set nopaste

" C means Ctrl

let g:NERDTreeShowHidden=1
tnoremap <ESC> <C-\><C-n>
map <C-n> :NERDTreeToggle<CR>
map <leader>l :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>

" " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"
" " If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

let g:javascript_plugin_jsdoc =                      1
let g:javascript_plugin_flow =                       1

"let g:javascript_conceal_function             = "ƒ"
"let g:javascript_conceal_null                 = "ø"
"let g:javascript_conceal_this                 = "@"
"let g:javascript_conceal_return               = "⇚"
"let g:javascript_conceal_undefined            = "¿"
"let g:javascript_conceal_NaN                  = "ℕ"
"let g:javascript_conceal_prototype            = "¶"
"let g:javascript_conceal_static               = "•"
"let g:javascript_conceal_super                = "Ω"
"let g:javascript_conceal_arrow_function       = "⇒"
"let g:javascript_conceal_noarg_arrow_function = "🞅"
"let g:javascript_conceal_underscore_arrow_function = "🞅"

" ale eslint
let g:ale_fixers = {
\  'javascript': ['eslint'],
\}
let g:ale_fix_on_save = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_completion_enabled = 1

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

autocmd bufwritepost *.js silent !eslint --fix %
set autoread

let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '>'

" vim-easy-align

" Start interactive EasyAlign either in visual mode or a motion/text object (e.g. gaip)
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" vim-easy-align

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim

" my nvim config
"
" NERDCommenter
" " Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
let g:NERDAltDelims_javascript = 1
let g:NERDAltDelims_ruby = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1