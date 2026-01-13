local fn = vim.fn
local loop = vim.loop

local lazypath = fn.stdpath('data') .. '/lazy/lazy.nvim'
if not loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
end

vim.opt.rtp:prepend(lazypath)

local default_icons = {
  cmd = '',
  config = '',
  event = '',
  ft = '',
  init = '',
  keys = '',
  plugin = '',
  runtime = '',
  require = '',
  source = '',
  start = '',
  task = '',
  lazy = '💤 ',
}

require('lazy').setup({
  { import = 'plugins' },
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or default_icons,
  },
})
