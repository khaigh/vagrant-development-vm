autocmd BufWritePre *.go Fmt " go fmt on save
abbrev gobi :!go build -v . ./... && go install . ./...<CR>
map <buffer> <F4> :w<CR>:!go build % <CR>
map <buffer> <F5> :w<CR>:!go run % <CR>
nmap <buffer> <F10> :Godoc<CR>
