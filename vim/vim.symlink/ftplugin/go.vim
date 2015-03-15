" go.vim: Vim filetype plugin for Go.

if exists("b:did_my_ftplugin")
    finish
endif
let b:did_my_ftplugin = 1

nmap <buffer> <silent> <LocalLeader>r <Plug>(go-run)
nmap <buffer> <silent> <LocalLeader>b <Plug>(go-build)
nmap <buffer> <silent> <LocalLeader>p <Plug>(go-info)
nmap <buffer> <silent> <LocalLeader>i <Plug>(go-install)
nmap <buffer> <silent> <LocalLeader>t <Plug>(go-test)
nmap <buffer> <silent> <LocalLeader>ds <Plug>(go-def-split)
nmap <buffer> <silent> <LocalLeader>dv <Plug>(go-def-vertical)
nmap <buffer> <silent> <LocalLeader>dv <Plug>(go-def-vertical)

