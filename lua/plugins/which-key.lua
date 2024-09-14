return {
	{
		"folke/which-key.nvim",
		lazy = false,
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
		config = function() 
			local wk = require("which-key")
			wk.add({
				{ "<c-p>", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
				{ "<space>f", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
				{ "<space>b", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
			})
			wk.setup({ preset = 'helix' })

		end
	}
}

