autocmd BufNewFile,BufRead *.yaml,*.yml if search('{{.\+}}', 'nw') | setlocal filetype=gotmpl | endif

