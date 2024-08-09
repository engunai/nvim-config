-- Leader key
vim.g.mapleader = ','
-- Show Number
vim.wo.number = true
-- Show Relative Number
vim.wo.relativenumber = true

-- signcolumn
vim.wo.signcolumn = 'yes'
vim.cmd('colorscheme solarized')

vim.o.background = 'light'
-- vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- disalbed soft wrap
vim.wo.wrap = false



require('solarized').setup({
  palette = 'solarized',
})


-- Keybindings
local keyset = vim.keymap.set
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
-- save
keyset("n", "<space>w", ":w<CR>", { silent = true })

--clear search
keyset("n", "<leader><cr>", ":nohlsearch<CR>", { silent = true })


-- buffers
-- close buffer
keyset("n", "<leader>q", ":bd<CR>", { silent = true })
-- next buffer
keyset("n", "<leader>l", ":bn<CR>", { silent = true })
-- previous buffer
keyset("n", "<leader>h", ":bp<CR>", { silent = true })

-- tabs
-- new tab
keyset("n", "<leader>t", ":tabnew<CR>", { silent = true })
-- next tab
keyset("n", "<leader>]", ":tabnext<CR>", { silent = true })
-- previous tab
keyset("n", "<leader>[", ":tabprevious<CR>", { silent = true })

