set expandtab
set smarttab

set tabstop=2
set shiftwidth=2
set softtabstop=2

colorscheme elflord

" Imposta il titolo in xterm
set title

" Manda buffer in background senza salvarli e ripristina la undo history
set hidden

" With "%" switch among e.g. if/elsif/else/end XML tags, and more
runtime macros/matchit.vim

" Command completion similarly to a shell
set wildmode=list:longest,full

" La ricerca fatta con / è case sensitive solo se nel pattern da cercare c'è
" almeno una maiuscola
set ignorecase
set smartcase
 
" Accelera lo scroll
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Visualizza numero di linee del documento e percentuale di scrolling:
" per es. vedi una pagina di vim help
set ruler
"set rulerformat=%c%V\ %p%%
set rulerformat=%l,%c%V%=%P

" Evidenzia parola ricercata e ricerca automatica mentre si scrive
set hlsearch
set incsearch

" Imposta come directory temporanea preferenziale una nella home dir
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Imposta un placeholder per visualizzare gli spazi con \s
set listchars=tab:>-,trail:·,eol:¬
nmap <silent> <leader>s :set nolist!<CR>

" current directory is always matching the
" content of the active window
" set autochdir

" fa apparire una dialog di conferma quando serve, es. se :q da un file non
" salvato
set confirm

" remember some stuff after quiting vim:
" marks, registers, searches, buffer list
set viminfo='100,<50,s10,h,%

" Commuta il paste mode, se siamo in paste mode non c'è il ruler
set pastetoggle=<F2>

" Visualizza il matching tra parentesi
set showmatch

" Evidenzia riga e colonna del cursore
" set cursorline
" set cursorcolumn

" Auto fold
set foldenable

"
" PLUGINS
"

set runtimepath+=~/.vim/vim-addons/vim-addon-manager
call vam#ActivateAddons(["snipmate-snippets", "pdf", "rails", "fugitive", "github:sjl/threesome.vim", "github:sjl/gundo.vim", "TailMinusF", "netrw", "splitjoin", "SudoEdit", "github:maksimr/vim-translator", "FuzzyFinder", "LustyExplorer", "taglist", "github:scrooloose/nerdcommenter", "supertab", "CmdlineComplete", "unimpaired", "upAndDown", "Command-T", "The_NERD_tree", "endwise", "surround", "ragtag", "vim-ruby", "AutoClose", "YankRing", "EasyMotion", "github:vim-scripts/Solarized", "genutils", "multiselect"])
"Syntastic", 
"github:Lokaltog/vim-powerline", 

"
" fugitive
"
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" 
" github:sjl/gundo.vim
"
nnoremap <F5> :GundoToggle<CR>

" 
" splitjoin
"
filetype plugin indent on
nmap sj :SplitjoinJoin<cr>
nmap ss :SplitjoinSplit<cr>

" 
" vim-translator
"
let g:goog_user_conf = { 'langpair' : 'en|it', 'v_key' : 'T'}

" 
" taglist
"
set tags=./tags;
set tags+=gems.tags
map <leader>l :TlistToggle <cr>
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 60

" Use only current file to autocomplete from tags
" set complete=.,t
set complete=.,w,b,u,t,i

"
" unimpaired
"
" Bubble single lines
nmap <C-k> [e
nmap <C-j> ]e
" Bubble multiple lines
vmap <C-k> [egv
vmap <C-j> ]egv

"
" endwise
"
" In ruby scrivere def

"
" ragtag
"
" In html scrivere div<C-x>CR o <C-x>!
" In erb scrivere <C-x>=
" E molti altri

"
" Syntastic
"

" 
" Conque Term
"

"
" AutoClose
"

"
" vim-ruby
"

"
" github:Lokaltog/vim-powerline
"
set nocompatible " Disable vi-compatibility
set laststatus=2 " Always show the statusline

" Search for visually selected text, *=forwards, #=backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" save using sudo
cmap w!! w !sudo tee > /dev/null %
