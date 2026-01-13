return {
	'nvim-mini/mini.pick',
	enabled = true,
	dependencies = {
		'nvim-mini/mini.extra',
		'nvim-tree/nvim-web-devicons'
	},

	config = function()
		local MiniPick = require('mini.pick')
		local MiniExtra = require('mini.extra')

		MiniPick.setup({
			window = {
				config = {
					relative = 'editor',
					anchor = 'NW',
					-- Position above command line area to avoid overlap
					row = math.max(0, vim.o.lines - vim.o.cmdheight - 15),
					col = 0,
					width = vim.o.columns,
					height = 15,
				},
				prompt_prefix = ' › ',
				prompt_caret = '‹ ',
			},
		})

		-- Highlight groups
		vim.api.nvim_set_hl(0, 'MiniPickPrompt', { fg = '#ff9e64' })       -- orange
		vim.api.nvim_set_hl(0, 'MiniPickPromptCursor', { fg = '#ff9e64' }) -- orange
		vim.api.nvim_set_hl(0, 'MiniPickNormal', { bg = 'NONE' })

		-- Helper: Open files search in specific directory
		local function search_files(path, desc)
			MiniPick.builtin.files({ tool = 'rg' }, { source = { cwd = path } })
		end

		-- Keymaps
		local map = vim.keymap.set
		map('n', '<leader>ff', MiniPick.builtin.files, { desc = '[F]ind [F]iles' })
		map('n', '<leader>fb', MiniPick.builtin.buffers, { desc = '[F]ind [B]uffers' })
		map('n', '<leader>fg', MiniPick.builtin.grep_live, { desc = 'Live [G]rep' })
		map('n', '<leader>fh', MiniPick.builtin.help, { desc = '[F]ind [H]elp' })
		map('n', '<leader>fD', MiniExtra.pickers.diagnostic, { desc = '[F]ind [D]iagnostics' })
		map('n', '<leader>fk', MiniExtra.pickers.keymaps, { desc = '[F]ind [K]eymaps' })
		map('n', '<leader>fl', MiniExtra.pickers.buf_lines, { desc = '[F]ind [L]ines' })
		map('n', '<leader>f.', MiniExtra.pickers.oldfiles, { desc = 'Find Old Files' })
		map('n', '<leader>gc', MiniExtra.pickers.git_commits, { desc = '[G]it [C]ommits' })
		map('n', '<leader>gh', MiniExtra.pickers.git_hunks, { desc = '[G]it [H]unks' })
		map('n', '<leader><leader>', MiniPick.builtin.buffers, { desc = 'Find Existing Buffers' })

		-- Quick access to specific directories
		map('n', '<leader>fn', function() search_files(vim.fn.stdpath('config'), '[F]ind [N]eovim Files') end,
			{ desc = '[F]ind [N]eovim Files' })
		map('n', '<leader>fx', function() search_files(vim.fn.expand('~/nxc'), '[F]ind ni[X] Files') end,
			{ desc = '[F]ind ni[X] Files' })
		map('n', '<leader>fd', function() search_files(vim.fn.expand('~/dotfiles'), '[F]ind [D]otfiles') end,
			{ desc = '[F]ind [D]otfiles' })
	end,
}
