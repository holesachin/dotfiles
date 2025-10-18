return {
	'nvim-mini/mini.pick',
	dependencies = { 
		'nvim-mini/mini.extra',
		'nvim-tree/nvim-web-devicons'
	},

	config = function()
		-- Require modules properly
		local MiniPick  = require('mini.pick')
		local MiniExtra = require('mini.extra')

		-- Setup MiniPick
		MiniPick.setup({
			window = {
				config = {
					relative = "editor",
					anchor = "NW",
					row = vim.o.lines,
					col = 0,
					width = vim.o.columns,
					height = 15,
				},
				prompt_prefix = ' [ ',
				prompt_caret = ' ] ',
			},
		})

		-- Highlight groups
		vim.api.nvim_set_hl(0, "MiniPickPrompt",        { fg = "orange" })
		vim.api.nvim_set_hl(0, "MiniPickPromptCursor",  { fg = "orange" })
		vim.api.nvim_set_hl(0, "MiniPickPromptPrefix",  { fg = "cyan" })
		vim.api.nvim_set_hl(0, "MiniPickPromptCaret",   { fg = "cyan" })
		vim.api.nvim_set_hl(0, "MiniPickNormal",        { bg = "NONE" })

		-- Keymaps
		local map = vim.keymap.set
		map('n', '<leader>ff', MiniPick.builtin.files,                  { desc = "[F]ind [F]iles" })
		map('n', '<leader>fb', MiniPick.builtin.buffers,                { desc = "[F]ind [B]uffers" })
		map('n', '<leader>fg', MiniPick.builtin.grep_live,              { desc = "Live [G]rep" })
		map('n', '<leader>fh', MiniPick.builtin.help,                   { desc = "[F]ind [H]elp" })
		map('n', '<leader>fD', MiniExtra.pickers.diagnostic,            { desc = "[F]ind [D]iagnostics" })
		map('n', '<leader>fk', MiniExtra.pickers.keymaps,               { desc = "[F]ind [K]eymaps" })
		map('n', '<leader>fl', MiniExtra.pickers.buf_lines,             { desc = "[F]ind [L]ines" })
		map('n', '<leader>f.', MiniExtra.pickers.oldfiles,              { desc = "Find Old Files" })
		map('n', '<leader>gc', MiniExtra.pickers.git_commits,           { desc = "[G]it [C]ommits" })
		map('n', '<leader>gh', MiniExtra.pickers.git_hunks,             { desc = "[G]it [H]unks" })
		map('n', '<leader><leader>', MiniPick.builtin.buffers,          { desc = "Find Existing Buffers" })

		-- Neovim config
		map('n', '<leader>fn', function()
			local path = vim.fn.stdpath("config")
			MiniPick.builtin.files({ tool = 'rg' }, { source = { cwd = path } })
		end, { desc = "[F]ind [N]eovim Files" })

		-- NixOS config
		map('n', '<leader>fx', function()
			local path = vim.fn.expand("~/nxc")
			MiniPick.builtin.files({ tool = 'rg' }, { source = { cwd = path } })
		end, { desc = "[F]ind ni[X] Files" })

		--  Dotfiles
		map('n', '<leader>fd', function()
			local path = vim.fn.expand("~/dotfiles")
			MiniPick.builtin.files({ tool = 'rg' }, { source = { cwd = path } })
		end, { desc = "[F]ind [D]otfiles" })

	end,
}
