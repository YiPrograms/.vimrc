set et nu ai cin ls=2 ts=4 sw=4 sts=4 ttm=100 mouse=a cb=unnamedplus
syntax on
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap {} {}<Esc>i
inoremap {<CR> {<CR>}<Esc>ko
inoremap ) <C-R>=ClosePair(')')<CR>
inoremap ] <C-R>=ClosePair(']')<CR>
inoremap } <C-R>=ClosePair('}')<CR>
inoremap " <C-R>=QuoteDelim('"')<CR>
inoremap ' <C-R>=QuoteDelim("'")<CR>

map <C-z> :w <CR><bar>:!echo "\n===Complie Started===" && g++ -std=c++11 -O2 -fsanitize=undefined -Wall -Wextra -Wshadow -o %<.o % && echo "===Compile Finished===\n" && echo "=====Run=====" && ./%<.o <CR>
map <C-x> :!echo "\n=====Run=====" && ./%<.o <CR>

function ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf

function QuoteDelim(char)
    let line = getline('.')
    let col = col('.')
    if line[col - 2] == "\\"
        return a:char
    elseif line[col - 1] == a:char
        return "\<Right>"
    else
        return a:char.a:char."\<Esc>i"
    endif
endf


