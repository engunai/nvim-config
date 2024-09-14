return {
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		-- or                              , branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function ()
			local wk = require("which-key")
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")
			-- telescope 
			wk.add({
				{ "<leader>f", group = "find", desc = "Finder" },
				{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
				{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
				{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
				{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
				{ "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Commands" },
				{ "<leader>fr", "<cmd>Telescope registers<cr>", desc = "Registers" },
				{ "<leader>fm", "<cmd>Telescope marks<cr>", desc = "Marks" },
				{ "<leader>fl", "<cmd>Telescope loclist<cr>", desc = "Loclist" },
				{ "<leader>fq", "<cmd>Telescope quickfix<cr>", desc = "Quickfix" },
				{ "<leader>fd", builtin.diagnostics, desc = "Document Diagnostics" },
				{ "<leader>fo", "<cmd>Telescope vim_options<cr>", desc = "Vim Options" },
				{ "<leader>ft", "<cmd>Telescope filetypes<cr>", desc = "Filetypes" },
				{ "<leader>fw", "<cmd>Telescope grep_string<cr>", desc = "Grep String" },
				-- { "<leader>fd", "<cmd>Telescope lsp_document_diagnostics<cr>", desc = "Document Diagnostics" },
				{ "<leader>fl", "<cmd>Telescope lsp_workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
				{ "<leader>fi", "<cmd>Telescope lsp_implementations<cr>", desc = "Implementations" },
				{ "<leader>fr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
				{ "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
				{ "<leader>fw", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Workspace Symbols" },
			})
		end
	}
}
