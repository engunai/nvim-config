return {
	{
	"kevinhwang91/nvim-ufo", dependencies = { "kevinhwang91/promise-async" },
	config = function()
		local ufo = require("ufo")
		local wk = require("which-key")
		wk.add({
			{ "zc", "<cmd>lua require('ufo').close()<cr>", desc = "Close UFO" },
			{ "zo", "<cmd>lua require('ufo').open()<cr>", desc = "Open UFO" },
			{ "zt", "<cmd>lua require('ufo').toggle()<cr>", desc = "Toggle UFO" },
		})
		ufo.setup({  })
	end
	}
}
