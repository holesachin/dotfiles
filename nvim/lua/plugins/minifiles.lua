return {
	"nvim-mini/mini.files", version = '*',

	config = function()
		require("mini.files").setup({
			mappings = {
				go_in      = 'L',
				go_in_plus = 'l',
			},

			options = {
				use_as_default_explorer = true,
				permanent_delete = false,
			},

			windows = {
				preview = true,
				width_focus = 30,
				width_preview = 70,
			},

			-- open&close minifiles
			vim.keymap.set('n', '<leader>n', '<Cmd>lua MiniFiles.open()<CR>', { silent = true, desc = "Open MiniFiles in current working Directory." }),
			vim.keymap.set('n', '<Esc>', '<Cmd>lua MiniFiles.close()<CR>', { silent = true, desc = "Close MiniFiles." }),
			vim.keymap.set('n', '<leader>m', '<Cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>', { silent = true, desc = "Open MiniFiles in current 'FILEs' Directory." }),

			-- Custom Keymaps
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "minifiles",
				callback = function()
					-- import minifiles module
					local MiniFiles = require('mini.files')

					-- coppy current file fullpath to clipboard
					vim.keymap.set("n", "<leader>yy", function()
						local curr_entry = MiniFiles.get_fs_entry()
						if curr_entry then
							-- Copy the full path of the current file to the clipboard
							vim.fn.setreg('+', curr_entry.path)
							vim.notify("File path copied to clipboard", vim.log.levels.INFO)
						else
							-- Notify if no entry is selected
							vim.notify("No entry selected", vim.log.levels.WARN)
						end
					end, { buffer = true, noremap = true, silent = true })

					-- zip selected directory or file and copy to clipboard
					vim.keymap.set("n", "<leader>yz", function()
						local curr_entry = MiniFiles.get_fs_entry()
						if curr_entry then
							-- Zip the selected directory or file and copy the path to the clipboard
							local zip_path = MiniFiles.zip(curr_entry.path)
							vim.fn.setreg('+', zip_path)
							vim.notify("Zip file path copied to clipboard", vim.log.levels.INFO)
						else
							-- Notify if no entry is selected
							vim.notify("No entry selected", vim.log.levels.WARN)
						end
					end, { buffer = true, noremap = true, silent = true })

					-- preview image in sxiv
					vim.keymap.set("n", "<space>pi", function()
						local curr_entry = MiniFiles.get_fs_entry()
						if curr_entry then
							-- Preview the file using Quick Look
							vim.system({ "sxiv", "-b", curr_entry.path }, {
								stdout = false,
								stderr = false,
							})
						end
					end, { buffer = true, noremap = true, silent = true, desc = "Preview image with sxiv." })
				end
			}),

			-- Customize highlights for transparency
			vim.api.nvim_set_hl(0, 'Minifiles', { bg = 'none' }),
			vim.api.nvim_set_hl(0, 'MiniFilesNormal', { bg = 'NONE', fg = '#dbceba' }),       -- Adjust fg color as needed
			vim.api.nvim_set_hl(0, 'MiniFilesBorder', { bg = 'NONE', fg = '#57544d' }),       -- For borders, if applicable
			vim.api.nvim_set_hl(0, 'MiniFilesDirectory', { bg = 'NONE', fg = '#87D7FF' }),    -- Directory names
			vim.api.nvim_set_hl(0, 'MinifilesTitle', { bg = 'none' }),                        -- Ensures Minifiles title bar is transparen
			vim.api.nvim_set_hl(0, 'MinifilesTitleFocused', { bg = 'none', fg = "#D99FF7" }), -- Ensures focused title bar is transparent
			vim.api.nvim_set_hl(0, 'MinifilesStatus', { bg = 'none' }),                       -- Ensures status line is transparent
		})
	end
}
