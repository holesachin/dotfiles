-- lazy.nvim
return {
	'folke/noice.nvim',
	dependencies = { 'MunifTanjim/nui.nvim' },

	opts = {
		-- LSP overrides for better markdown rendering
		lsp = {
			override = {
				['vim.lsp.util.convert_input_to_markdown_lines'] = true,
				['vim.lsp.util.stylize_markdown'] = true,
				['cmp.entry.get_documentation'] = true,
			},
		},

		-- Presets for cmdline behavior
		presets = {
			bottom_search = true,         -- classic bottom cmdline for search
			command_palette = true,       -- position cmdline and popupmenu together
			long_message_to_split = true, -- long messages → split
			inc_rename = false,           -- disable input dialog for inc-rename
			lsp_doc_border = false,       -- no border for hover/signature docs
		},

		-- Popup view configuration
		views = {
			cmdline_popup = {
				position = { row = 5, col = '50%' },
				size = { width = 60, height = 'auto' },
				border = { style = 'single' },
			},
			popupmenu = {
				relative = 'editor',
				position = { row = 8, col = '50%' },
				size = { width = 60, height = 10 },
				border = { style = 'single', padding = { 0, 1 } },
			},
		},

		-- Filter routes to reduce noise
		routes = {
			{
				filter = { event = 'msg_show', kind = '', find = 'written' },
				opts = { skip = true },
			},
		},
	},
}
