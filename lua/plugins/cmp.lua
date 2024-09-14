return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/vim-vsnip",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      snippet = {
	expand = function(args)
	  vim.fn["vsnip#anonymous"](args.body)
	end,
      },
      mapping = {
	["<C-d>"] = cmp.mapping.scroll_docs(-4),
	["<C-f>"] = cmp.mapping.scroll_docs(4),
	["<C-j>"] = cmp.mapping.select_next_item(),
	["<C-k>"] = cmp.mapping.select_prev_item(),
	["<C-e>"] = cmp.mapping.close(),
	["<CR>"] = cmp.mapping.confirm({
	  behavior = cmp.ConfirmBehavior.Insert,
	  select = true,
	}),
      },
      sources = {
	{ name = "nvim_lsp" },
	{ name = "vsnip" },
	{ name = "buffer" },
      },

    })
  end,

}
