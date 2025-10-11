return {

	-- mini.extra
	{
		"nvim-mini/mini.extra",
		config = function()
			require("mini.extra").setup()
		end,
	},

	-- mini.ai
	{
		"nvim-mini/mini.ai",
		config = function()
			require("mini.ai").setup({ n_lines = 500 })
		end,
	},

	-- mini.surround
	{
		"nvim-mini/mini.surround",
		config = function()
			require("mini.surround").setup()
		end,
	},

	-- mini.statusline
	{
		"nvim-mini/mini.statusline",
		config = function()

			vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })

			require("mini.statusline").setup({
				use_icons = vim.g.have_nerd_font,

			})
		end,
	},

	-- mini.animate
	{
		"nvim-mini/mini.animate",
		config = function()
			require("mini.animate").setup()
		end,
	},

	-- mini.pairs
	{
		"nvim-mini/mini.pairs",
		config = function()
			require("mini.pairs").setup()
		end,
	},

	-- mini.comment
	{
		"nvim-mini/mini.comment",
		config = function()
			require("mini.comment").setup()
		end,
	},

	-- mini.notify
	{
		"nvim-mini/mini.notify",
		config = function()
			require("mini.notify").setup({
				lsp_progress = {
					enable = true,
					level = 'INFO',
					duration_last = 3000,
				},
			})
		end,
	},

	-- mini.hipatterns
	{
		"nvim-mini/mini.hipatterns",
		config = function()
			require("mini.hipatterns").setup({
				highlighters = {
					fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
					hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
					todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
					note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },
				},
			})
		end,
	},

	-- mini.starter
	{
		"nvim-mini/mini.starter",
		config = function()
			require("mini.starter").setup({
				header = [[
																								
				 ████ ██████           █████      ██
				███████████             █████ 
				█████████ ███████████████████ ███   ███████████
			 █████████  ███    █████████████ █████ ██████████████
			█████████ ██████████ █████████ █████ █████ ████ █████
		███████████ ███    ███ █████████ █████ █████ ████ █████
	 ██████  █████████████████████ ████ █████ █████ ████ ██████

																!! 󰥳  !!
				]],
			})
		end,
	},
}
