" Vim ftdetect file
" Language: aos
" Maintainer: Ben Reedy <breed808@breed808.com>
autocmd BufNewFile,BufRead *.aos set filetype=aos

autocmd BufNewFile,BufRead * 
    \ if getline(1) =~# '\v^\![=]+\!$' && getline(2) =~# '\v^\! File:' |
    \   set filetype=aos |
    \ endif
