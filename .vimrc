" VIM Configuration file
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
nmap <F1> :!./compile_main_file <enter>
nmap <F5> :!./texpile <enter>
nmap <F2> :!make <enter>
nmap <F3> :!./1d_version 100 100000 0.01 true 1 <enter>
set pastetoggle=<F4>
nnoremap K $a<CR><Esc>
nnoremap <Tab> <Esc>
vnoremap <Tab> <Esc>gV
onoremap <Tab> <Esc>
inoremap <Tab> <Esc>`^
