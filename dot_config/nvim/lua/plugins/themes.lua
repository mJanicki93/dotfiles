return {
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "rose-pine/neovim", name = "rose-pine" },
	{
		"neanias/everforest-nvim",
		name = "everforest",
		priority = 1000,
		config = function()
			require("everforest").setup({
				-- Opcje: 'low', 'medium', 'hard' (kontrast tła)
				background = "medium",
				-- 'material', 'mix', 'original' (styl kolorów)
				transparent_background_level = 1,
				ui_contrast = "low",
				diagnostic_text_highlight = true,
			})
		end,
	},
}
