" get out of horrible vi-compatible mode
set nocompatible
" put this line first in ~/.vimrc
set nocompatible | filetype indent plugin on | syn on

" Setup VAM
fun! SetupVAM()
  let c = get(g:, 'vim_addon_manager', {})
  let g:vim_addon_manager = c
  let c.plugin_root_dir = expand('$HOME', 1) . '/.vim/vim-addons'

  " Force your ~/.vim/after directory to be last in &rtp always:
  " let g:vim_addon_manager.rtp_list_hook = 'vam#ForceUsersAfterDirectoriesToBeLast'

  " most used options you may want to use:
  " let c.log_to_buf = 1
  " let c.auto_install = 0
  let &rtp.=(empty(&rtp)?'':',').c.plugin_root_dir.'/vim-addon-manager'
  if !isdirectory(c.plugin_root_dir.'/vim-addon-manager/autoload')
    execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '
        \       shellescape(c.plugin_root_dir.'/vim-addon-manager', 1)
  endif

  " This provides the VAMActivate command, you could be passing plugin names, too
  call vam#ActivateAddons([], {})
endfun
call SetupVAM()

" ACTIVATING PLUGINS

" OPTION 3: Create a file ~/.vim/plugins putting a PLUGIN_NAME into each line
" See lazy loading plugins section in README.md for details
let scriptpath= expand('$HOME/.vim/plugins', 1)
call vam#Scripts(scriptpath, {'tag_regex': '.*'})

" Encoding
set encoding=utf8

"deoplete
let g:deoplete#enable_at_startup = 1

set completeopt=longest,menuone,preview

function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()

"inoremap <silent><expr> <TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"ale config for integration with deoplete
"call deoplete#custom#option('sources', {
""\ '_': ['ale'],
""\})
"set omnifunc=ale#completion#OmniFunc

" fix backspace for OSX
set backspace=indent,eol,start

" Colors
"set t_Co=16
"colorscheme monokai

if $USER=="root"
   colorscheme rockets-away
else
   colorscheme monokai
endif

set gfn=Source\ Code\ Pro\ for\ Powerline\ 10

"setup copy n paste
if has('mac')
    set clipboard=unnamed
else
    set clipboard=unnamedplus
endif

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

"Move between buffers with Shift+l/h
noremap <S-l> :bn<CR>
noremap <S-h> :bp<CR>

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

" tab completion for command line
set wildmenu

"nerdtree customization
let NERDTreeIgnore=['\.pyc$','\~$']
nnoremap <C-F7> :NERDTreeToggle<CR>
map <C-F7>: NERDTreeToggle<CR>

"start Nerdtree automatically
autocmd vimenter * NERDTree
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" vim-closetag config
let g:closetag_filenames = "*.html,*.xhtml,*.xml,*.phtml"

" don't let jedi-vim popup on .
let g:jedi#popup_on_dot = 0

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

" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" make ctrlp open new tabs not splits
let g:ctrlp_open_new_file = 't'

" now some python stuff
" a few things that also work:
" :Pydoc re.sub gives the corresponding docs

" enable real code completion for python
" (needs vim to be build with python support)
"autocmd FileType python set omnifunc=pythoncomplete#Complete

" remap the CTRL-X,CTRL-O to F1
inoremap <F1> <C-x><C-o>

" enable markdown Syntax Highlighting for .md files (I don't write Modula2)

au BufNewFile,BufRead *.md  setf markdown

" make "gf" go to a python import
" this means that when the cursor is over a python import, and
"  you hit gf vim automatically opens that file
python3 << EOF
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
python3 << EOF
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

" latex helpers
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_ViewRule_pdf='evince'
let g:Tex_CompileRule_pdf='rubber --pdf'


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
"python3 << EOF
"import os.path
"import sys
"import vim
"if 'VIRTUAL_ENV' in os.environ:
""    project_base_dir = os.environ['VIRTUAL_ENV']
""    sys.path.insert(0, project_base_dir)
""    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
""    execfile(activate_this, dict(__file__=activate_this))
"EOF


" add wordcount to airline
let g:airline_section_z='%3p%% %{g:airline_symbols.linenr}%#__accent_bold#%4l%#__restore__#:%3c wc: %{wordCount#WordCount()}'
