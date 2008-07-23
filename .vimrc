" get out of horrible vi-compatible mode
set nocompatible

" Automatic tag closing for html and xml (closetag plugin)
" <Ctrl>_ automatically closes XML tags then. Useful.
autocmd Filetype html,xhtml,xml,xsl source ~/.vim/scripts/closetag.vim
let g:closetag_html_style=1
source ~/.vim/scripts/closetag.vim

" dictionaries for words
set dictionary=/usr/share/dict/words,/usr/share/dict/web2,/usr/share/dict/extra.words

" have command-line completion <Tab> (for filenames, help topics, option names)
" first list the available options and complete the longest common part, then
" have further <Tab>s cycle through the possibilities:
set wildmode=list:longest,full

" Highlight matching parens
set showmatch

" don't do any automatic folding 
set foldmethod=manual

" display the current mode and partially-typed commands in the status line:
set showmode
set showcmd

" show line numbers
set nu

" enable incremental search
set incsearch

" don't make it look like there are line breaks where there aren't:
" set textwidth=79
" set nowrap
" Note: actually wordwrap and auto-linebreaking mess up a few things so better 
" leave it disabled by default

" Enable syntax highlighting
if has("syntax")
    syntax on
endif

" Enable filetype settings
if has("eval")
    filetype on
    filetype plugin on
    filetype indent on
endif

" TAB stuff
" By default, go for an indent of 4
set shiftwidth=4
" Make <tab> 4 spaces
set tabstop=4
" make <tab> use shiftswidth setting
set smarttab
" make tabs spaces
set expandtab
" make <del> delete 4 spaces
set softtabstop=4

" auto indentation
set autoindent

" I highlight strings inside C comments
let c_comment_strings=1

" make sure linebreaks don't mess up words
set linebreak

" Better status bar
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] 
set laststatus=2 

" in human-language files, automatically format everything at 72 chars:
" autocmd FileType mail,human set formatoptions+=t textwidth=72
" Note: Seems like a good idea but messes up posting to s9y so disabled till I
" find a better way to handle it

" HOTKEYS
"
" map F8 to taggle taglist
nnoremap <silent> <F8> :TlistToggle<CR>

"Spellchecking
"F10: English, F11: Deutsch, F12: Off
map <F10> <Esc>:setlocal spell spelllang=en<CR>
map <F11> <Esc>:setlocal spell spelllang=de<CR>
map <F12> <Esc>:setlocal nospell<CR>
