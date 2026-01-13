-- Leader keys (must be set before plugins)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- UI settings
vim.g.have_nerd_font = true
vim.opt.background = "dark"
vim.o.termguicolors = true

-- Netrw configuration
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 0
vim.g.netrw_liststyle = 3

-- Editor appearance
vim.opt.fillchars = { eob = " " }
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false
vim.opt.laststatus = 3
vim.opt.cursorline = true
vim.opt.signcolumn = "no"

-- Behavior settings
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.autoread = true

-- Search configuration
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Timing settings
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.autoindent = true

-- Split behavior
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Whitespace display
vim.opt.list = true
vim.opt.listchars = { tab = "| ", trail = "·", nbsp = "␣" }

-- Live preview
vim.opt.inccommand = "split"

-- Scrolling
vim.opt.scrolloff = 20

-- Session management
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Command completion
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })

-- Diff improvements
vim.opt.diffopt:append("linematch:60")

-- Performance
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000

-- Transparent backgrounds
local transparent_highlights = {
  "Normal", "StatusLine", "VertSplit", "TabLine", 
  "LineNr", "SignColumn", "Pmenu", "Search"
}

for _, hl in ipairs(transparent_highlights) do
  vim.cmd("hi " .. hl .. " guibg=NONE ctermbg=NONE")
end

-- Neovide configuration
if vim.g.neovide then
  vim.o.guifont = "ShureTechMono Nerd Font Propo:h11"
  vim.g.neovide_theme = "background"
  
  -- Padding
  local padding = 10
  vim.g.neovide_padding_top = padding
  vim.g.neovide_padding_right = padding
  vim.g.neovide_padding_bottom = padding
  vim.g.neovide_padding_left = padding
  
  -- Performance
  vim.g.neovide_refresh_rate = 75
  vim.g.neovide_refresh_rate_idle = 1
  vim.g.neovide_cursor_vfx_mode = "ripple"
  vim.g.neovide_opacity = 0.90
  vim.g.neovide_scroll_animation_length = 0.3
  
  -- Terminal
  vim.o.laststatus = 0
  vim.cmd([[
    terminal tmux -u attach -t ${HOST} || tmux -u new -s ${HOST}
    startinsert
    autocmd BufLeave term://* quit
  ]])
end
