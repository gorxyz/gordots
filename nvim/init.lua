vim.fn['plug#begin']()

vim.cmd [[Plug 'neovim/nvim-lspconfig']]
vim.cmd [[Plug 'hrsh7th/nvim-cmp']]
vim.cmd [[Plug 'hrsh7th/cmp-buffer']]
vim.cmd [[Plug 'hrsh7th/cmp-path']]
vim.cmd [[Plug 'hrsh7th/cmp-cmdline']]
vim.cmd [[Plug 'hrsh7th/cmp-nvim-lsp']]
vim.cmd [[Plug 'hrsh7th/vim-vsnip']]
vim.cmd [[Plug 'ap/vim-css-color']]
vim.cmd [[Plug 'preservim/nerdtree']]
vim.cmd [[Plug 'junegunn/fzf.vim']]
vim.cmd [[Plug 'https://github.com/vim-airline/vim-airline']]
vim.cmd [[Plug 'https://github.com/vim-airline/vim-airline-themes']]
vim.cmd [[Plug 'https://github.com/ryanoasis/vim-devicons']]

vim.fn['plug#end']()

local function t(str)
    -- Adjust boolean arguments as needed
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

vim.g.mapleader = t'<Space>'
vim.g.maplocalleader = t'<Space>'

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

vim.opt.conceallevel = 2
vim.opt.list = true
vim.opt.listchars = {
    tab = '» ',
    trail = '␣',
    extends = '▶',
    precedes = '◀',
}

vim.g.solarized_visibility = 'low'
vim.opt.background = 'dark'
vim.cmd [[colorscheme solarized]]

vim.g.airline_powerline_fonts = 1
vim.g.bufferline_rotate = 1
vim.g.bufferline_fixed_index = -1
vim.g.bufferline_echo = 0

vim.cmd [[nnoremap <silent> <expr> <CR> &buftype ==# 'quickfix' ? "\<CR>" : ":nohl\<CR>"]]

vim.g.NERDAltDelims_c = 1
vim.api.nvim_set_keymap("n", "<Leader>t", "<Cmd>silent! NERDTreeFind<CR><Cmd>NERDTreeToggle<CR>", { silent=true, noremap=true })

vim.g.fzf_command_prefix = 'Fzf'
vim.api.nvim_set_keymap("n", "<Leader>f", "<Cmd>FzfFiles<CR>", { silent=true, noremap=true })

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require('cmp')
cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	["<Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    elseif vim.fn["vsnip#available"](1) == 1 then
      feedkey("<Plug>(vsnip-expand-or-jump)", "")
    elseif has_words_before() then
      cmp.complete()
    else
      fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
    end
  end, { "i", "s" }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, {
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- LSP

local nvim_lsp = require('lspconfig')

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = {
      spacing = 4,
      severity_limit = "Error",
    },
    signs = false,
    update_in_insert = false,
  }
)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer

vim.cmd [[highlight LspReferenceText cterm=bold guibg=LightYellow]]
vim.cmd [[highlight LspReferenceRead cterm=bold ctermbg=0 guibg=LightYellow]]
vim.cmd [[highlight LspReferenceWrite cterm=bold ctermbg=0 guibg=LightYellow]]

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "clangd", "pyright", "rust_analyzer", "sumneko_lua" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = lsp_on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = capabilities,
  }
end

vim.cmd [[
inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{ {
inoremap {} {}
]]

vim.cmd 
[[augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set rnu
    autocmd BufLeave,FocusLost,InsertEnter * set nornu
augroup END]]

vim.cmd [[autocmd filetype cpp nnoremap <Leader>j :w <bar> !g++ -std=c++20 % -o %:r -Wextra -Wall<CR>]]
vim.cmd [[autocmd filetype c nnoremap <Leader>j :w <bar> !gcc -std=c11 % -o %:r -Wextra -Wall<CR>]]
vim.cmd [[autocmd filetype lua nnoremap <Leader>j :w <bar> !lua %<CR>]]
vim.cmd [[autocmd filetype python nnoremap <Leader>j :w <bar> !python3 %<CR>]]
vim.cmd [[autocmd filetype rust nnoremap <Leader>j :w <bar> !cargo run<CR>]]
