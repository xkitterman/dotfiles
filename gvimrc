" do not display menu or toolbar
set guioptions-=m
set guioptions-=T

" do not display left scrollbars
set guioptions-=l
set guioptions-=L

" do not display right scrollbars
set guioptions-=r
set guioptions-=R

" do not display bottom scrollbar
set guioptions-=b

" syntax color settings
set background=dark
let g:gruvbox_italic=1
colorscheme gruvbox

set columns=999
set lines=999

if has("unix")
   " vim settings specific to unix

   " font settings
   set guifont=inconsolata\ 13

elseif has("win32") || has("win64")
   " vim settings specific to windows

   " font settings
   set guifont=consolas:h11

endif
