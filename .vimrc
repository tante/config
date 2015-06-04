runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#helptags()
call pathogen#infect()

" get out of horrible vi-compatible mode
set nocompatible

" Encoding
set encoding=utf8

" Colors
set t_Co=16
colorscheme monokai
"set background=dark

" set font for gvim
set gfn=Source\ Code\ Pro\ for\ Powerline\ 11

" Set <leader> to ö on German Keyboard
let mapleader = "ö"

" some shortcuts
" leader o to open
nnoremap <Leader>o :CtrlP<CR>
" leader w to save
nnoremap <Leader>w :w<CR>
"Copy & paste to system clipboard with leader p and Leader y
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

"Move between tabs with Shift+l/h
noremap <S-l> gt
noremap <S-h> gT

" map region expanding to v/C-v
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" allow . to work on visual selections
vnoremap . :norm.<cr>

" Map Goyo toggle to <Leader> + spacebar
nnoremap <Leader><Space> :Goyo<CR>
" Goyo Limelight integration
function! GoyoBefore()
  Limelight
endfunction

function! GoyoAfter()
  Limelight!
endfunction

let g:goyo_callbacks = [function('GoyoBefore'), function('GoyoAfter')]

" use the mouse
set mouse=a

" disable arrow keys
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>
"imap <up> <nop>
"imap <down> <nop>
"imap <left> <nop>
"imap <right> <nop>

" tab completion for command line
set wildmenu

" Automatic tag closing for html and xml (closetag plugin)
" <Ctrl>_ automatically closes XML tags then. Useful.
autocmd Filetype '',html,xhtml,xml,xsl,htmldjango source ~/.vim/bundle/closetag.vim/plugin/closetag.vim
let b:closetag_html_style=1

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
set hlsearch

" put all those weird .swp and *~ files to /tmp
set directory=/tmp/
set backupdir=/tmp/

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

" softbreak text after 79 chars
au BufRead,BufNewFile *.md,*.txt setlocal textwidth=79
au BufRead,BufNewFile *.md,*.txt setlocal formatoptions+=t
au BufRead,BufNewFile *.md,*.txt setlocal wm=2
au BufRead,BufNewFile *.md,*.txt setlocal linebreak nolist


" make sure linebreaks don't mess up words
set linebreak

" Better Split handling
set splitbelow
set splitright

" Better status bar
set laststatus=2

" HOTKEYS
"
" map F8 to toggle taglist
nmap <F8> :TagbarToggle<CR>
nnoremap <silent><F7> :NERDTreeToggle<CR>


" map <F3> to html-ify a given document
map <silent><F2> :so $VIMRUNTIME/syntax/2html.vim<CR>

" map ALT-Left and ALT-Right to move between tabs
map <silent><A-Right> :tabnext<CR>
map <silent><A-Left> :tabprevious<CR>

" softwrap long lines

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
let g:LatexBox_latexmk_options="-pdf"
let Tex_FoldedSections=""
let Tex_FoldedEnvironments=""
let Tex_FoldedMisc=""

" now some python stuff
" a few things that also work:
" :Pydoc re.sub gives the corresponding docs

" enable real code completion for python
" (needs vim to be build with python support)
autocmd FileType python set omnifunc=pythoncomplete#Complete
" Better Supertab setup
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

"omnifunc
set omnifunc=syntaxcomplete#Complete

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

" Highlight column 81
set colorcolumn=81

" finally a bunch of shortcuts
" http://sontek.net/dotfiles/vimrc (John M. Anderson's vimrc)
" was quite the inspiration ;)

function! EatChar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunc

"python
iabbr _pyutf # -*- coding: utf8 -*-<CR>

" Powerline
set noshowmode    " disable mode display (powerline has that)

" Airline
" Smarter Tab Line
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
" use Powerline fonts
let g:airline_powerline_fonts = 1
" airline theme
"let g:airline_theme="molokai"

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

" Set UltiSnip Trigger to CTRL-j to avoid YCL mixup
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "snippets"]

" latex helpers
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_ViewRule_pdf='evince'
let g:Tex_CompileRule_pdf='rubber --pdf'

" syntastic helpers
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'active_filetypes': ['javascript',"json",'php',"go","python"],
            \ 'passive_filetypes': [''] }

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

" no automatic folding
set nofoldenable

"enable pep8
let g:pep8_map='<leader>p8'

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" disable YCM for tex
let g:ycm_filetype_blacklist = {'tex' : 1, 'latex': 1, 'markdown': 1}
let g:ycm_register_as_syntastic_checker = 0

" add wordcount to airline
let g:airline_section_z='%3p%% %{g:airline_symbols.linenr}%#__accent_bold#%4l%#__restore__#:%3c wc: %{wordCount#WordCount()}'
