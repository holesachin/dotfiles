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

-- -- Start, Stop, Restart, Log commands {{{
-- vim.api.nvim_create_user_command("LspStart", function()
-- 	vim.cmd.e()
-- end, { desc = "Starts LSP clients in the current buffer" })
--
-- vim.api.nvim_create_user_command("LspStop", function(opts)
-- 	for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
-- 		if opts.args == "" or opts.args == client.name then
-- 			client:stop(true)
-- 			vim.notify(client.name .. ": stopped")
-- 		end
-- 	end
-- end, 
-- 	{
-- 		desc = "Stop all LSP clients or a specific client attached to the current buffer.",
-- 		nargs = "?",
-- 		complete = function(_, _, _)
-- 			local clients = vim.lsp.get_clients({ bufnr = 0 })
-- 			local client_names = {}
-- 			for _, client in ipairs(clients) do
-- 				table.insert(client_names, client.name)
-- 			end
-- 			return client_names
-- 		end,
-- 	})
