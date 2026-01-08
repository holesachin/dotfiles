-- [[ Basic Autocommands ]]

-- Basic autocommands
local augroup = vim.api.nvim_create_augroup("UserConfig", {})
local bufcheck = vim.api.nvim_create_augroup('bufcheck', { clear = true })


-- reload config file on change
vim.api.nvim_create_autocmd('BufWritePost', {
	group   = bufcheck,
	pattern = vim.env.MYVIMRC,
	command = 'silent source %'
})

-- Autosave
local timer = vim.uv.new_timer()

local function save()
	vim.cmd "silent w"
	vim.api.nvim_echo({ { "󰄳 saved " .. os.date "%I:%M %p", "LazyProgressDone" } }, false, {})
	vim.defer_fn(function() vim.api.nvim_echo({}, false, {}) end, 800)
end

vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = { "*.lua" },
	callback = function()
		if vim.api.nvim_buf_get_name(0) ~= "" and vim.bo.buflisted then
			timer:stop()
			save()
		end
	end,
})

-- Autosave with debounce
vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
	pattern = { "*.lua", "*.ts", "*.tsx", "*.js", "*.jsx", "*.go", "*.html", "*.css", "*.json", "*.vue", "*.svelte" },
	callback = function()
		if vim.api.nvim_buf_get_name(0) ~= "" and vim.bo.buflisted then
			timer:stop()
			timer:start(300, 0, vim.schedule_wrap(save))
		end
	end,
})

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup,
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- highlight yanks
vim.api.nvim_create_autocmd('TextYankPost', {
	group    = bufcheck,
	pattern  = '*',
	callback = function() vim.highlight.on_yank { timeout = 500 } end
})

-- start git messages in insert mode
vim.api.nvim_create_autocmd('FileType', {
	group   = bufcheck,
	pattern = { 'gitcommit', 'gitrebase', },
	command = 'startinsert | 1'
})

-- pager mappings for Manual
vim.api.nvim_create_autocmd('FileType', {
	group    = bufcheck,
	pattern  = 'man',
	callback = function()
		vim.keymap.set('n', '<enter>', 'K', { buffer = true })
		vim.keymap.set('n', '<backspace>', '<c-o>', { buffer = true })
	end
})

-- open help in new buffer
vim.api.nvim_create_autocmd('FileType', {
	group    = bufcheck,
	pattern  = 'help',
	command  = 'wincmd o',
})

-- run only if we're inside tmux
-- local function tmux_set(pos)
-- 	if os.getenv("TMUX") then
-- 		vim.system({ "tmux", "set", "-g", "status-position", pos })
-- 	end
-- end

-- when Neovim gains focus → put status bar on top
-- vim.api.nvim_create_autocmd({ "VimEnter", "FocusGained" }, {
-- 	group    = bufcheck,
-- 	callback = function()
-- 		tmux_set("top")
-- 		vim.opt_local.cursorline = true
-- 	end,
-- })

-- when Neovim loses focus OR exits → put status bar at the bottom
-- vim.api.nvim_create_autocmd({ "VimLeavePre", "FocusLost" }, {
-- 	group    = bufcheck,
-- 	callback = function()
-- 		vim.opt_local.cursorline = true
-- 		tmux_set("bottom")
-- 	end,
-- })
