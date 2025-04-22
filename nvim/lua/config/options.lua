-- Set <space> as the leader key
vim.g.mapleader = " " --  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

-- [[ Setting options ]]

-- netrw
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 0
-- vim.g.netrw_altv = 3
vim.g.netrw_liststyle = 3

-- remove tilde
vim.opt.fillchars = { eob = " " }

-- triggers CursorHold event faster
vim.opt.updatetime = 200

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, for help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false
vim.opt.laststatus = 3

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = "unnamedplus"

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "no"

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Tabs & Indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "| ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Auto Session
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Set retrobox colorscheme
-- vim.cmd("colorscheme wildcharm")
-- vim.g.retrobox_contrast = "high"

-- Set background color
vim.opt.background = "dark" -- "light" for light themes

-- Transparent background for Neovim UI elements
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")     -- Transparent background for normal text
vim.cmd("hi StatusLine guibg=NONE ctermbg=NONE") -- Transparent status line
vim.cmd("hi VertSplit guibg=NONE ctermbg=NONE")  -- Transparent vertical split lines
vim.cmd("hi TabLine guibg=NONE ctermbg=NONE")    -- Transparent tab line
vim.cmd("hi LineNr guibg=NONE ctermbg=NONE")     -- Transparent line numbers
vim.cmd("hi SignColumn guibg=NONE ctermbg=NONE") -- Transparent sign column (for diagnostics)
vim.cmd("hi Pmenu guibg=NONE ctermbg=NONE")      -- Transparent popup menu (e.g., completion)
vim.cmd("hi CursorLine guibg=NONE ctermbg=NONE") -- Transparent cursor line
vim.cmd("hi Search guibg=NONE ctermbg=NONE")     -- Transparent search highlights
