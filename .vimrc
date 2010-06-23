" get out of horrible vi-compatible mode
set nocompatible

" Automatic tag closing for html and xml (closetag plugin)
" <Ctrl>_ automatically closes XML tags then. Useful.
autocmd Filetype '',html,xhtml,xml,xsl,htmldjango source ~/.vim/scripts/closetag.vim
let g:closetag_html_style=1

" PythonOmnicomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete

"global backup and swp dirs
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

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

" Better Supertab setup
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

" HOTKEYS
"
" map F8 to toggle taglist
nnoremap <silent><F8> :TlistToggle<CR>
nnoremap <silent><F7> :NERDTreeToggle<CR>

" map <F3> to html-ify a given document
map <silent><F3> :so $VIMRUNTIME/syntax/2html.vim<CR> 

" map <F4> to clear highlighted searches
" (those markers can be really irritating ;))
map <silent><F4> :nohlsearch<CR>

" map ALT-Left and ALT-Right to move between tabs
map <silent><A-Right> :tabnext<CR>
map <silent><A-Left> :tabprevious<CR>

" make navigation in wrapped lines more natural
noremap j gj
noremap k gk


"Spellchecking
"F10: English, F11: Deutsch, F12: Off
map <F10> <Esc>:setlocal spell spelllang=en<CR>
map <F11> <Esc>:setlocal spell spelllang=de<CR>
map <F12> <Esc>:setlocal nospell<CR>

"vim-latex stuff
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" now some python stuff
" a few things that also work:
" :Pydoc re.sub gives the corresponding docs

" enable real code completion for python
" (needs vim to be build with python support)
autocmd FileType python set omnifunc=pythoncomplete#Complete
" remap the CTRL-X,CTRL-O to F2 
inoremap <F2> <C-x><C-o>

" make "gf" go to a python import
" this means that when the cursor is over a python import, and
"  you hit gf vim automatically opens that file
python << EOF
import os
import sys
import vim
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF

" use the ctags file from my .vim folder from the standart library
" this way I can jump into the code of a library function by hitting 
" CTRL+] and get back by hitting CTRL+t
set tags+=$HOME/.vim/tags/python.ctags
" now set CTRL-Right to dive into the library and CTRL-Left to come back
map <silent><C-Left> <C-T>
map <silent><C-Right> <C-]>

" make Vim transparently read .gpg files
au BufNewFile,BufReadPre *.gpg :set secure viminfo= noswapfile nobackup nowritebackup history=0 binary
au BufReadPost *.gpg :%!gpg -d 2>/dev/null
au BufWritePre *.gpg :%!gpg -e -r 41E3EF4E 2>/dev/null
au BufWritePost *.gpg u


" finally a bunch of shortcuts
" http://sontek.net/dotfiles/vimrc (John M. Anderson's vimrc)
" was quite the inspiration ;)

function! EatChar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunc

"general
iabbr _me Jürgen Geuter (tante@the-gay-bar.com)=EatChar('\s')<CR>
iabbr _t  <C-R>=strftime("%H:%M")<CR><C-R>=EatChar('\s')<CR>
iabbr _d  <C-R>=strftime("%a, %d %b %Y")<CR><C-R>=EatChar('\s')<CR>
iabbr _dt <C-R>=strftime("%a, %d %b %Y %H:%M")<CR><C-R>=EatChar('\s')<CR>

"python
iabbr _pyutf # -*- coding: utf8 -*-<CR>

" latex
iabbr _glos \glossary{name={},description={<++>}}<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
