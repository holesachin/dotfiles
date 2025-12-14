require('options')
require('keymaps')
require('autocmds')
require('lsp')

-- MINI DEPS PACKAGE MANAGER

-- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
	vim.cmd('echo "Installing `mini.nvim`" | redraw')
	local clone_cmd = { 'git', 'clone', '--filter=blob:none', 'https://github.com/nvim-mini/mini.nvim', mini_path }
	vim.fn.system(clone_cmd)
	vim.cmd('packadd mini.nvim | helptags ALL')
	vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

-- Set up 'mini.deps' (customize to your liking)
require('mini.deps').setup()

local now, later = MiniDeps.now, MiniDeps.later

-- mini.tatusline
now(function() require('mini.statusline').setup({
	use_icons = vim.g.have_nerd_font,
	set_vim_settings = false,
}) end)
vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })
vim.api.nvim_set_hl(0, "MiniStatuslineFilename", { bg = "NONE" })

-- mini.files
now(function() require('mini.files').setup({
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
})end)

now(function() require('mini.pairs').setup() end)
now(function() require('mini.extra').setup() end)
now(function() require('mini.ai').setup({ n_lines = 500 }) end)
now(function() require('mini.surround').setup() end)
now(function() require('mini.animate').setup() end)
now(function() require('mini.comment').setup() end)
now(function() require('mini.indentscope').setup({
	symbol = "| ",
	options = { try_as_border = true },
}) end)
now(function() require('mini.notify').setup() end)

