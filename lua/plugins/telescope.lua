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
				{ "<leader>/", group = "telescope", desc = "Telescope" },
				{ "<leader>/f", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
				{ "<leader>/g", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
				{ "<leader>/b", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
				{ "<leader>/h", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
				{ "<leader>/c", "<cmd>Telescope commands<cr>", desc = "Commands" },
				{ "<leader>/r", "<cmd>Telescope registers<cr>", desc = "Registers" },
				{ "<leader>/m", "<cmd>Telescope marks<cr>", desc = "Marks" },
				{ "<leader>/l", "<cmd>Telescope loclist<cr>", desc = "Loclist" },
				{ "<leader>/q", "<cmd>Telescope quickfix<cr>", desc = "Quickfix" },
				{ "<leader>/d", builtin.diagnostics, desc = "Document Diagnostics" },
				{ "<leader>/o", "<cmd>Telescope vim_options<cr>", desc = "Vim Options" },
				{ "<leader>/t", "<cmd>Telescope filetypes<cr>", desc = "Filetypes" },
				{ "<leader>/w", "<cmd>Telescope grep_string<cr>", desc = "Grep String" },
				-- { "<leader>/d", "<cmd>Telescope lsp_document_diagnostics<cr>", desc = "Document Diagnostics" },
				{ "<leader>/l", "<cmd>Telescope lsp_workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
				{ "<leader>/i", "<cmd>Telescope lsp_implementations<cr>", desc = "Implementations" },
				{ "<leader>/r", "<cmd>Telescope lsp_references<cr>", desc = "References" },
				{ "<leader>/s", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
				{ "<leader>/w", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Workspace Symbols" },
			})
		end
	}
}
