local api = vim.api
local uv = vim.uv

local augroup = api.nvim_create_augroup("UserConfig", {})
local bufcheck = api.nvim_create_augroup('bufcheck', { clear = true })

-- Autosave functionality
local timer = uv.new_timer()
local autosave_patterns = { "*.lua", "*.ts", "*.tsx", "*.js", "*.jsx", "*.go", "*.html", "*.css", "*.json", "*.vue", "*.svelte" }

local function should_autosave()
	return api.nvim_buf_get_name(0) ~= "" and vim.bo.buflisted
end

local function save()
	vim.cmd("silent w")
	api.nvim_echo({ { "󰄳 saved " .. os.date("%I:%M %p"), "LazyProgressDone" } }, false, {})
	vim.defer_fn(function() api.nvim_echo({}, false, {}) end, 800)
end

-- Config reload
api.nvim_create_autocmd('BufWritePost', {
	group = bufcheck,
	pattern = vim.env.MYVIMRC,
	command = 'silent source %'
})

-- Autosave on insert leave (Lua files)
api.nvim_create_autocmd("InsertLeave", {
	pattern = { "*.lua" },
	callback = function()
		if should_autosave() then
			timer:stop()
			save()
		end
	end,
})

-- Debounced autosave on text changes
api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
	pattern = autosave_patterns,
	callback = function()
		if should_autosave() then
			timer:stop()
			timer:start(300, 0, vim.schedule_wrap(save))
		end
	end,
})

-- Restore cursor position
api.nvim_create_autocmd("BufReadPost", {
	group = augroup,
	callback = function()
		local mark = api.nvim_buf_get_mark(0, '"')
		local lcount = api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Highlight yanked text
api.nvim_create_autocmd('TextYankPost', {
	group = bufcheck,
	pattern = '*',
	callback = function() vim.highlight.on_yank({ timeout = 500 }) end
})

-- Git filetypes
api.nvim_create_autocmd('FileType', {
	group = bufcheck,
	pattern = { 'gitcommit', 'gitrebase' },
	command = 'startinsert | 1'
})

-- Manual page navigation
api.nvim_create_autocmd('FileType', {
	group = bufcheck,
	pattern = 'man',
	callback = function()
		vim.keymap.set('n', '<enter>', 'K', { buffer = true })
		vim.keymap.set('n', '<backspace>', '<c-o>', { buffer = true })
	end
})

-- Help window
api.nvim_create_autocmd('FileType', {
	group = bufcheck,
	pattern = 'help',
	command = 'wincmd o',
})
