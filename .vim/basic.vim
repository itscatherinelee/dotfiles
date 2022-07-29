set title
set encoding=utf-8
" set hybrid line number
set number relativenumber
set ruler
set linebreak
set showcmd
set wildmenu
" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set backspace=2
set mouse=a
