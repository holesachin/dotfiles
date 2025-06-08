-- [[ Basic Autocommands ]]

vim.api.nvim_create_augroup('bufcheck', { clear = true })

-- reload config file on change
vim.api.nvim_create_autocmd('BufWritePost', {
  group   = 'bufcheck',
  pattern = vim.env.MYVIMRC,
  command = 'silent source %'
})

-- highlight yanks
vim.api.nvim_create_autocmd('TextYankPost', {
  group    = 'bufcheck',
  pattern  = '*',
  callback = function() vim.highlight.on_yank { timeout = 500 } end
})

-- start git messages in insert mode
vim.api.nvim_create_autocmd('FileType', {
  group   = 'bufcheck',
  pattern = { 'gitcommit', 'gitrebase', },
  command = 'startinsert | 1'
})

-- pager mappings for Manual
vim.api.nvim_create_autocmd('FileType', {
  group    = 'bufcheck',
  pattern  = 'man',
  callback = function()
    vim.keymap.set('n', '<enter>', 'K', { buffer = true })
    vim.keymap.set('n', '<backspace>', '<c-o>', { buffer = true })
  end
})

-- hide tmux status when vim opens
-- if vim.fn.has('unix') == 1 and vim.fn.getenv('TMUX') then
--   -- Create an augroup
--   local group = vim.api.nvim_create_augroup('tmux_something', {})
--
--   -- Define the autocommands
--   vim.api.nvim_create_autocmd({ 'VimResume', 'VimEnter' }, {
--     group = group,
--     callback = function()
--       vim.fn.system('tmux set status off')
--     end,
--   })
--
--   vim.api.nvim_create_autocmd({ 'VimLeave', 'VimSuspend' }, {
--     group = group,
--     callback = function()
--       vim.fn.system('tmux set status on')
--     end,
--   })
-- end
