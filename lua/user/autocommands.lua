vim.cmd [[
    let s:IgnoreChange=0
    augroup _general_settings
        autocmd!
        autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close <CR>
        autocmd TextYankPost * silent !lua require('vim.highlight').on_yank({higroup = 'Search', timeout = 200})
        autocmd BufWinEnter * :set formatoptions-=cro
        autocmd! FileChangedRO * nested
            \ let s:IgnoreChange=1 |
            \ call system("p4 edit " . expand("%")) |
            \ set noreadonly
        autocmd! FileChangedShell *
            \ if 1 == s:IgnoreChange |
            \   let v:fcs_choice="" |
            \   let s:IgnoreChange=0 |
            \ else |
            \   let v:fcs_choice="ask" |
            \ endif
        autocmd FileType qf set nobuflisted
    augroup end
]]

-- autocmd BufWritePost * silent lua require('user.saveasadmin').prompt_saa() 
