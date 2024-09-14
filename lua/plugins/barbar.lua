return {
	{'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    config = function ()
    	local map = vim.api.nvim_set_keymap	
	local opts = { noremap = true, silent = true }
	-- move to previous/next
	map('n', '<A-,>', ':BufferPrevious<CR>', opts)
	map('n', '<A-.>', ':BufferNext<CR>', opts)
    end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
}
