for .vim in split(globpath('~/.config/.vim', '*.vim'), '\n')
	exe 'so ' . module
endfo
