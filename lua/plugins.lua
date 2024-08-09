-- coc
-- 
-- imap 

local keyset = vim.keymap.set
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
-- Use K to show documentation in preview window
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})

-- goto
keyset("n", "gd", '<Plug>(coc-definition)', { silent = true })
-- goto reference
keyset("n", "gr", '<Plug>(coc-references)', { silent = true })
-- format code
-- keyset("n", "==", '<Plug>(coc-format-selected)', { silent = true})
keyset("x", "=", "<Plug>(coc-format-selected)", { silent = true})
-- comment code
keyset("n", "<leader>c", '<CMD>(coc-diagnostic-toggle-comment)<CR>', opts)
-- CocoDiagnostic
keyset("n", "]g", '<Plug>(coc-diagnostic-next)<CR>', { silent = true })
keyset("n", "[g", '<Plug>(coc-diagnostic-prev)<CR>', { silent = true })



-- Telescope
--
-- Find files using Telescope command-line sugar.
local builtin = require('telescope.builtin')
keyset("n", "<space>f", builtin.find_files, {})
keyset("n", "<space>/", builtin.live_grep, {})
keyset("n", "<space>b", builtin.buffers, {})
--keyset("n", "<leader>h", builtin.help_tags, {})
--

-- GitSigns
require('gitsigns').setup {
  signs = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signs_staged = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signs_staged_enable = true,
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    follow_files = true
  },
  auto_attach = true,
  attach_to_untracked = false,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
    virt_text_priority = 100,
  },
  current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
}

-- UFO
vim.o.foldmethod = 'manual'
vim.opt.foldmethod = 'manual'
local ftMap = {
    vim = 'indent',
    python = {'indent'},
    git = ''
}
require('ufo').setup {
    open_fold_hl_timeout = 150,
    close_fold_kinds_for_ft = {
        default = {'imports', 'region'},
        json = {'array'},
        c = {'comment', 'region'}
    },
    preview = {
        win_config = {
            border = {'', '─', '', '', '', '─', '', ''},
            winhighlight = 'Normal:Folded',
            winblend = 0
        },
        mappings = {
            scrollU = '<C-u>',
            scrollD = '<C-d>',
            jumpTop = '[',
            jumpBot = ']'
        }
    },
    provider_selector = function(bufnr, filetype, buftype)
        -- if you prefer treesitter provider rather than lsp,
        -- return ftMap[filetype] or {'treesitter', 'indent'}
        -- return ftMap[filetype]
	return ''

        -- refer to ./doc/example.lua for detail
    end
}
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
vim.keymap.set('n', 'zP', function()
    local winid = require('ufo').peekFoldedLinesUnderCursor()
    if not winid then
        -- choose one of coc.nvim and nvim lsp
        vim.fn.CocActionAsync('definitionHover') -- coc.nvim
        vim.lsp.buf.hover()
    end
end)


-- ibl
-- require('ibl').setup {
--     scope = {
-- 	show_start = false,
-- 	char = '·',
-- 	highlight = { 'CursorLine', 'Whitespace' },
--     },
-- }
-- require('ibl').setup {
-- 	indent = {
-- 		char = '|',
-- 		highlight = { 'CursorColumn', 'Whitespace' },
-- 	},
-- 	scope = {
-- 		char = '·',
-- 		highlight = { 'CursorLine', 'Whitespace' },
-- 	},
-- }
--
-- tabscope
-- Initialize tabscope
require("tabscope").setup({})


-- bufferline
vim.opt.termguicolors = true
require("bufferline").setup({})
