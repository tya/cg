" ###################################################################
" ## VIM PLUG
" ###################################################################

" Auto install of vim-plug
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug '/usr/local/opt/fzf'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'benekastah/neomake'
Plug 'bling/vim-airline'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dyng/ctrlsf.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'hashivim/vim-terraform'
Plug 'haya14busa/incsearch.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
"Plug 'kana/vim-operator-user'
Plug 'klen/python-mode'
Plug 'kopischke/vim-fetch'
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'majutsushi/tagbar'
Plug 'rbgrouleff/bclose.vim'
"Plug 'rhysd/vim-gfm-syntax'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'sebdah/vim-delve'
Plug 'sheerun/vim-polyglot'
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/groovy.vim'
Plug 'xu-cheng/brew.vim'

call plug#end()

" ###################################################################
" ## Terraform
" ###################################################################
" Show airline before split
" hashivim/vim-terraformset nocompatible  " be iMproved, required

" Python preferences
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope = 0

" ###################################################################
" ## AIRLINE
" ###################################################################
" Show airline before split
set laststatus=2

" Automatically displays all buffers when there's only one tab open
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Set separator in airline
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" ###################################################################
" ## SYNTASTIC
" ###################################################################
" Show airline before split
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ###################################################################
" ## Markdown
" ###################################################################
let g:vim_makrdown_conceal = 0

" ###################################################################
" ## TMUX
" ###################################################################
" save on swap to tmux
" 1	:update (write the current buffer, but only if changed)
" 2	:wall (write all buffers)
let g:tmux_navigator_save_on_switch = 1

" ###################################################################
" ## SEARCH
" ###################################################################
" incremental search
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
let g:incsearch#magic = '\v'
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" FZF
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

" CtrlSF search
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

" ###################################################################
" ## ALIGNMENT
" ###################################################################
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Right margin highlight after column 80
let &colorcolumn=join(range(120,999),",")
" let &colorcolumn="80,".join(range(120,999),",")

" ###################################################################
" ## FOLDING
" ###################################################################
" disable folding
set nofoldenable

" ###################################################################
" ## INDENTING
" ###################################################################
" Indenting per filetype
" filetype plugin indent on

" Tab settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab

" show hidden characters
" set list
" let &showbreak='+++ '
" if &listchars ==# 'eol:$'
"     set listchars=tab:>-,trail:-,extends:>,precedes:<,nbsp:%
" endif

" ###################################################################
" ## NAVIGATION
" ###################################################################
" Enable delete in insert mode
set backspace=indent,eol,start

" Allow buffers to be hidden if modified
set hidden

" change the mapleader from \ to ,
let mapleader=","

" To open a new empty buffer
" This replaces :tabnew
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>b :ls<CR>

" Vim go settings
let g:go_fmt_command = "goimports"

" bclose: close buffers without closing window
nnoremap <silent> <Leader>bd :Bclose<CR>

" ###################################################################
" ## FILE BROWSERS
" ###################################################################
" Enable nerdtree
nmap <Leader>n <plug>NERDTree<CR>
nmap <Leader>N <plug>NERDTreeToggle<CR>


" ###################################################################
" ## F1 Override to Esc
" ###################################################################
map <F1> <Esc>
imap <F1> <Esc>

" ###################################################################
" ## COPY/PASTE
" ###################################################################
set clipboard=unnamed


" ###################################################################
" ## Language: python stuff
" ###################################################################
" Enable python3 syntax checking
let g:pymode_python = 'python3'

" ###################################################################
" ## APPEARANCE
" ###################################################################
" Enable line numbers
set number

" Enable syntax highlighting
syntax on

" ###################################################################
" ## GOLANG APPEARANCE
" ###################################################################
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1

" Enable dark solarized
set background=dark
"set background=light
colorscheme solarized

" ###################################################################
" ## WHITE SPACE CLEANUP
" ###################################################################
" Highlight trailing whitespace, and remove automatically on save
" TODO Look for a plugin for this
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
function! TrimWhiteSpace()
  %s/\s\+$//e
  endfunction
  autocmd BufWritePre * :call TrimWhiteSpace()

