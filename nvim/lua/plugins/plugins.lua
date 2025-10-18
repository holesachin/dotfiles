return {

	-- UndoTree
	{
		'mbbill/undotree'
	},

	-- Merge Tmux -> Vim status bar
	{
		'vimpostor/vim-tpipeline',
		enabled = false,
	},

	-- Just Lsp Server Configurations
	{
		"neovim/nvim-lspconfig",
	},

	-- Markdown
	{
		'MeanderingProgrammer/render-markdown.nvim',
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},

	-- Obsidian
	{
		"epwalsh/obsidian.nvim",
		lazy = true,
		ft = "marldown",
		config = function() 
			require('obsidian').setup({
				ui = { enabled = false, },
				workspaces = {
					{
						name = "znox",
						path = "~/znox",
					},
				},
			})
		end
	},

	-- Navigating form vim to tmux panes
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},

}
