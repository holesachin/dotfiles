return {
	{
		"olimorris/onedarkpro.nvim",
		lazy = false,
		priority = 1000,
		enabled = false,
		config = function() 
			require('onedarkpro').setup({
				options = {
					transparency = true,
				},
			})
			vim.cmd[[colorscheme onedark]]
		end
	},
	{
		"Mofiqul/dracula.nvim",
		lazy = false,
		priority = 1000,
		enabled = true,
		config = function() 
			require('dracula').setup({
					transparent_bg = true,
			})
			vim.cmd[[colorscheme dracula]]
		end
	},
	{
		'projekt0n/github-nvim-theme',
		name = 'github-theme',
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		enabled = false,
		config = function()
			require('github-theme').setup({
				options = { transparent = true, }
			})

			vim.cmd('colorscheme github_dark_dimmed')
		end,
	},
}
