set relativenumber
set smarttab
set cindent
set tabstop=2
set shiftwidth=2
set number
set autoindent
set mouse=a
set termguicolors


call plug#begin('~/.config/nvim/plugged') 
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox' "Theme
Plug 'sonph/onehalf', { 'rtp': 'vim' }


Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'tsony-tsonev/nerdtree-git-plugin'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'ryanoasis/vim-devicons'
Plug 'https://github.com/tc50cal/vim-terminal'
Plug 'https://github.com/ap/vim-css-color'
Plug 'https://github.com/rafi/awesome-vim-colorschemes'
Plug 'airblade/vim-gitgutter'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
Plug 'scrooloose/nerdcommenter'
Plug 'https://github.com/preservim/tagbar' "Tagbar for code navidation
Plug 'prettier/vim-prettier'
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'christoomey/vim-tmux-navigator'
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
call plug#end()

colorscheme gruvbox

inoremap jk <ESC>
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>
nmap <F8> :TagbarToggle<CR>

let g:NERDTreeGitStatusWithFlags = 1

let g:NERDTreeIgnore = ['^node_modules$']

command! -nargs=0 Prettier :CocCommand prettier.formatFile
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')


function! IsNERDTreeOpen()        
	  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction


function! SyncTree()
	if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
		NERDTreeFind
		wincmd p
	endif
endfunction

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]

set hidden
"set updatetime=300

set shortmess+=c

"set signcolumn=yes


inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	  let col = col('.') - 1
	  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" Use `[g` and `]g` to navigate diagnostics
 nmap <silent> [g <Plug>(coc-diagnostic-prev)
 nmap <silent> ]g <Plug>(coc-diagnostic-next)
"
"Remap keys for gotos
 nmap <silent> gd <Plug>(coc-definition)
 nmap <silent> gy <Plug>(coc-type-definition)
 nmap <silent> gi <Plug>(coc-implementation)
 nmap <silent> gr <Plug>(coc-references)
"
" " Use K to show documentation in preview window
 nnoremap <silent> K :call <SID>show_documentation()<CR>
"
 function! s:show_documentation()
   if (index(['vim','help'], &filetype) >= 0)
       execute 'h '.expand('<cword>')
   else
        call CocAction('doHover')
   endif
 endfunction

" Highlight symbol under cursor on CursorHold
 autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)


xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
	autocmd!
	" Setup formatexpr specified filetype(s).
	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	" Update signature help on jump placeholder
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Create mappings for function text object, requires document symbols feature
" of languageserver.
 xmap if <Plug>(coc-funcobj-i)
 xmap af <Plug>(coc-funcobj-a)
 omap if <Plug>(coc-funcobj-i)
 omap af <Plug>(coc-funcobj-a)


 nmap <silent> <C-d> <Plug>(coc-range-select)
 xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand','editor.action.organizeImport')

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
