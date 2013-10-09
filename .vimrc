runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#helptags()
call pathogen#infect() 

" Encoding
set encoding=utf8

" Colors
set t_Co=256
colorscheme Monokai

" Set <leader> to ö on German Keyboard
let mapleader = "ö"

" get out of horrible vi-compatible mode
set nocompatible

" allow . to work on visual selections
vnoremap . :norm.<cr>

" use the mouse
set mouse=a

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" tab completion for command line
set wildmenu

" Automatic tag closing for html and xml (closetag plugin)
" <Ctrl>_ automatically closes XML tags then. Useful.
autocmd Filetype '',html,xhtml,xml,xsl,htmldjango source ~/.vim/bundle/closetag.vim/plugin/closetag.vim
let b:closetag_html_style=1

" PythonOmnicomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete

" show me the 5 lines below the one I am typing in
set scrolloff=5

" show words as I change them
set cpoptions=B$

" No more backup or swap
set nobackup

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

" put all those weird .swp and *~ files to /tmp
set directory=/tmp/
set backupdir=/tmp/

" don't make it look like there are line breaks where there aren't:
set textwidth=0

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

" make sure linebreaks don't mess up words
set linebreak

" Better Split handling
set splitbelow
set splitright

" Better status bar
"set statusline=%F%m%r%h%w
"set statusline+=\ %{fugitive#statusline()}
"set statusline+=\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] 
set laststatus=2 

" HOTKEYS
"
" map F8 to toggle taglist
"nnoremap <silent><F8> :TlistToggle<CR>
nmap <F8> :TagbarToggle<CR>
nnoremap <silent><F7> :NERDTreeToggle<CR>


" map <F3> to html-ify a given document
map <silent><F2> :so $VIMRUNTIME/syntax/2html.vim<CR> 

" map ALT-Left and ALT-Right to move between tabs
map <silent><A-Right> :tabnext<CR>
map <silent><A-Left> :tabprevious<CR>

" make navigation in wrapped lines more natural
noremap j gj
noremap k gk


"Spellchecking
"F11: On, F12: Off
set spelllang=en,de
map <F11> <Esc>:set spell<CR>
map <F12> <Esc>:set nospell<CR>

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
" Better Supertab setup
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

" remap the CTRL-X,CTRL-O to F1 
inoremap <F1> <C-x><C-o>

" enable markdown Syntax Highlighting for .md files (I don't write Modula2)

au BufNewFile,BufRead *.md  setf markdown

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

" Highlight parts of lines longer than 79 columns
if version < 703
   au filetype python highlight OverLength ctermbg=darkgreen ctermfg=white guibg=black
   au filetype python match OverLength /\%80v.\+/
else
   set colorcolumn=80
endif

" finally a bunch of shortcuts
" http://sontek.net/dotfiles/vimrc (John M. Anderson's vimrc)
" was quite the inspiration ;)

function! EatChar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunc

function! DistractionFreeWriting()
        colorscheme iawriter
        set background=light
        set gfn=Cousine:h14                " font to use
        set lines=40 columns=100           " size of the editable area
        set guioptions-=r                  " remove right scrollbar
        set laststatus=0                   " don't show status line
        set noruler                        " don't show ruler
        "set fullscreen                     " go to fullscreen editing mode
        silent !wmctrl -r :ACTIVE: -b add,fullscreen  # go to fullscreen
        set linebreak                      " break the lines on words
    endfunction

"python
iabbr _pyutf # -*- coding: utf8 -*-<CR>

" Write mode
func! WordProcessorMode() 
  setlocal formatoptions=1 
  setlocal noexpandtab 
  map j gj 
  map k gk
  setlocal spell spelllang=en_us 
  set thesaurus+=/home/tante/.vim/thesaurus/mthesaur.txt
  set complete+=s
"  set formatprg=par
  setlocal wrap 
  setlocal linebreak 
endfu 
com! WP call WordProcessorMode()


" Powerline
set noshowmode    " disable mode display (powerline has that)

" Airline
" Smarter Tab Line
let g:airline#extensions#tabline#enabled = 1
" use Powerline fonts
let g:airline_powerline_fonts = 1
" airline theme
let g:airline_theme="molokai"

" Vim pdb integration with F7/Shift-F7
python << EOF
def SetBreakpoint():
    import re
    nLine = int( vim.eval( 'line(".")'))

    strLine = vim.current.line
    strWhite = re.search( '^(\s*)', strLine).group(1)

    vim.current.buffer.append(
       "%(space)spdb.set_trace() %(mark)s Breakpoint %(mark)s" %
         {'space':strWhite, 'mark': '#' * 30}, nLine - 1)

    for strLine in vim.current.buffer:
        if strLine == "import pdb":
            break
    else:
        vim.current.buffer.append( 'import pdb', 0)
        vim.command( 'normal j1')

vim.command( 'map <f7> :py SetBreakpoint()<cr>')

def RemoveBreakpoints():
    import re

    nCurrentLine = int( vim.eval( 'line(".")'))

    nLines = []
    nLine = 1
    for strLine in vim.current.buffer:
        if strLine == "import pdb" or strLine.lstrip()[:15] == "pdb.set_trace()":
            nLines.append( nLine)
        nLine += 1

    nLines.reverse()

    for nLine in nLines:
        vim.command( "normal %dG" % nLine)
        vim.command( "normal dd")
        if nLine < nCurrentLine:
            nCurrentLine -= 1

    vim.command( "normal %dG" % nCurrentLine)

vim.command( "map <s-f7> :py RemoveBreakpoints()<cr>")
EOF

" Easymotion
let g:EasyMotion_leader_key = '<Leader>'
