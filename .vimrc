" VIM Configuration file
set mouse=a
set complete+=k " Autocomplete on
set completeopt+=longest
"" set clipboard+=unnamed
set backspace=2
set ww=<,>,[,] "whichwrap -- l/r keys traverse u/d

" wrap like other editors
set wrap                " word wrap
set textwidth=0         " 
set lbr                 " line break
set display=lastline    " don't display @ with long paragraphs

" backup settings
set backup              " keep a backup file
set backupdir=/tmp      " backup dir
set directory=/tmp      " swap file directory
syn on

set number " Set line number on
set ts=2 " Set tab to be two spaces
set hls " Highlight search terms
set ic  " Ignore cases in search
noremap ; l
noremap l k
noremap k j
noremap j h
set noet ci pi sts=0 sw=2 ts=2 " Set indent command > 2 tabs
set autoindent

" spell check
map <F12> :w<CR>:!aspell -c %<CR><CR>:e<CR><CR> 

nmap <F1> :mak <enter>
nmap <F2> :cn  <enter>
nmap <F3> :cp  <enter>
nmap <F4> :!./%< <enter>

nmap <F5> :!./texpile <enter>
nmap <F6> :!pdflatex %< <enter>
set pastetoggle=<F11>
nnoremap K i<CR><Esc>		" break line under cursor with K
colorscheme zellner " define syntax color scheme
" asmdev  baycomb breeze asmanian2 cool cthulian darkblue2

set foldmethod=syntax
set autochdir
set autoread
