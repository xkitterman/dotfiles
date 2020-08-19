packadd minpac
call minpac#init()

" Plugins
call minpac#add("Valloric/YouCompleteMe")
call minpac#add("itchyny/lightline.vim")
call minpac#add("junegunn/fzf")
call minpac#add("junegunn/fzf.vim")
call minpac#add("leafgarland/typescript-vim")
call minpac#add("altercation/vim-colors-solarized")
call minpac#add("tpope/vim-fugitive")

let mapleader="\<space>"

" Hack to resolve the following warning upon vim startup:
"   DeprecationWarning: the imp module is deprecated in favour of importlib; see the module's documentation for alternative uses
if has ("python3")
    silent! python3 1
endif

syntax on
filetype plugin indent on

set autoread

let g:netrw_liststyle=3
let g:netrw_preview=1

" terminal colorscheme
set t_Co=256
set background=light
let g:solarized_termcolors=256
colorscheme solarized

set number
set ruler

set cmdheight=3

" always display status bar
set laststatus=2

set spelllang=en_us

" default search settings
set ignorecase
set smartcase
set incsearch
set hlsearch

set hidden

set history=1000

set wildmenu
set wildmode=list:longest

set visualbell
set scrolloff=3

" default tab settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set omnifunc=syntaxcomplete#Complete

if has("autocmd")
   " specific settings based on filetype
   autocmd filetype make setlocal ts=2 sts=2 sw=2 noexpandtab
   autocmd filetype java setlocal ts=4 sts=4 sw=4
   autocmd filetype java setlocal omnifunc=javacomplete#Complete
   autocmd filetype java setlocal completefunc=javacomplete#CompleteParamsInfo
   autocmd filetype javascript setlocal ts=2 sts=2 sw=2
   autocmd filetype typescript setlocal ts=2 sts=2 sw=2
   autocmd filetype *.css setlocal ts=2 sts=2 sw=2
   autocmd filetype *.cpp,*.hpp,*.cxx setlocal omnifunc=omni#cpp#complete#Main
endif

" convert current word being typed to all caps
inoremap <c-u> <esc>gUiwea

" window focus mappings
noremap <c-w> <c-w>w

" window movement mappings

" easy editing of files in current working directory
noremap <leader>ew :e <c-r>=expand("%:p:h") . "/" <cr>
noremap <leader>es :sp <c-r>=expand("%:p:h") . "/" <cr>
noremap <leader>ev :vsp <c-r>=expand("%:p:h") . "/" <cr>
noremap <leader>et :tabe <c-r>=expand("%:p:h") . "/" <cr>

" toggle display of unprintable characters
nnoremap <silent> <leader>l :set list!<cr>

" toggle spell check
nnoremap <silent> <leader>s :set spell!<cr>

nnoremap <leader>e :Explore<cr>

nnoremap <leader>w :w<cr>
nnoremap <leader>v :vsp $MYVIMRC<cr>
nnoremap <leader>g :vsp $MYGVIMRC<cr>

nnoremap <leader>f :Files<cr>
nnoremap <leader>b :Buffers<cr>

" omnicppcomplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

set completeopt=menuone,menu,longest,preview

if !exists("g:ycm_semantic_triggers")
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers["typescript"] = ["."]

let $FZF_DEFAULT_COMMAND = 'ag -g ""'

command! Cpptags !ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .

command! Source source %
command! Cd cd %:p:h

" minpac convenience commands
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

" autospell corrections
abbr accross across
abbr becuase because
abbr hte the
abbr intial initial
abbr manger manager

let g:lightline = {
            \ "colorscheme": "wombat",
            \ "active": {
            \   "left": [ [ "mode", "paste" ], [ "gitbranch", "readonly", "filename", "modified" ] ],
            \   "right": [ [ "lineinfo" ], [ "percent" ], [ "fileformat", "fileencoding", "filetype", "charvaluehex" ] ]
            \ },
            \ "component_function": {
            \   "gitbranch": "fugitive#head"
            \ },
            \ "component": {
            \   "charvaluehex": "0x%02B"
            \ },
            \ }

if has("unix")
   " vim settings specific to unix

   " hidden character settings
   set listchars=tab:â–¹\ ,eol:Â¬

elseif has("win32") || has("win64")
   " vim settings specific to windows

   " hidden character settings
   set listchars=tab:»\ ,eol:¬
endif
