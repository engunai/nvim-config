return {
	{
		"levouh/tint.nvim",
		config = function()
			require('tint').setup({
				tint = -45,              -- Darken colors, use a positive value to brighten
				saturation = 0.6,        -- Saturation to preserve
				transforms = require("tint").transforms.SATURATE_TINT, -- Showing default behavior, but value here can be predefined set of transforms
				tint_background_colors = true, -- Tint background portions of highlight groups
			})
		end
	}
}
