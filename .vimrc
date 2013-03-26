syntax enable

" Tab size
set tabstop=4

" Show matching brackets
set showmatch

" Autoindent option on
set autoindent

"Case insensitive matching
set ignorecase

" spell check - coloring is little bit awful 
set spell 

" Cool tab completion stuff
set wildmenu
set wildmode=list:longest,full

" Mouse in console ftw
set mouse=a

"Line numbers
set number
set ruler

" Mapping qq as a esc key --- use case: exit insert mode 
inoremap qq <Esc>

" Search as you type search term
set incsearch

set hlsearch

" Listen to file changes --- works only with GUI 
set autoread

" Scroll with 5 lines in frame
set scrolloff=5

" History and undo level
set history=300
set undolevels=1000

" File type detection
filetype on 
