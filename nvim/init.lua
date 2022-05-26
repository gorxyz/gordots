vim.fn['plug#begin']()
vim.cmd [[Plug 'junegunn/fzf.vim']]
vim.cmd [[Plug 'ishan9299/modus-theme-vim']]
vim.fn['plug#end']()

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.termguicolors = true
vim.opt.swapfile = false
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.wrap = false
vim.opt.expandtab = false
vim.opt.number = true
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.title = true
vim.opt.joinspaces = false
vim.opt.mouse = 'a'
vim.opt.laststatus = 2
vim.opt.clipboard = "unnamedplus"

vim.cmd('color modus-operandi')

vim.api.nvim_set_keymap("n", "<Leader>e", "<Cmd>Explore<CR>", { silent=true, noremap=true })
vim.api.nvim_set_keymap("n", "<Leader>d", "<Cmd>Buffers<CR>", { silent=true, noremap=true })
vim.api.nvim_set_keymap("n", "<Leader>f", "<Cmd>Files<CR>", { silent=true, noremap=true })
vim.api.nvim_set_keymap("n", "<Leader>l", "<Cmd>tabnext<CR>", { silent=true, noremap=true })
vim.api.nvim_set_keymap("n", "<Leader>h", "<Cmd>tabprevious<CR>", { silent=true, noremap=true })
vim.api.nvim_set_keymap("n", "<Leader><CR>", "<Cmd>!./build.sh<CR>", { silent=true, noremap=true })

vim.api.nvim_set_keymap("n", "<C-h>", "<Cmd>bprev<CR>", { silent=true, noremap=true} )
vim.api.nvim_set_keymap("n", "<C-l>", "<Cmd>bnext<CR>", { silent=true, noremap=true} )
vim.api.nvim_set_keymap("n", "<C-q>", "<Cmd>bd<CR>",    { silent=true, noremap=true} )

vim.cmd [[autocmd filetype cpp nnoremap <Leader>j :w <bar> !time g++ -std=c++20 % -o %:r -Wextra -Wall<CR>]]
vim.cmd [[autocmd filetype c nnoremap <Leader>j :w <bar> !time gcc -std=c11 % -o %:r -Wextra -Wall<CR>]]
vim.cmd [[autocmd filetype lua nnoremap <Leader>j :w <bar> !time lua %<CR>]]
vim.cmd [[autocmd filetype python nnoremap <Leader>j :w <bar> !time python3 %<CR>]]
vim.cmd [[autocmd filetype rust nnoremap <Leader>j :w <bar> !time cargo run<CR>]]
