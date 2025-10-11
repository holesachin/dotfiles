return {
	'nvim-mini/mini.pick',
	dependencies = { "nvim-mini/mini.extra" },

	config = function()

		vim.api.nvim_set_hl(0, "MiniPickPrompt", { fg = "orange" })
		vim.api.nvim_set_hl(0, "MiniPickMatchCurrent", { fg = "yellow", bg = "" })
		vim.api.nvim_set_hl(0, "MiniPickPromptCursor", { fg = "orange", bg = "" })
		vim.api.nvim_set_hl(0, "MiniPickPromptPrefix", { fg = "cyan", bg = "" })
		vim.api.nvim_set_hl(0, "MiniPickPromptCaret", { fg = "cyan", bg = "" })

		require('mini.pick').setup({

			window = {
				config = {
					border = "double",
					relative = "cursor", 
					anchor = 'NW',
					row = vim.o.lines, col = 0,
					width = 600, height = 15,
				},
				prompt_prefix = ' [ ',
				prompt_caret = ' ] ',
			},

			-- Keymap
			vim.keymap.set('n', '<leader>ff', '<Cmd>lua MiniPick.builtin.files()<CR>',      { desc = "[F]ind [F]iles." }),
			vim.keymap.set('n', '<leader>fb', '<Cmd>lua MiniPick.builtin.buffers()<CR>',    { silent = true, desc = "[F]ind [B]uffers" }),
			vim.keymap.set('n', '<leader>fg', '<Cmd>lua MiniPick.builtin.grep_live()<CR>',  { silent = true, desc = "Grep" }),
			vim.keymap.set('n', '<leader>fh', '<Cmd>lua MiniPick.builtin.help()<CR>',       { silent = true, desc = "[F]ind [H]elp" }),
			vim.keymap.set('n', '<leader>fd', '<Cmd>lua MiniExtra.pickers.diagnostic()<CR>', { silent = true, desc = "[F]ind [D]iagostic" }),
			vim.keymap.set('n', '<leader>fk', '<Cmd>lua MiniExtra.pickers.keymaps()<CR>',   { silent = true, desc = "[F]ind [K]eymaps" }),
			vim.keymap.set('n', '<leader>fl', '<Cmd>lua MiniExtra.pickers.buf_lines()<CR>', { silent = true, desc = "Find Lines" }),
			vim.keymap.set('n', '<leader>f.', '<Cmd>lua MiniExtra.pickers.oldfiles()<CR>',  { silent = true, desc = "Find Old Files" }),

			vim.keymap.set('n', '<leader>gc', '<Cmd>lua MiniExtra.pickers.git_commits()<CR>', { silent = true, desc = "[G]it [C]ommits" }),
			vim.keymap.set('n', '<leader>gh', '<Cmd>lua MiniExtra.pickers.git_hunks()<CR>',   { silent = true, desc = "[G]it [H]unks" }),

			vim.keymap.set('n', '<leader><leader>', '<Cmd>lua MiniPick.builtin.buffers()<CR>',    { silent = true, desc = "Find Exsisting Buffers" }),
		})
	end
}
